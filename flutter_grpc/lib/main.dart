import 'package:flutter/material.dart';
import 'package:flutter_grpc/protos/generated/ecommerce/product_info.pb.dart';
import 'package:flutter_grpc/services/product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _productService = ProductService();
  late ProductId _productId;
  late Product _product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  _addProduct();
                },
                child: const Text('add product')),
            TextButton(
                onPressed: () {
                  _getProduct();
                },
                child: const Text('get product')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _addProduct() async {
    _productId = await _productService.addProduct(
        product: Product(id: '10001', name: 'Macbook Pro', desc: 'computer'));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'add a product success, the product id is ${_productId.value}')));
  }

  void _getProduct() async {
    _product = await _productService.getProduct(productId: _productId);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'get a product success, the product is ${_product.toString()}')));
  }
}
