import 'package:flutter/material.dart';
import '../../../models/Product.dart';
import '../state/filters_notifier.dart';

class FilteredProductsNotifier extends ChangeNotifier {
  List<Product> _filteredProduct = [];
  List<Product> get filteredProducts => _filteredProduct;

  void updateFilteredProducts(
      List<Product> allProducts, Map<Filter, bool> activeFilters) {
    _filteredProduct = allProducts.where((products) {
      if (activeFilters[Filter.typeNormal]! && !products.typeNormal) {
        return false;
      }
      if (activeFilters[Filter.typeOily]! && !products.typeOily) {
        return false;
      }
      if (activeFilters[Filter.typeDry]! && !products.typeDry) {
        return false;
      }
      if (activeFilters[Filter.typeCombination]! && !products.typeCombination) {
        return false;
      }
      return true;
    }).toList();
    notifyListeners();
  }
}
