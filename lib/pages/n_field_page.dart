import 'package:flutter/material.dart';

import 'n_operation_page.dart';

class NumberFieldPage extends StatefulWidget {
  const NumberFieldPage({Key? key}) : super(key: key);

  @override
  State<NumberFieldPage> createState() => _NumberFieldPageState();
}

class _NumberFieldPageState extends State<NumberFieldPage> {
  int? quantity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Insert how many numbers do you want to operate with:'),
          _buildInputField(),
          const SizedBox(height: 16.0),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return TextField(
      expands: false,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      onChanged: (input) {
        setState(() {
          quantity = int.tryParse(input);
        });
      },
    );
  }

  Widget _buildButton() => ElevatedButton(
      child: const Text('Send'),
      onPressed: quantity != null ? _loadOperationsPage : null);

  void _loadOperationsPage() {
    if (quantity! >= 100) {
      showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Text('$quantity are too much >_<')]),
        ),
      );
      return;
    }
    if (quantity! >= 20) {
      showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(
              '$quantity are a lot, are you sure do you want to continue?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => OperationPage(numQuantity: quantity!),
                  ),
                );
              },
              child: const Text('YES'),
            ),
          ],
        ),
      );
      return;
    }
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) => OperationPage(numQuantity: quantity!),
      ),
    );
  }
}
