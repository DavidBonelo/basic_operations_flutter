import 'package:basic_operations_flutter/widgets/operations_buttons_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/number_field_widget.dart';

class BasicOperationPage extends StatefulWidget {
  const BasicOperationPage({Key? key}) : super(key: key);

  @override
  _BasicOperationPageState createState() => _BasicOperationPageState();
}

class _BasicOperationPageState extends State<BasicOperationPage> {
  List<double> numbers = [0, 0];
  String resultText = '';
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        children: [
          NumberTextField(
            onChanged: (value) => numbers[0] = double.tryParse(value) ?? 0.0,
          ),
          const SizedBox(height: 32.0),
          Center(
            child: OperationsButtonsV2(
              numbers: numbers,
              onResult: (result, operation) => setState(() => resultText = result.toString()),
            ),
          ),
          const SizedBox(height: 16.0),
          NumberTextField(
            onChanged: (value) => numbers[1] = double.tryParse(value) ?? 0.0,
          ),
          const SizedBox(height: 32.0),
          Center(
            child:
                Text('Result:', style: Theme.of(context).textTheme.headline6),
          ),
          const SizedBox(height: 16.0),
          Center(child: Text(resultText)),
        ],
      ),
    );
  }
}
