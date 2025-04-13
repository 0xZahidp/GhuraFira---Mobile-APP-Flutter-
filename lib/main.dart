import 'package:flutter/material.dart';
import 'bookings.dart';
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
import 'FlightBookingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/flight': (context) => FlightBookingPage(),
        '/giftcard': (context) => GiftCardPage(),
        '/hotel': (context) => HotelBookingPage(),
        '/inbox': (context) => InboxPage(),
        '/login': (context) => LoginPage(),
        '/offers': (context) => OffersPage(),
        '/profile': (context) => ProfilePage(),
        '/signup': (context) => SignupPage(),
        '/support': (context) => SupportPage(),
        '/tour': (context) => TourPackagePage(),
        '/visa': (context) => VisaPage(),
      },
    );
  }
}
