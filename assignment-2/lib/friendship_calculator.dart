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
  final TextEditingController firstNameField = TextEditingController();
  final TextEditingController secondNameField = TextEditingController();

  bool isCalculated = false;
  int calculatedPercentage = 0;

  void _calculateFriendShip() {
    if (firstNameField.text.isEmpty || secondNameField.text.isEmpty) return;

    final percentage = Random().nextInt(11) + 90;

    setState(() {
      calculatedPercentage = percentage;
      isCalculated = true;
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
                "Friendship Calculator",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: isCalculated
                        ? [
                            Text(
                              "Friendship between",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "${firstNameField.text} & ${secondNameField.text}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "is",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "$calculatedPercentage% strong",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: FilledButton(
                                        style: ButtonStyle(
                                          padding: WidgetStateProperty.all(
                                              const EdgeInsets.all(20)),
                                        ),
                                        onPressed: () {
                                          isCalculated = false;
                                        },
                                        child:
                                            const Text("Calculate Another!")))
                              ],
                            )
                          ]
                        : [
                            TextFormField(
                              controller: firstNameField,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                hintText: "Enter Your Name",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: secondNameField,
                              decoration: InputDecoration(
                                hintText: "Enter Your Friend's Name",
                                border: const OutlineInputBorder(),
                                prefixIcon:
                                    Icon(Icons.person, color: Colors.blueGrey),
                              ),
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
                                        onPressed: _calculateFriendShip,
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
