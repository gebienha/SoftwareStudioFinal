import 'package:flutter/material.dart';

enum Filter {
  typeNormal,
  typeOily,
  typeDry,
  typeCombination,
}

class FiltersNotifier extends ChangeNotifier {
  Map<Filter, bool> _filters = {
    Filter.typeNormal: false,
    Filter.typeOily: false,
    Filter.typeDry: false,
    Filter.typeCombination: false,
  };

  Map<Filter, bool> get filters => _filters;

  void setFilters(Map<Filter, bool> chosenFilters) {
    _filters = chosenFilters;
    notifyListeners();
  }

  void setFilter(Filter filter, bool isActive) {
    _filters[filter] = isActive;
    notifyListeners();
  }
}
