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
  final TextEditingController belgiumTimeField = TextEditingController();
  final TextEditingController pakistanTimeField = TextEditingController();

  String convertedTime = '';

  void _convertTime() {
    if (belgiumTimeField.text.isEmpty) return;

    int hoursPart = int.tryParse(belgiumTimeField.text.split(':')[0]) as int;
    String minutesPart = belgiumTimeField.text.split(':')[1].toString();

    hoursPart = (hoursPart + 4) % 24;
    setState(() {
      convertedTime = "$hoursPart:$minutesPart";
    });

    pakistanTimeField.text = convertedTime;
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
                "Belgium To Pakistan Time Converter",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: belgiumTimeField,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter Belgium Time [24-hours format] eg: 24:00",
                          prefixIcon: Icon(
                            Icons.thermostat,
                            color: Colors.blueGrey,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: pakistanTimeField,
                        decoration: InputDecoration(
                          hintText: "Converted Pakistan Time (PST)...",
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
                                  onPressed: _convertTime,
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
