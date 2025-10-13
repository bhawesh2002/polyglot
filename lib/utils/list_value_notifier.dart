import 'package:flutter/foundation.dart';

class ListValueNotifier<T> extends ChangeNotifier {
  List<T> _value;
  ListValueNotifier(this._value);
  List<T> get value => _value;
  set value(List<T> val) {
    if (_value == val) {
      return;
    }
    _value = val;
    notifyListeners();
  }

  void add(T val) {
    _value.add(val);
    notifyListeners();
  }

  void addAt(T val, int index) {
    _value[index] = val;
    notifyListeners();
  }

  void remove(T val) {
    _value.remove(val);
    notifyListeners();
  }

  void removeAt(int index) {
    _value.removeAt(index);
    notifyListeners();
  }

  void removeWhere(bool Function(T) test) {
    _value.removeWhere(test);
    notifyListeners();
  }

  void removeDuplicates() {
    _value = _value.toSet().toList();
    notifyListeners();
  }

  void sort([int Function(T a, T b)? compare]) {
    _value.sort(compare);
    notifyListeners();
  }

  void addAll(List<T> list) {
    _value.addAll(list);
    notifyListeners();
  }

  void replaceItem(T old, T val) {
    final index = _value.indexOf(old);
    if (index >= 0) {
      _value[index] = val;
      notifyListeners();
    }
  }

  void replaceItemAt(int index, T val) {
    if (index >= 0) {
      _value[index] = val;
      notifyListeners();
    }
  }

  void clear() {
    _value = [];
    notifyListeners();
  }
}
