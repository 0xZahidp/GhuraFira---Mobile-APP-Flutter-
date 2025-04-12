import 'package:flutter/material.dart';
import 'homepage.dart';
import 'bookings.dart';
import 'inbox.dart';
import 'profile.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  int _selectedFilter = 0; // 0: All, 1: Flight, 2: Hotel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter Section (fixed)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton('All', 0),
                _buildFilterButton('Flight', 1),
                _buildFilterButton('Hotel', 2),
              ],
            ),
          ),
          
          // Content Section (scrollable)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildOfferCard(
                  'Up to 18% Discount*',
                  'City bank\nAy Ex\nUp to 11% Discount*',
                  'assets/images/offer1.jpeg',
                ),
                const SizedBox(height: 16),
                _buildOfferCard(
                  'Flight',
                  'On Int\'l Flight Bookings',
                  'assets/images/offer2.png',
                ),
                const SizedBox(height: 16),
                _buildOfferCard(
                  'Flight',
                  'On International Flight Booking',
                  'assets/images/offer3.jpeg',
                ),
                const SizedBox(height: 16),
                _buildOfferCard(
                  'Up to 10% Discount*',
                  'Domestic Flight Booking\n7% Discount*',
                  'assets/images/offer4.png',
                ),
                const SizedBox(height: 16),
                _buildOfferCard(
                  'Flight',
                  'On Domestic Flight Booking for Mobile Banking',
                  'assets/images/offer5.jpeg',
                ),
                const SizedBox(height: 16),
                _buildOfferCard(
                  'Up to 7% Discount*',
                  'Special weekend offers',
                  'assets/images/offer6.png',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2, // Highlights Offers
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/bookings');
              break;
            case 2:
              // Already on offers page
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/inbox');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text, int index) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedFilter = index;
        });
      },
      style: TextButton.styleFrom(
        foregroundColor: _selectedFilter == index ? Colors.blue : Colors.grey,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: _selectedFilter == index ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildOfferCard(String title, String description, String imagePath) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}