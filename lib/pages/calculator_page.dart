import 'package:basic_operations_flutter/widgets/operations_buttons_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/number_field_widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  List<double> numbers = [0, 0];
  double result = 0.0;
  final textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberTextField(
            controller: textEditingController1,
            onChanged: (value) => numbers[0] = double.tryParse(value) ?? 0.0,
          ),
          const SizedBox(height: 32.0),
          Center(
            child: OperationsButtonsV2(
              numbers: numbers,
              onResult: (result,operation) => setState(() {
                textEditingController1.text = result.toString();
                numbers[0] = result;
              }),
            ),
          ),
          const SizedBox(height: 16.0),
          NumberTextField(
            onChanged: (value) => numbers[1] = double.tryParse(value) ?? 0.0,
          ),
        ],
      ),
    );
  }
}
