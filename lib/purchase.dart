import 'package:flutter/material.dart';

class Product {
  String name;
  String description;
  double price;
  String imageUrl;

  Product({required this.name, required this.description, required this.price, required this.imageUrl});
}

class Cart {
  List<Product> items = [];

  void addItem(Product item) {
    items.add(item);
  }

  void removeItem(int index) {
    items.removeAt(index);
  }

  double getTotal() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }
}

class CheckoutScreen extends StatelessWidget {
  final Cart cart;

  CheckoutScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(cart.items[index].imageUrl),
                  title: Text(cart.items[index].name),
                  subtitle: Text(cart.items[index].description),
                  trailing: Text('\$${cart.items[index].price}'),
                  onTap: () {
                    cart.removeItem(index);
                  },
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total'),
                Text('\$${cart.getTotal()}'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Implement payment processing logic here
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Order Placed'),
                    content: Text('Your order has been placed.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Place Order'),
          ),
        ],
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final Cart cart;

  ProductDetailScreen({required this.product, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Image.network(product.imageUrl),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    cart.addItem(product);
                    Navigator.pop(context);
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class ProductListScreen extends StatelessWidget {
  final List<Product> products = [    Product(      name: 'Apple iPhone 12 Pro Max',      description: '6.7-inch Super Retina XDR display. Ceramic Shield with four times better drop performance. A14 Bionic chip. And Night mode on every camera.',      price: 1099.00,      imageUrl: 'https://cdn.pixabay.com/photo/2021/03/19/15/31/iphone-6106978_960_720.png',    ),    Product(      name: 'Samsung Galaxy S21 Ultra',      description: '6.8" Quad HD+ Dynamic AMOLED 2X screen. 108MP high-resolution camera. Advanced 5nm processor. 5,000mAh battery.',      price: 1199.99,      imageUrl: 'https://cdn.pixabay.com/photo/2021/06/14/15/24/samsung-galaxy-s21-ultra-6331585_960_720.png',    ),    Product(      name: 'Apple MacBook Pro',      description: 'M1 chip with 8-core CPU and 8-core GPU. 8GB unified memory. 256GB SSD storage. 13.3-inch Retina display. Up to 20 hours of battery life.',      price: 1299.00,      imageUrl: 'https://cdn.pixabay.com/photo/2021/02/10/10/02/macbook-pro-5991136_960_720.png',    ),    Product(      name: 'Dell XPS 13',      description: '11th Gen Intel Core i7-1165G7 processor. 13.4-inch FHD+ display. 16GB LPDDR4x memory. 512GB SSD storage. Intel Iris Xe Graphics.',      price: 1399.99,      imageUrl: 'https://cdn.pixabay.com/photo/2021/02/16/15/17/dell-xps-13-6010805_960_720.png',    ),  ];

  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CheckoutScreen(cart: cart),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductDetailScreen(product: products[index], cart: cart),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(products[index].imageUrl),
                    SizedBox(height: 8.0),
                    Text(
                      products[index].name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '\$${products[index].price}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}

