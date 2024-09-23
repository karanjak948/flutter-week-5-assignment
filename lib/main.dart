import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String buttonText = 'Click Me!'; // Initial button text
  String message = 'Welcome to the Flutter Assignment!'; // Initial message

  void _handleButtonClick() {
    setState(() {
      buttonText = 'Clicked!'; // Change button text after click
      message = 'Button was clicked!'; // Change the message after button click
    });
    print('Button clicked!'); // Print message to console
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with loading indicator
          Image.network(
            'https://www.kindpng.com/picc/m/421-4212275_transparent-flutter-logo-hd-png-download.png', // Background image
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child; // Return the loaded image
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                ); // Show loading indicator while loading
              }
            },
            errorBuilder:
                (BuildContext context, Object error, StackTrace? stackTrace) {
              return Center(
                  child: Text('Failed to load image',
                      style: TextStyle(color: Colors.red)));
            },
          ),
          Container(
            color: Colors.black54, // Optional: Add a semi-transparent overlay
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center content
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    message, // Display the current message
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20), // Spacing between widgets
                  ElevatedButton(
                    onPressed:
                        _handleButtonClick, // Button click triggers functionality
                    child: Text(buttonText), // Display the button text
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
