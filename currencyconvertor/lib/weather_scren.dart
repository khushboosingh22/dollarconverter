import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      // Parse the input and handle any potential errors
      try {
        double input = double.parse(textEditingController.text);
        result = input * 81;
      } catch (e) {
        // If input is not a valid number, reset the result
        result = 0;
      }
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Currency converter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Colors.black,
              child: Text(
                result.toStringAsFixed(2),
                style:const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your amount in USD",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: convert,
                  // style: ButtonStyle(
              //   // elevation: WidgetStatePropertyAll(15), in elevationbutton
              //   backgroundColor:const WidgetStatePropertyAll(Colors.black),
              //   foregroundColor:const WidgetStatePropertyAll(Colors.white),
              //   // fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50),
              //   minimumSize:const WidgetStatePropertyAll(Size(double.infinity, 50),
              //   ),
              //   shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10),
              //   )),


              //   ),
                // fixedSize: WidgetStatePropertyAll(Size(double.infinity, 50),
                // minimumSize:const Size(double.infinity, 50),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  // foregroundcolor=textcolor
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
