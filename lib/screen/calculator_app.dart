import 'package:flutter/material.dart';

enum Operation { add, subtract, multiply, divide }

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _firstNumController = TextEditingController();
  final TextEditingController _secondNumController = TextEditingController();
  double _result = 0;
  Operation? _selectedOperation;

  void _calculate() {
    double num1 = double.tryParse(_firstNumController.text) ?? 0;
    double num2 = double.tryParse(_secondNumController.text) ?? 0;
    switch (_selectedOperation) {
      case Operation.add:
        _result = num1 + num2;
        break;
      case Operation.subtract:
        _result = num1 - num2;
        break;
      case Operation.multiply:
        _result = num1 * num2;
        break;
      case Operation.divide:
        _result = num2 != 0 ? num1 / num2 : double.infinity;
        break;
      default:
        _result = 0; // Default to 0 if no operation is selected
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNumController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _secondNumController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: Operation.values.map((operation) {
                return ListTile(
                  title:
                      Text(operation.toString().split('.').last.capitalize()),
                  leading: Radio<Operation>(
                    value: operation,
                    groupValue: _selectedOperation,
                    onChanged: (Operation? value) {
                      setState(() {
                        _selectedOperation = value;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
