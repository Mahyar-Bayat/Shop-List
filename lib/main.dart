import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      home: ShoppingList(products: <Product>[
        Product(name: 'Egg', price: 100),
        Product(name: 'Cola', price: 100),
        Product(name: 'Chips', price: 100),
        Product(name: 'Mouse', price: 100),
        Product(name: 'Dog', price: 100),
        Product(name: 'Chicken', price: 100),
        Product(name: 'Cow', price: 100),
        Product(name: 'Cat', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
        Product(name: 'Egg', price: 100),
      ]),
    );
  }
}

class Product {
  final String name;
  final int price;

  Product({required this.name, required this.price});
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({required this.products});

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> shoppingCart = Set<Product>();

  void handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        shoppingCart.remove(product);
      } else {
        shoppingCart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            onCartChanged: handleCartChanged,
            inCart: shoppingCart.contains(product),
          );
        }).toList(),
      ),
    );
  }
}

class ShoppingListItem extends StatelessWidget {
  final onCartChanged;
  final bool inCart;
  final Product product;

  ShoppingListItem(
      {required this.onCartChanged,
      required this.inCart,
      required this.product});

  Color getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }
  TextStyle? getTextStyle(BuildContext context){
    if (inCart){
      return TextStyle(
          color: Colors.black54,
          decoration: TextDecoration.lineThrough
      );
    }
    else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
        print(inCart);
      },
      leading: CircleAvatar(
        backgroundColor: getColor(context),
        // backgroundColor: Theme.of(context).primaryColor,
        // backgroundImage: AssetImage('assets/1.png'),
        child: Text(
          product.name[0],
          style: TextStyle(fontSize: 25, color: Colors.white60),
        ),
      ),
      title: Text(product.name ,style: getTextStyle(context)),
      // title: Text(
      //   product.name  + "     \nPrice : " + product.price.toString(),
      //   style: TextStyle(
      //     fontSize: 25,
      //   ),
      // ),
    );
  }
}
