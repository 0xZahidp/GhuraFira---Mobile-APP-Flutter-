import 'package:flutter/material.dart';
import 'homepage.dart';
import 'bookings.dart';
import 'offers.dart';
import 'inbox.dart';
import 'profile.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _buildCategoryCard(
                    context,
                    icon: Icons.flight,
                    title: 'Flight',
                    color: Colors.blue,
                  ),
                  _buildCategoryCard(
                    context,
                    icon: Icons.hotel,
                    title: 'Hotel',
                    color: Colors.green,
                  ),
                  _buildCategoryCard(
                    context,
                    icon: Icons.tour,
                    title: 'Tour',
                    color: Colors.orange,
                  ),
                  _buildCategoryCard(
                    context,
                    icon: Icons.help_outline,
                    title: 'General',
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 4, // Highlights Profile (since Support isn't in bottom nav)
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/bookings');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/offers');
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

  Widget _buildCategoryCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Navigate to specific FAQ page or show questions
          _showQuestions(context, title);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color.withOpacity(0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 12),
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
        ),
      ),
    );
  }

  void _showQuestions(BuildContext context, String category) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$category FAQs',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: _getQuestionsForCategory(category)
                      .map((question) => ListTile(
                            title: Text(question),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {
                              // Navigate to answer page or show answer
                              _showAnswer(context, question);
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAnswer(BuildContext context, String question) {
    Navigator.pop(context); // Close the questions sheet
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(question),
          content: Text(_getAnswerForQuestion(question)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  List<String> _getQuestionsForCategory(String category) {
    switch (category) {
      case 'Flight':
        return [
          'How do I book a flight?',
          'Can I change my flight date?',
          'What is the baggage allowance?',
        ];
      case 'Hotel':
        return [
          'How do I find hotels near me?',
          'What is the cancellation policy?',
          'Do you have pet-friendly hotels?',
        ];
      case 'Tour':
        return [
          'How do I book a tour package?',
          'What should I bring on a tour?',
          'Are tour guides included?',
        ];
      case 'General':
        return [
          'How do I contact customer service?',
          'What payment methods do you accept?',
          'How do I reset my password?',
        ];
      default:
        return [];
    }
  }

  String _getAnswerForQuestion(String question) {
    // In a real app, you would have proper answers from your database
    return 'This is a sample answer for "$question". In a real application, this would contain detailed information to help the user with their query.';
  }
}