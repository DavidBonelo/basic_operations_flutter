import 'package:basic_operations_flutter/pages/basic_operation_page.dart';
import 'package:basic_operations_flutter/pages/calculator_page.dart';
import 'package:basic_operations_flutter/pages/n_dropdown_page.dart';
import 'package:basic_operations_flutter/pages/n_field_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Basic Operations'),
      ),
      bottomNavigationBar: _buildNavBar(),
      body: _innerPages()[_navBarIndex],
      
    );
  }

  Widget _buildNavBar() {
    return SafeArea(
      child: BottomNavigationBar(
        currentIndex: _navBarIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Container(), label: 'Basic'),
          BottomNavigationBarItem(icon: Container(), label: 'Calculator'),
          BottomNavigationBarItem(icon: Container(), label: 'N Drop'),
          BottomNavigationBarItem(icon: Container(), label: 'N Field'),
        ],
        onTap: (index) {
          setState(() {
            _navBarIndex = index;
          });
        },
      ),
    );
  }

  List<Widget> _innerPages() {
    return [
      const BasicOperationPage(),
      const CalculatorPage(),
      const NumberDropdownPage(),
      const NumberFieldPage(),
    ];
  }
}
