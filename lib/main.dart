import 'package:flutter/material.dart';
import 'flight_booking_page.dart'; // Import the page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const FlightBookingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
