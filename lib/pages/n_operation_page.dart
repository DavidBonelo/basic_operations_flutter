import 'package:flutter/material.dart';

import '../widgets/number_field_widget.dart';
import '../widgets/operations_buttons_widget.dart';
import '../utils.dart';

class OperationPage extends StatefulWidget {
  const OperationPage({Key? key, required this.numQuantity}) : super(key: key);

  final int numQuantity;

  @override
  _OperationPageState createState() => _OperationPageState();
}

class _OperationPageState extends State<OperationPage> {
  final List<TextEditingController> _textControllers = [];
  List<double> _numbers = [0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: OperationsButtonsV2(
        numbers: _numbers,
        onResult: _showResultAlert,
      ),
      appBar: AppBar(title: const Text('N Operations')),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 120.0),
          shrinkWrap: true,
          itemCount: widget.numQuantity,
          itemBuilder: _buildFields,
        ),
      ),
    );
  }

  Widget _buildFields(BuildContext context, int index) {
    // creates the controllers on demand
    if (_textControllers.length >= index + 1) {
    } else {
      var newController = TextEditingController();
      _textControllers.add(newController);
      // print('created controller #$index');
    }
    return NumberTextField(
        controller: _textControllers[index],
        onChanged: (newValue) {
          _updateNumbers();
        });
  }

  // Reads the text from every controller and updates _numbers
  void _updateNumbers() {
    List<double> newNumbers = [];

    for (var controller in _textControllers) {
      double? number = double.tryParse(controller.text);
      if (number != null) newNumbers.add(number);
    }

    // _numbers = newNumbers.length >=2 ? newNumbers : [0, 0]; // simplified
    _numbers = newNumbers.length >= 2
        ? newNumbers
        : newNumbers.isNotEmpty
            ? [newNumbers[0], 0]
            : [0, 0];
    // print(_numbers);

    // Rebuilds the OperationsButtonsV2 widget with the updated _numbers
    setState(() {});
  }

  void _showResultAlert(double value, String operation) {
    String alertContent = '';

    for (var number in _numbers) {
      alertContent += '${doubleToIntString(number)} $operation ';
    }

    // cuts the last space and symbol
    alertContent = alertContent.replaceRange(alertContent.length - 3, null, '');
    // print(value);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$alertContent equals to:'),
            const SizedBox(height: 16.0),
            Center(
              child: Text(
                doubleToIntString(value),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
