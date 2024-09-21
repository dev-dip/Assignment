import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
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
            onPressed: _onTapAddProductButton,
            child: const Text('Add Product'),
          ),
        ],
      ),
    );
  }

  void _onTapAddProductButton() {
    if (_formKey.currentState!.validate()) {
      addNewProduct();
      Navigator.pop(context);
    }
  }

  Future<void> addNewProduct() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
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
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey.shade700,
          content: const Text('new product added'),
        ),
      );
    }
    _inProgress = false;
    setState(() {});
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