import 'package:flutter/material.dart';
class Product {
  String name;
  int count;

  Product(this.name, this.count);

  void sell(int soldCount) {
    if (soldCount <= count) {
      count -= soldCount;
      print('$soldCount ${name}(s) sold.');
      print('Remaining stock: $count');
    } else {
      print('Insufficient stock!');
    }
  }
}

class Inventory {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
  }

  void sellProduct(String name, int soldCount) {
    var productIndex = products.indexWhere((p) => p.name == name);
    if (productIndex != -1) {
      products[productIndex].sell(soldCount);
    } else {
      print('Product not found!');
    }
  }

  void printInventory() {
    print('Current inventory:');
    for (var product in products) {
      print('${product.name}: ${product.count}');
    }
  }
}
