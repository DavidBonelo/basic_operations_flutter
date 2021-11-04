import 'package:flutter/material.dart';

class OperationsButtonsV2 extends StatefulWidget {
  /// `numbers.length` **must** be >= 2, otherwise `onResult` will do nothing.\
  /// The parameter in the `onResult` callback is the result of the operation
  const OperationsButtonsV2({Key? key, required this.numbers, this.onResult})
      : super(key: key);

  final List<double> numbers;
  final void Function(double value, String operation)? onResult;

  // TODO: add parameter to enable/disable the buttons

  @override
  _OperationsButtonsV2State createState() => _OperationsButtonsV2State();
}

class _OperationsButtonsV2State extends State<OperationsButtonsV2> {
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.0,
      children: [
        FloatingActionButton(
          onPressed: () {
            calculate(widget.numbers, '+');
          },
          child: const Icon(Icons.add),
          // hero tags are to avoid problems if the widget is placed on a scaffold's FAB
          // TODO: use better tags xd 
          heroTag: 'a',
        ),
        FloatingActionButton(
          onPressed: () => calculate(widget.numbers, '-'),
          child: const Icon(Icons.remove),
          heroTag: 'b',
        ),
        FloatingActionButton(
          onPressed: () {
            calculate(widget.numbers, '*');
          },
          child: const Icon(Icons.close),
          heroTag: 'c',
        ),
        FloatingActionButton(
          onPressed: () {
            calculate(widget.numbers, '/');
          },
          child: const Text('/'),
          heroTag: 'd',
        ),
      ],
    );
  }

  void calculate(List<double> numbers, String operation) {
    // * if numbers.length < 2 the function does nothing
    if (numbers.length < 2) return;

    double acumulator = numbers[0];

    switch (operation) {
      case '+':
        for (var i = 0; i < numbers.length - 1; i++) {
          acumulator += numbers[i + 1];
        }
        break;
      case '-':
        for (var i = 0; i < numbers.length - 1; i++) {
          acumulator -= numbers[i + 1];
        }
        break;
      case '*':
        for (var i = 0; i < numbers.length - 1; i++) {
          acumulator *= numbers[i + 1];
        }
        break;
      case '/':
        for (var i = 0; i < numbers.length - 1; i++) {
          acumulator /= numbers[i + 1];
        }
        break;
    }

    result = acumulator;

    if (widget.onResult != null) widget.onResult!(result, operation);
  }
}

// this is the only UI version, I made the v2 as a experiment XD
// this can also be done with a single ValueChanged<int> callback like the bottom navbar
class OperationsButtons extends StatelessWidget {
  const OperationsButtons(
      {Key? key,
      this.onAddition,
      this.onSubtraction,
      this.onMultiplication,
      this.onDivision})
      : super(key: key);

  final VoidCallback? onAddition;
  final VoidCallback? onSubtraction;
  final VoidCallback? onMultiplication;
  final VoidCallback? onDivision;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.0,
      children: [
        FloatingActionButton(
            onPressed: onAddition, child: const Icon(Icons.add)),
        FloatingActionButton(
            onPressed: onSubtraction, child: const Icon(Icons.remove)),
        FloatingActionButton(
            onPressed: onMultiplication, child: const Icon(Icons.close)),
        FloatingActionButton(onPressed: onDivision, child: const Text('/')),
      ],
    );
  }
}
