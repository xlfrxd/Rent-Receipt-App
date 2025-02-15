import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent Receipt App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  DateTime selectedDate = DateTime.now(); // Initial date

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2150));
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget build(BuildContext context) {
    String selectedPaymentType = "Full";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                child: Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () => _selectDate(context),
                
                // TODO: Handle user input
                ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Received From", border: OutlineInputBorder()),
              onChanged: (value) {
                // TODO: Handle user input
              },
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Address", border: OutlineInputBorder()),
              onChanged: (value) {
                // TODO: Handle user input
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Sum of Pesos", border: OutlineInputBorder()),
              validator: (value) {
                // TODO: Handle user input
                if (value == null || value.isEmpty) {
                  return "Please enter an amount";
                }
                return null;
              },
            ),
            DropdownButtonFormField(
              items: ["Full", "Partial"].map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (newValue) {
                selectedPaymentType = newValue!;
              },
              decoration: InputDecoration(
                  labelText: "Payment Type", border: OutlineInputBorder()),
            ),
            GestureDetector(
              onPanUpdate: (details) {
                // TODO: Capture Signature Drawing
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // TODO:Handle receipt creation
                },
                child: Text("Generate Receipt"))
          ],
        ),
      ),
    );
  }
}
