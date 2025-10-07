import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: const CalcButtons(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalcButtons extends StatefulWidget {
  const CalcButtons({super.key});

  @override
  State<CalcButtons> createState() => _CalcButtonsState();
}

class _CalcButtonsState extends State<CalcButtons> {
  int counter = 0;

  Widget buildButton(String text, {Color color = Colors.deepPurpleAccent}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CalcButton(
          text,
          color: color,
          onValue: (v) => setState(() => counter++),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(
                '$counter',
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 48),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    buildButton('AC'),
                    buildButton('%'),
                    buildButton('DEL'),
                    buildButton('/'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('7', color: Colors.white10),
                    buildButton('8', color: Colors.white10),
                    buildButton('9', color: Colors.white10),
                    buildButton('X'),
                  ],
                ),
                Row(
                  children: [
                    buildButton('4', color: Colors.white10),
                    buildButton('5', color: Colors.white10),
                    buildButton('6', color: Colors.white10),
                    buildButton('-')
                  ],
                ),
                Row(
                  children: [
                    buildButton('1', color: Colors.white10),
                    buildButton('2', color: Colors.white10),
                    buildButton('3', color: Colors.white10),
                    buildButton('+')
                  ],
                ),
                Row(
                  children: [
                    buildButton('00', color: Colors.white10),
                    buildButton('0', color: Colors.white10),
                    buildButton(',', color: Colors.white10),
                    buildButton('=', color: Colors.deepPurple),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CalcButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function(String)? onValue;

  const CalcButton(
      this.text, {
        this.color = Colors.deepPurpleAccent,
        this.onValue,
        super.key
      });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonSize = constraints.maxWidth;
        return ElevatedButton(
          onPressed: () => onValue?.call(text),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(buttonSize, buttonSize),
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            backgroundColor: color,
          ),
          child: Text(text, style: const TextStyle(fontSize: 24)),
        );
      },
    );
  }
}
