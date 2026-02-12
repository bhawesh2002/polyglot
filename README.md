# Graphiti Integration Implementation Plan

## Executive Summary

This document outlines the integration of Graphiti (temporal knowledge graphs) into the Madeline backend to provide unified, persistent memory across conversations, tasks, goals, schedules, content, and decisions. Graphiti will replace/augment the current Zep-based memory system with a single queryable graph per user.

**Location:** `backend/src/madeline/core/ai/memory/graphiti/`

**Key Benefits:**
- Single source of truth for user context (conversation + structured data)
- Temporal awareness (track when facts were true, handle updates)
- Rich relationship modeling (tasks ↔ goals ↔ decisions ↔ content)
- Semantic + graph search for better context retrieval
- Multi-tenant isolation via `group_id`

---

## 1. File Structure

```
backend/src/madeline/core/ai/memory/graphiti/
├── __init__.py                    # Package exports
├── client.py                      # Main GraphitiClient wrapper
├── config.py                      # Configuration and settings
├── types.py                       # Custom entity and edge type definitions
├── schemas.py                     # Pydantic models for API contracts
├── service.py                     # High-level service layer (business logic)
├── helpers.py                     # Utility functions and converters
├── episode_builder.py             # Episode construction from domain objects
├── search.py                      # Search helpers and query builders
├── sync.py                        # Background sync for product data → graph
└── tests/
    ├── __init__.py
    ├── conftest.py                # Test fixtures
    ├── test_client.py
    ├── test_service.py
    ├── test_types.py
    ├── test_episode_builder.py
    └── test_search.py
```

---

## 2. Environment Variables & Configuration

### 2.1 Required Environment Variables

Add to `.env`:

```bash
# Graphiti Configuration
GRAPHITI_ENABLED=true                                    # Feature flag
GRAPHITI_TELEMETRY_ENABLED=false                        # Disable anonymous telemetry

# Graph Database (Neo4j or FalkorDB)
# Option 1: Neo4j (recommended for production)
NEO4J_URI=bolt://localhost:7687
NEO4J_USER=neo4j
NEO4J_PASSWORD=your_neo4j_password

# Option 2: FalkorDB (Redis-based, lighter weight)
# REDIS_HOST=localhost
# REDIS_PORT=6379
# REDIS_PASSWORD=your_redis_password

# LLM Configuration (defaults to OpenAI)
OPENAI_API_KEY=your_openai_api_key
GRAPHITI_MODEL=gpt-4o-mini                              # Main model for extraction
GRAPHITI_SMALL_MODEL=gpt-4o-mini                        # Small model for quick tasks
GRAPHITI_EMBEDDING_MODEL=text-embedding-3-small         # Embedding model
GRAPHITI_EMBEDDING_DIM=1536                             # Embedding dimensions

# Concurrency Control
GRAPHITI_SEMAPHORE_LIMIT=10                             # Max concurrent LLM calls (adjust based on rate limits)

# Optional: Alternative LLM Providers
# ANTHROPIC_API_KEY=your_anthropic_key
# GOOGLE_API_KEY=your_google_key
# GROQ_API_KEY=your_groq_key
```

### 2.2 Configuration Class (`config.py`)

```python
"""Graphiti configuration."""
from typing import Optional
from pydantic import Field
from pydantic_settings import BaseSettings


class GraphitiConfig(BaseSettings):
    """Graphiti integration configuration."""
    
    # Feature flag
    enabled: bool = Field(default=False, alias="GRAPHITI_ENABLED")
    telemetry_enabled: bool = Field(default=False, alias="GRAPHITI_TELEMETRY_ENABLED")
    
    # Database
    neo4j_uri: Optional[str] = Field(default=None, alias="NEO4J_URI")
    neo4j_user: Optional[str] = Field(default="neo4j", alias="NEO4J_USER")
    neo4j_password: Optional[str] = Field(default=None, alias="NEO4J_PASSWORD")
    
    redis_host: Optional[str] = Field(default=None, alias="REDIS_HOST")
    redis_port: Optional[int] = Field(default=6379, alias="REDIS_PORT")
    redis_password: Optional[str] = Field(default=None, alias="REDIS_PASSWORD")
    
    # LLM
    openai_api_key: Optional[str] = Field(default=None, alias="OPENAI_API_KEY")
    model: str = Field(default="gpt-4o-mini", alias="GRAPHITI_MODEL")
    small_model: str = Field(default="gpt-4o-mini", alias="GRAPHITI_SMALL_MODEL")
    embedding_model: str = Field(default="text-embedding-3-small", alias="GRAPHITI_EMBEDDING_MODEL")
    embedding_dim: int = Field(default=1536, alias="GRAPHITI_EMBEDDING_DIM")
    
    # Concurrency
    semaphore_limit: int = Field(default=10, alias="GRAPHITI_SEMAPHORE_LIMIT")
    
    class Config:
        env_file = ".env"
        case_sensitive = False
    
    def validate_config(self) -> None:
        """Validate configuration."""
        if not self.enabled:
            return
        
        # Must have either Neo4j or Redis/FalkorDB configured
        has_neo4j = self.neo4j_uri and self.neo4j_password
        has_redis = self.redis_host
        
        if not (has_neo4j or has_redis):
            raise ValueError(
                "Graphiti requires either Neo4j (NEO4J_URI, NEO4J_PASSWORD) "
                "or FalkorDB (REDIS_HOST) to be configured"
            )
        
        # Must have LLM API key
        if not self.openai_api_key:
            raise ValueError("Graphiti requires OPENAI_API_KEY to be configured")


# Global config instance
graphiti_config = GraphitiConfig()
```

