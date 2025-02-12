import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const FriendshipCalculator());
}

class FriendshipCalculator extends StatelessWidget {
  const FriendshipCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FriendshipCalculatorState(),
    );
  }
}

class FriendshipCalculatorState extends StatefulWidget {
  const FriendshipCalculatorState({super.key});

  @override
  _FriendshipCalculatorStateState createState() =>
      _FriendshipCalculatorStateState();
}

class _FriendshipCalculatorStateState extends State<FriendshipCalculatorState> {
  final _formKey = GlobalKey<FormState>();

  // Controller to get TextField Text
  final TextEditingController meterField = TextEditingController();
  final TextEditingController centimeterField = TextEditingController();

  double calculatedLength = 0;

  void _convertLength() {
    if (meterField.text.isEmpty) return;

    setState(() {
      calculatedLength = double.tryParse(meterField.text)! * 100;
    });

    centimeterField.text = calculatedLength.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://thumbs.dreamstime.com/b/autumn-colorful-forest-road-nature-landscape-vertical-image-narrow-winding-road-autumn-forest-nature-bright-colorful-landscape-102169317.jpg"),
            opacity: 0.2,
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Length Converter",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: meterField,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter Length In Meters",
                          prefixIcon: Icon(
                            Icons.thermostat,
                            color: Colors.blueGrey,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: centimeterField,
                        decoration: InputDecoration(
                          hintText: "Converted Centimeters...",
                          border: const OutlineInputBorder(),
                          prefixIcon:
                              Icon(Icons.thermostat, color: Colors.blueGrey),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 2)),
                        ),
                        enabled: false,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: FilledButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(
                                        const EdgeInsets.all(20)),
                                  ),
                                  onPressed: _convertLength,
                                  child: const Text("Convert")))
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
