import 'package:flutter/material.dart';

void main() {
  runApp(const AgeConverter());
}

class AgeConverter extends StatelessWidget {
  const AgeConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeConverterState(),
    );
  }
}

class AgeConverterState extends StatefulWidget {
  const AgeConverterState({super.key});

  @override
  _AgeConverterStateState createState() => _AgeConverterStateState();
}

class _AgeConverterStateState extends State<AgeConverterState> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String calculatedAge = '';

  void _calculateAge() {
    if (dayController.text.isEmpty || monthController.text.isEmpty || yearController.text.isEmpty) return;

    int birthDay = int.tryParse(dayController.text) ?? 0;
    int birthMonth = int.tryParse(monthController.text) ?? 0;
    int birthYear = int.tryParse(yearController.text) ?? 0;
    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateTime(birthYear, birthMonth, birthDay);

    if (birthDate.isAfter(currentDate)) return;

    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month || (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }

    setState(() {
      calculatedAge = age.toString();
    });
    ageController.text = calculatedAge;
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
                "Age Calculator",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: dayController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter your birth day e.g. 15",
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.blueGrey,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: monthController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter your birth month e.g. 06",
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.blueGrey,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: yearController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter your birth year e.g. 1990",
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.blueGrey,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: ageController,
                        decoration: InputDecoration(
                          hintText: "Your Age...",
                          border: const OutlineInputBorder(),
                          prefixIcon:
                          Icon(Icons.person, color: Colors.blueGrey),
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
                                  onPressed: _calculateAge,
                                  child: const Text("Calculate Age")))
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