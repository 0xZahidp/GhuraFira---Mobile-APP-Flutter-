import 'package:flutter/material.dart';
import 'bookings.dart';
import 'flight.dart';
import 'giftcard.dart';
import 'homepage.dart';
import 'hotel.dart';
import 'inbox.dart';
import 'login.dart';
import 'offers.dart';
import 'profile.dart';
import 'signup.dart';
import 'splash_screen.dart';
import 'support.dart';
import 'tour.dart';
import 'visa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GhuraFira App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => HomePage(),
        '/bookings': (context) => BookingsPage(),
        '/flight': (context) => FlightPage(),
        '/giftcard': (context) => GiftCardPage(),
        '/hotel': (context) => HotelPage(),
        '/inbox': (context) => InboxPage(),
        '/login': (context) => LoginPage(),
        '/offers': (context) => OffersPage(),
        '/profile': (context) => ProfilePage(),
        '/signup': (context) => SignupPage(),
        '/support': (context) => SupportPage(),
        '/tour': (context) => TourPage(),
        '/visa': (context) => VisaPage(),
      },
    );
  }
}