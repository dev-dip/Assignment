import 'dart:convert';
import 'package:assignmentostad/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  late TextEditingController _productNameTEController = TextEditingController();
  late TextEditingController _codeTEController = TextEditingController();
  late TextEditingController _imageTEController = TextEditingController();
  late TextEditingController _unitPriceTEController = TextEditingController();
  late TextEditingController _quantityTEController = TextEditingController();
  late TextEditingController _totalPriceTEController = TextEditingController();
  late final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;
  late Product product;

  @override
  void initState() {
    product = widget.product;
    _productNameTEController = TextEditingController(text: product.productName);
    _codeTEController = TextEditingController(text: product.productCode);
    _imageTEController = TextEditingController(text: product.productImage);
    _unitPriceTEController = TextEditingController(text: product.unitPrice);
    _quantityTEController = TextEditingController(text: product.quantity);
    _totalPriceTEController = TextEditingController(text: product.totalPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _buildTextFormField(),
        ),
      ),
    );
  }

  Widget _buildTextFormField() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: const InputDecoration(labelText: 'Product Name'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTEController,
            decoration: const InputDecoration(labelText: 'Product Code'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid code';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTEController,
            decoration: const InputDecoration(labelText: 'Product Image'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid image';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: const InputDecoration(labelText: 'Unit Price'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid price';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(labelText: 'Quantity'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid quantity';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(labelText: 'Total Price'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid price';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          _inProgress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.grey.shade200,
                    fixedSize: const Size.fromWidth(double.maxFinite),
                  ),
                  onPressed: _onTapUpdateButton,
                  child: const Text('Update Product'),
                ),
        ],
      ),
    );
  }

  void _onTapUpdateButton() {
    if (_formKey.currentState!.validate()) {
      updateProduct();
    }
  }

  Future<void> updateProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse(
        'http://164.68.107.70:6060/api/v1/UpdateProduct/${product.productId}');
    Map<String, dynamic> requestBody = {
      "Img": _imageTEController.text,
      "ProductCode": _codeTEController.text,
      "ProductName": _productNameTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
      "UnitPrice": _unitPriceTEController.text,
    };
    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      _clearTextFields;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product Updated'),
        ),
      );
    }
  }

  void _clearTextFields() {
    _productNameTEController.clear();
    _codeTEController.clear();
    _imageTEController.clear();
    _quantityTEController.clear();
    _unitPriceTEController.clear();
    _totalPriceTEController.clear();
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _codeTEController.dispose();
    _imageTEController.dispose();
    _quantityTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    super.dispose();
  }
}
