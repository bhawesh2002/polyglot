import 'package:flutter/material.dart';
import 'package:polyglot/ui/home/views/home_view.dart';
import 'package:polyglot/utils/extension.dart';

class AppSidebar extends StatefulWidget {
  const AppSidebar({super.key});

  @override
  State<AppSidebar> createState() => _SidebarState();
}

class _SidebarState extends State<AppSidebar> {
  @override
  Widget build(BuildContext context) {
    final Map<int, Map<String, dynamic>> tabs = {
      0: {"name": "Dashboard", "icon": Icons.home, "screen": HomeView()},
      1: {
        "name": "Transcriptions",
        "icon": Icons.transcribe_rounded,
        "detail": "View, edit or delete your transcriptions",
      },
      2: {
        "name": "AI Models",
        "icon": Icons.lightbulb,
        "detail": "Add new AI models or configure existing ones",
      },
      3: {
        "name": "Backup and Export",
        "icon": Icons.restore,

        "detail": "Backup/Export your transcriptions with ease",
      },
      4: {
        "name": "Settings",
        "icon": Icons.settings,
        "detail": "Modify app settings to match your preferences",
      },
    };
    return Padding(
      padding:
          context.devicePadding + const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(22)),
        color: const Color.fromARGB(255, 230, 230, 227),
        elevation: 12,
        child: SizedBox(
          width: context.deviceWt * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ...List.generate(tabs.length, (index) {
                final tab = tabs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(tab!['name']),
                    subtitle: tab.containsKey('detail') == true
                        ? Text(tab['detail'])
                        : null,
                    leading: Icon(tab['icon']),
                    onTap: () {
                      if (tab.containsKey('screen')) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => tab['screen'],
                          ),
                        );
                      }
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