---

## 3. Custom Entity & Edge Types (`types.py`)

Define domain-specific types for Madeline's data model:

```python
"""Custom entity and edge types for Madeline domain."""
from datetime import datetime
from typing import Optional
from pydantic import BaseModel, Field


# ============================================================================
# ENTITY TYPES
# ============================================================================

class Person(BaseModel):
    """A person (user, team member, or contact)."""
    email: Optional[str] = Field(None, description="Email address")
    role: Optional[str] = Field(None, description="Role or title")
    department: Optional[str] = Field(None, description="Department")
    location: Optional[str] = Field(None, description="Location or timezone")


class Task(BaseModel):
    """A task or action item."""
    status: Optional[str] = Field(None, description="Task status (todo, in_progress, done)")
    priority: Optional[str] = Field(None, description="Priority level (low, medium, high, critical)")
    due_date: Optional[datetime] = Field(None, description="Due date")
    estimated_hours: Optional[float] = Field(None, description="Estimated hours to complete")


class Goal(BaseModel):
    """A strategic goal."""
    goal_type: Optional[str] = Field(None, description="Goal type (adaptive, timeframe)")
    timeframe: Optional[str] = Field(None, description="Timeframe (this_week, quarter, year)")
    dvf_desirable: Optional[float] = Field(None, description="Desirability score (0-10)")
    dvf_viable: Optional[float] = Field(None, description="Viability score (0-10)")
    dvf_feasible: Optional[float] = Field(None, description="Feasibility score (0-10)")
    mission_alignment: Optional[float] = Field(None, description="Mission alignment score (0-100)")
    ethos_alignment: Optional[float] = Field(None, description="Ethos alignment score (0-100)")
    trends_alignment: Optional[float] = Field(None, description="Trends alignment score (0-100)")
    progress: Optional[float] = Field(None, description="Progress percentage (0-100)")


class ContentPiece(BaseModel):
    """A piece of content (post, article, etc)."""
    content_type: Optional[str] = Field(None, description="Content type (post, article, video)")
    platform: Optional[str] = Field(None, description="Target platform")
    status: Optional[str] = Field(None, description="Status (draft, scheduled, published)")
    scheduled_date: Optional[datetime] = Field(None, description="Scheduled publish date")
    published_date: Optional[datetime] = Field(None, description="Published date")


class Decision(BaseModel):
    """A logged decision."""
    decision_type: Optional[str] = Field(None, description="Decision type (strategic, tactical, operational)")
    status: Optional[str] = Field(None, description="Status (pending, approved, rejected)")
    approved_by: Optional[str] = Field(None, description="Who approved")
    approval_date: Optional[datetime] = Field(None, description="When approved")


class Schedule(BaseModel):
    """A scheduled event or time block."""
    event_type: Optional[str] = Field(None, description="Event type (meeting, task, deadline)")
    start_time: Optional[datetime] = Field(None, description="Start time")
    end_time: Optional[datetime] = Field(None, description="End time")
    duration_hours: Optional[float] = Field(None, description="Duration in hours")


class Signal(BaseModel):
    """A market/cultural/brand signal."""
    signal_type: Optional[str] = Field(None, description="Signal type (brand, market, customer, competitor)")
    sentiment: Optional[str] = Field(None, description="Sentiment (positive, neutral, negative)")
    relevance_score: Optional[float] = Field(None, description="Relevance score (0-100)")
    source: Optional[str] = Field(None, description="Source of signal")


# ============================================================================
# EDGE TYPES
# ============================================================================

class Assignment(BaseModel):
    """Assignment relationship (person assigned to task/goal)."""
    assigned_date: Optional[datetime] = Field(None, description="When assigned")
    role: Optional[str] = Field(None, description="Role in assignment (owner, contributor)")


class PartOf(BaseModel):
    """Part-of relationship (task part of goal, subtask part of task)."""
    contribution: Optional[float] = Field(None, description="Contribution percentage (0-100)")


class RelatesTo(BaseModel):
    """Generic relation between entities."""
    relation_type: Optional[str] = Field(None, description="Type of relationship")
    strength: Optional[float] = Field(None, description="Relationship strength (0-1)")


class ScheduledFor(BaseModel):
    """Scheduling relationship."""
    time_slot: Optional[str] = Field(None, description="Time slot identifier")
    conflicts_with: Optional[str] = Field(None, description="UUID of conflicting item")


class LinkedTo(BaseModel):
    """Link between content and other entities."""
    link_type: Optional[str] = Field(None, description="Link type (supports, promotes, discusses)")


class Decided(BaseModel):
    """Decision relationship."""
    decision_date: Optional[datetime] = Field(None, description="When decision was made")
    confidence: Optional[float] = Field(None, description="Confidence level (0-100)")


# ============================================================================
# TYPE MAPPINGS
# ============================================================================

# Entity types dictionary for Graphiti
ENTITY_TYPES = {
    "Person": Person,
    "Task": Task,
    "Goal": Goal,
    "ContentPiece": ContentPiece,
    "Decision": Decision,
    "Schedule": Schedule,
    "Signal": Signal,
}

# Edge type mappings (which edges are valid between which entity pairs)
EDGE_TYPE_MAP = {
    # Person relationships
    ("Person", "Task"): ["Assignment"],
    ("Person", "Goal"): ["Assignment"],
    ("Person", "Decision"): ["Decided"],
    
    # Task relationships
    ("Task", "Goal"): ["PartOf", "RelatesTo"],
    ("Task", "Task"): ["PartOf", "RelatesTo"],  # Subtasks
    ("Task", "Schedule"): ["ScheduledFor"],
    ("Task", "ContentPiece"): ["LinkedTo"],
    
    # Goal relationships
    ("Goal", "Goal"): ["RelatesTo"],
    ("Goal", "ContentPiece"): ["LinkedTo"],
    ("Goal", "Decision"): ["RelatesTo"],
    ("Goal", "Signal"): ["RelatesTo"],
    
    # Content relationships
    ("ContentPiece", "Goal"): ["LinkedTo"],
    ("ContentPiece", "Signal"): ["RelatesTo"],
    
    # Fallback for any entity pair
    ("Entity", "Entity"): ["RelatesTo"],
}

# Edge types dictionary
EDGE_TYPES = {
    "Assignment": Assignment,
    "PartOf": PartOf,
    "RelatesTo": RelatesTo,
    "ScheduledFor": ScheduledFor,
    "LinkedTo": LinkedTo,
    "Decided": Decided,
}
```

