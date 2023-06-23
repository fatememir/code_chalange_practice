import 'package:flutter/material.dart';

class Factorial extends StatefulWidget {
  const Factorial({super.key});

  @override
  FactorialState createState() => FactorialState();
}

class FactorialState extends State<Factorial> {
  int result = 0;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text('Factorial'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Enter number"),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    _calculateFactorial(textEditingController.text);
                  },
                  child: const Text("Calculate")),
              const SizedBox(
                height: 24,
              ),
              Text("result: $result")
            ],
          ),
        ),
      ),
    );
  }

  _calculateFactorial(String inputtedValue) {
    int amount = 1;

    for (int i = 1; i <= int.parse(inputtedValue); i++) {
      amount = amount * i;
    }

    setState(() {
      result = amount;
    });
  }
}
