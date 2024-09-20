import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSwitched = false;

  void _toggleSwitch() {
    setState(() {
      _isSwitched = !_isSwitched;
    });
  }

  void _showSnackbar(BuildContext context) {
    var snackBar = SnackBar(
      content: Text(
        _isSwitched ? 'Blue Color' : 'Green Color',
        style: const TextStyle(fontSize: 20),
      ),
      duration: const Duration(milliseconds: 50),
    );
    // Use ScaffoldMessenger to show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons In Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                onPressed: () {
                  _toggleSwitch();
                  // Call the Snackbar with the correct context
                  _showSnackbar(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                      color: _isSwitched ? Colors.green : Colors.blue,
                      width: 2.0), // Set the border color and width
                ),
                color: _isSwitched ? Colors.blue : Colors.green,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _isSwitched ? 'Blue Color' : 'Green Color',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.star,
                      color: Colors
                          .grey, // Setting the icon color to green (hex code)
                      size: 30.0,
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            const DropdownExample(),
          ],
        ),
      ),
    );
  }
}

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  DropdownExampleState createState() => DropdownExampleState();
}

class DropdownExampleState extends State<DropdownExample> {
  void _showSnackbar(context, newValue) {
    var snackBar = SnackBar(
      content: Text(newValue),
      duration: const Duration(seconds: 1),
    );

    // Use ScaffoldMessenger to show the SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 5),
            borderRadius: BorderRadius.circular(15)),
        child: DropdownButton<String>(
          value: selectedCountry,
          onChanged: (String? newValue) {
            setState(() {
              selectedCountry = newValue!;
            });
            _showSnackbar(context, newValue);
          },
          items: <String>['India', 'USA', 'UK', 'Canada']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: const Text(
            'Select an option',
            style: TextStyle(
              color: Colors.grey, // Hint text color
              fontSize: 18,
            ),
          ),
          dropdownColor: const Color.fromARGB(235, 255, 255, 255),
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          underline: Container(
            height: 2,
            color: Colors.grey,
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
          isExpanded: true,
        ),
      ),
    );
  }
}
