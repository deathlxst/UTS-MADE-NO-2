import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double num1 = 0;
  double num2 = 0;
  String operation = '';
  String result = '';

  void calculate() {
    if (num1 != 0 && num2 != 0 && operation.isNotEmpty) {
      switch (operation) {
        case '+':
          setState(() {
            result = (num1 + num2).toString();
          });
          break;
        case '-':
          setState(() {
            result = (num1 - num2).toString();
          });
          break;
        case '*':
          setState(() {
            result = (num1 * num2).toString();
          });
          break;
        case '/':
          setState(() {
            result = (num1 / num2).toString();
          });
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Number 1',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  num1 = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Number 2',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  num2 = double.parse(value);
                });
              },
            ),
            SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        operation == '+' ? Colors.blue : Colors.grey,
                    child: IconButton(
                      icon: Text('+'),
                      onPressed: () {
                        setState(() {
                          operation = '+';
                        });
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor:
                        operation == '-' ? Colors.blue : Colors.grey,
                    child: IconButton(
                      icon: Text('-'),
                      onPressed: () {
                        setState(() {
                          operation = '-';
                        });
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor:
                        operation == '*' ? Colors.blue : Colors.grey,
                    child: IconButton(
                      icon: Text('*'),
                      onPressed: () {
                        setState(() {
                          operation = '*';
                        });
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor:
                        operation == '/' ? Colors.blue : Colors.grey,
                    child: IconButton(
                      icon: Text('/'),
                      onPressed: () {
                        setState(() {
                          operation = '/';
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculate,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Result: $result',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}