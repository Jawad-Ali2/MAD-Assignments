import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyConverter());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const CurrencyConverterScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: const Duration(seconds: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.swap_vert,
                size: 100.0,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                "Currency Converter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controller to get TextField Text
  final TextEditingController firstCurrency = TextEditingController();
  final TextEditingController secondCurrency = TextEditingController();

  // For Swap Button
  bool isSwapped = false;

  double _convertedCurrency = 0.0;
  final double exchangeRate = 280.0;

  // Icons for textField
  IconData firstCurrencyIcon = Icons.attach_money;
  IconData secondCurrencyIcon = Icons.currency_rupee;

  // Logic for currency swap
  void _swapCurrencies() {
    setState(() {
      String temp = firstCurrency.text;
      firstCurrency.text = secondCurrency.text;
      secondCurrency.text = temp;
      isSwapped = !isSwapped;
      if (!isSwapped) secondCurrency.text = "";

      // Swap the currency icons
      IconData tempIcon = firstCurrencyIcon;
      firstCurrencyIcon = secondCurrencyIcon;
      secondCurrencyIcon = tempIcon;
    });
  }

  void _convertCurrency() {
    double inputAmount = double.tryParse(firstCurrency.text) ?? 0.0;
    setState(() {
      _convertedCurrency =
          isSwapped ? inputAmount / exchangeRate : inputAmount * exchangeRate;

      // toStringAsFixed converts to double representation of input
      secondCurrency.text = _convertedCurrency.toStringAsFixed(2);
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
                "Currency Converter",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: firstCurrency,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Enter amount",
                          prefixIcon: Icon(firstCurrencyIcon, color: Colors.blueGrey,),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 10),
                      FilledButton(
                          onPressed: _swapCurrencies,
                          child: const Icon(Icons.swap_vert)),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: secondCurrency,
                        decoration: InputDecoration(
                          hintText: "Converted Amount",
                          border: const OutlineInputBorder(),
                          prefixIcon: Icon(secondCurrencyIcon, color: Colors.blueGrey),
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
                                  onPressed: _convertCurrency,
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
