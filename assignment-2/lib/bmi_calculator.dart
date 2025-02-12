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
  final TextEditingController weightField = TextEditingController();
  final TextEditingController feetField = TextEditingController();
  final TextEditingController inchesField = TextEditingController();

  bool isConverted = false;
  double calculatedBMI = 0;

  void _calculateBMI() {
    if (weightField.text.isEmpty ||
        feetField.text.isEmpty ||
        inchesField.text.isEmpty) return;

    double feetToMeters = double.tryParse(feetField.text)! * 0.3048;
    double inchesToMeters = double.tryParse(inchesField.text)! * 0.0254;

    double heightInMeters = feetToMeters + inchesToMeters;

    print("here");
    setState(() {
      calculatedBMI = double.tryParse(weightField.text)! /
          (heightInMeters * heightInMeters);
      isConverted = true;
    });
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
                "BMI Calculator",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: weightField,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter Your Weight In Kgs",
                          prefixIcon: Icon(
                            Icons.thermostat,
                            color: Colors.blueGrey,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Height", textAlign: TextAlign.left)),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: feetField,
                        decoration: InputDecoration(
                          hintText: "Feet",
                          border: const OutlineInputBorder(),
                          prefixIcon:
                              Icon(Icons.thermostat, color: Colors.blueGrey),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: inchesField,
                        decoration: InputDecoration(
                          hintText: "Inches",
                          border: const OutlineInputBorder(),
                          prefixIcon:
                              Icon(Icons.thermostat, color: Colors.blueGrey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      isConverted
                          ? Text(
                              "BMI: ${calculatedBMI.toStringAsFixed(2)} kg/m2",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            )
                          : Text(""),
                      Row(
                        children: [
                          Expanded(
                              child: FilledButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(
                                        const EdgeInsets.all(20)),
                                  ),
                                  onPressed: _calculateBMI,
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