---

## 4. Graphiti Client (`client.py`)

Main wrapper around the Graphiti library:

```python
"""Graphiti client wrapper."""
import logging
from typing import Optional, List, Dict, Any
from datetime import datetime
from contextlib import asynccontextmanager

from graphiti_core import Graphiti
from graphiti_core.nodes import EpisodeType
from graphiti_core.search.search_config_recipes import (
    EDGE_HYBRID_SEARCH_RRF,
    NODE_HYBRID_SEARCH_RRF,
)

from madeline.core.ai.memory.graphiti.config import graphiti_config
from madeline.core.ai.memory.graphiti.types import ENTITY_TYPES, EDGE_TYPES, EDGE_TYPE_MAP


logger = logging.getLogger(__name__)


class GraphitiClient:
    """Wrapper around Graphiti for Madeline integration."""
    
    def __init__(self):
        """Initialize Graphiti client."""
        self._client: Optional[Graphiti] = None
        self._initialized = False
    
    async def initialize(self) -> None:
        """Initialize Graphiti connection and indices."""
        if not graphiti_config.enabled:
            logger.info("Graphiti is disabled via config")
            return
        
        try:
            graphiti_config.validate_config()
            
            # Initialize Graphiti with Neo4j or FalkorDB
            if graphiti_config.neo4j_uri:
                logger.info(f"Initializing Graphiti with Neo4j at {graphiti_config.neo4j_uri}")
                self._client = Graphiti(
                    graphiti_config.neo4j_uri,
                    graphiti_config.neo4j_user,
                    graphiti_config.neo4j_password,
                )
            elif graphiti_config.redis_host:
                logger.info(f"Initializing Graphiti with FalkorDB at {graphiti_config.redis_host}")
                # FalkorDB initialization (if using)
                # self._client = Graphiti(...) with FalkorDB config
                pass
            
            # Build indices and constraints (only needed once per database)
            await self._client.build_indices_and_constraints()
            
            self._initialized = True
            logger.info("Graphiti client initialized successfully")
            
        except Exception as e:
            logger.error(f"Failed to initialize Graphiti: {e}")
            raise
    
    async def close(self) -> None:
        """Close Graphiti connection."""
        if self._client:
            await self._client.close()
            self._initialized = False
            logger.info("Graphiti client closed")
    
    def is_ready(self) -> bool:
        """Check if client is ready."""
        return self._initialized and self._client is not None
    
    # ========================================================================
    # EPISODE OPERATIONS
    # ========================================================================
    
    async def add_episode(
        self,
        name: str,
        content: str,
        episode_type: EpisodeType,
        source_description: str,
        reference_time: datetime,
        group_id: str,
        entity_types: Optional[Dict[str, Any]] = None,
        edge_types: Optional[Dict[str, Any]] = None,
        edge_type_map: Optional[Dict[tuple, List[str]]] = None,
    ) -> None:
        """Add an episode to the graph."""
        if not self.is_ready():
            logger.warning("Graphiti client not ready, skipping episode add")
            return
        
        try:
            # Use Madeline's custom types if not overridden
            entity_types = entity_types or ENTITY_TYPES
            edge_types = edge_types or EDGE_TYPES
            edge_type_map = edge_type_map or EDGE_TYPE_MAP
            
            await self._client.add_episode(
                name=name,
                episode_body=content,
                source=episode_type,
                source_description=source_description,
                reference_time=reference_time,
                group_id=group_id,
                entity_types=entity_types,
                edge_types=edge_types,
                edge_type_map=edge_type_map,
            )
            
            logger.info(f"Added episode: {name} (group_id={group_id})")
            
        except Exception as e:
            logger.error(f"Failed to add episode: {e}")
            raise
    
    async def add_episode_bulk(
        self,
        episodes: List[Dict[str, Any]],
        group_id: str,
    ) -> None:
        """Add multiple episodes in bulk."""
        if not self.is_ready():
            logger.warning("Graphiti client not ready, skipping bulk episode add")
            return
        
        try:
            from graphiti_core.utils.bulk_utils import RawEpisode
            
            raw_episodes = [
                RawEpisode(
                    name=ep["name"],
                    content=ep["content"],
                    source=ep.get("source", EpisodeType.json),
                    source_description=ep.get("source_description", "Bulk import"),
                    reference_time=ep.get("reference_time", datetime.utcnow()),
                )
                for ep in episodes
            ]
            
            await self._client.add_episode_bulk(raw_episodes)
            
            logger.info(f"Added {len(episodes)} episodes in bulk (group_id={group_id})")
            
        except Exception as e:
            logger.error(f"Failed to add bulk episodes: {e}")
            raise
    
    # ========================================================================
    # SEARCH OPERATIONS
    # ========================================================================
    
    async def search(
        self,
        query: str,
        group_id: str,
        center_node_uuid: Optional[str] = None,
        num_results: int = 10,
    ) -> List[Any]:
        """Search the graph for relevant facts (edges)."""
        if not self.is_ready():
            logger.warning("Graphiti client not ready, returning empty results")
            return []
        
        try:
            results = await self._client.search(
                query=query,
                group_id=group_id,
                center_node_uuid=center_node_uuid,
                num_results=num_results,
            )
            
            logger.info(f"Search returned {len(results)} results for query: {query[:50]}")
            return results
            
        except Exception as e:
            logger.error(f"Search failed: {e}")
            return []
    
    async def search_nodes(
        self,
        query: str,
        group_id: str,
        limit: int = 10,
    ) -> List[Any]:
        """Search for entity nodes (not edges/facts)."""
        if not self.is_ready():
            logger.warning("Graphiti client not ready, returning empty results")
            return []
        
        try:
            config = NODE_HYBRID_SEARCH_RRF.model_copy(deep=True)
            config.limit = limit
            
            results = await self._client._search(
                query=query,
                group_id=group_id,
                config=config,
            )
            
            logger.info(f"Node search returned {len(results.nodes)} nodes")
            return results.nodes
            
        except Exception as e:
            logger.error(f"Node search failed: {e}")
            return []
    
    # ========================================================================
    # TRIPLET OPERATIONS
    # ========================================================================
    
    async def add_triplet(
        self,
        source_node: Any,
        edge: Any,
        target_node: Any,
    ) -> None:
        """Add a fact triplet (source -> edge -> target)."""
        if not self.is_ready():
            logger.warning("Graphi