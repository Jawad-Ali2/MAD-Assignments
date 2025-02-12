import 'package:flutter/material.dart';

void main() {
  runApp(const TimeConverter());
}

class TimeConverter extends StatelessWidget {
  const TimeConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimeConverterState(),
    );
  }
}

class TimeConverterState extends StatefulWidget {
  const TimeConverterState({super.key});

  @override
  _TimeConverterStateState createState() => _TimeConverterStateState();
}

class _TimeConverterStateState extends State<TimeConverterState> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();

  void _convertTime() {
    if (hoursController.text.isEmpty) return;

    double input = double.tryParse(hoursController.text) ?? 0;
    double output = input * 60; // Convert Hours to Minutes

    setState(() {
      minutesController.text = output.toStringAsFixed(2);
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
                "Time Converter (Hours to Minutes)",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: hoursController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Hours",
                          prefixIcon: Icon(Icons.timer, color: Colors.blueGrey),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: minutesController,
                        decoration: InputDecoration(
                          hintText: "Converted Minutes...",
                          border: const OutlineInputBorder(),
                          prefixIcon:
                          Icon(Icons.access_time, color: Colors.blueGrey),
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