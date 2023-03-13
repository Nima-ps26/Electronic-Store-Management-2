import 'package:flutter/material.dart';

class Stock {
  String productName;
  int quantity;
  double price;

  Stock({required this.productName, required this.quantity, required this.price});

  @override
  String toString() {
    return '$productName: $quantity available at \$$price each';
  }
}

void main() {
    String name = "Example Product";
  int quantity = 10;
  double price = 19.99;
  String description = "This is an example product";

  addProduct(productName: name, productQuantity: quantity, productPrice: price, productDescription: description);
  List<Stock> stocks = [
    Stock(productName: 'Laptop', quantity: 10, price: 999.99),
    Stock(productName: 'Smartphone', quantity: 20, price: 599.99),
    Stock(productName: 'Tablet', quantity: 15, price: 399.99),
  ];

  for (Stock stock in stocks) {
    print(stock);
  }
}



void addProduct({required String productName, required int productQuantity, required double productPrice, required String productDescription}) {
  // your code to add the product goes here
}
