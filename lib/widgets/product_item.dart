
import 'package:assignmentostad/models/product.dart';
import 'package:assignmentostad/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
        required this.product,
        required this.onTapDelete});

  final Product product;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      elevation: 0,
      color: Colors.grey.shade200,
      child: ListTile(
        title: Text(product.productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Code: ${product.productCode}'),
            Text('Unit Price: \$${product.unitPrice}'),
            Text('Quantity: ${product.quantity}'),
            Text('Total Price: \$${product.totalPrice}'),
            const Divider(),
            _buildUpdateButtonBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateButtonBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UpdateProductScreen(product: product);
                },
              ),
            );
          },
          label: const Text('Edit'),
          icon: const Icon(Icons.edit),
        ),
        TextButton.icon(
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          onPressed: onTapDelete,
          label: const Text('Delete'),
          icon: const Icon(Icons.delete_outline),
        ),
      ],
    );
  }
}