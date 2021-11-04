import 'package:flutter/material.dart';

import 'n_operation_page.dart';

class NumberDropdownPage extends StatefulWidget {
  const NumberDropdownPage({Key? key}) : super(key: key);

  @override
  _NumberDropdownPageState createState() => _NumberDropdownPageState();
}

class _NumberDropdownPageState extends State<NumberDropdownPage> {
  int _dropdownValue = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Insert how many numbers do you want to operate with:'),
          _buildDropdown(),
          const SizedBox(height: 16.0),
          // _buildButton(),
        ],
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<int>(
      value: _dropdownValue,
      hint: const Text('0'),
      items: _buildDropdownItems(),
      onChanged: (newValue) => setState(() {
        if (newValue != null) {
          _dropdownValue = newValue;
          Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (context) => OperationPage(
                  numQuantity: newValue,
                ),
              ));
        }
      }),
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownItems() {
    List<DropdownMenuItem<int>> items = [];

    for (var i = 2; i < 21; i++) {
      items.add(
        DropdownMenuItem(child: Text('$i'), value: i),
      );
    }

    return items;
  }
}
