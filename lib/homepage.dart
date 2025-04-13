import 'package:flutter/material.dart';
import 'hotel.dart';
import 'tour.dart';
import 'visa.dart';
import 'giftcard.dart';
import 'FlightBookingPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Traveler'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Services Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildServiceButton(
                        context,
                        icon: Icons.flight,
                        label: 'Flight',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlightBookingPage()),
                        ),
                      ),
                      _buildServiceButton(
                        context,
                        icon: Icons.hotel,
                        label: 'Hotel',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HotelBookingPage()),
                        ),
                      ),
                      _buildServiceButton(
                        context,
                        icon: Icons.tour,
                        label: 'Tour',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TourPackagePage()),
                        ),
                      ),
                      _buildServiceButton(
                        context,
                        icon: Icons.credit_card,
                        label: 'Visa',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VisaPage()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Divider
            Divider(thickness: 8, color: Colors.grey.shade200),

            // Gift Card Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading:
                        const Icon(Icons.card_giftcard, color: Colors.blue),
                    title: const Text(
                      'Gift Card',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GiftCardPage()),
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Divider(thickness: 8, color: Colors.grey.shade200),

            // Hot Deals Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hot Deals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildDealCard(
                          'Up to 18% Discount',
                          'Special offers on flights',
                          Icons.flight,
                          Colors.blue,
                        ),
                        const SizedBox(width: 16),
                        _buildDealCard(
                          'Up to 11% Off',
                          'Hotel booking discounts',
                          Icons.hotel,
                          Colors.green,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Trending Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trending',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTrendingOption(
                          'Flight',
                          Icons.flight,
                          Colors.blue,
                          context,
                          '/flight',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTrendingOption(
                          'Hotel',
                          Icons.hotel,
                          Colors.green,
                          context,
                          '/hotel',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // This will highlight the Home icon
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/bookings');
              break;
            case 2:
              Navigator.pushNamed(context, '/offers');
              break;
            case 3:
              Navigator.pushNamed(context, '/inbox');
              break;
            case 4:
              Navigator.pushNamed(context, '/profile');
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

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
            ),
            child: const Text(
              'Hi there!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('My Bookings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/bookings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text('Support'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/support');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.flight),
            title: const Text('Flight'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/flight');
            },
          ),
          ListTile(
            leading: const Icon(Icons.hotel),
            title: const Text('Hotel'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/hotel');
            },
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: const Text('Visa'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/visa');
            },
          ),
          ListTile(
            leading: const Icon(Icons.tour),
            title: const Text('Tour'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/tour');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 30, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildDealCard(
      String title, String subtitle, IconData icon, Color color) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingOption(String title, IconData icon, Color color,
      BuildContext context, String route) {
    return GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, route);
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ));
  }
}
