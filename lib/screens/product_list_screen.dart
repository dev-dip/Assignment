import 'dart:convert';
import 'package:assignmentostad/models/product.dart';
import 'package:assignmentostad/screens/add_new_product_screen.dart';
import 'package:assignmentostad/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              _getProductList();
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade300,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const AddProductScreen();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: _inProgress
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: productList[index],
              onTapDelete: () => _deleteProduct(productList[index].productId,context),
            );
          }),
    );
  }

  Future<void> _getProductList() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);

    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
          productId: item['_id'] ?? '',
          productName: item['ProductName'] ?? '',
          productCode: item['ProductCode'] ?? '',
          productImage: item['Img'] ?? '',
          unitPrice: item['UnitPrice'] ?? '',
          quantity: item['Qty'] ?? '',
          totalPrice: item['TotalPrice'] ?? '',
          createAt: item['CreatedDate'] ?? '',
        );
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }

  Future<void> _deleteProduct(String productId, context) async {
    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/DeleteProduct/$productId');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      _getProductList();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('deleted'),
        ),
      );
    }
  }
}