import 'package:flutter/material.dart';

class VisaApp extends StatelessWidget {
  const VisaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VisaPage(),
    );
  }
}

class VisaPage extends StatefulWidget {
  const VisaPage({super.key});

  @override
  State<VisaPage> createState() => _VisaPageState();
}

class _VisaPageState extends State<VisaPage> {
  String selectedCountry = 'Turkey';
  DateTime? entryDate;
  DateTime? exitDate;
  int travellers = 1;

  Future<void> _selectDate(BuildContext context, bool isEntryDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      setState(() {
        if (isEntryDate) {
          entryDate = picked;
        } else {
          exitDate = picked;
        }
      });
    }
  }

  void _selectCountry() async {
    List<String> countries = [
      'Turkey',
      'USA',
      'UK',
      'Germany',
      'Canada',
      'Japan'
    ];
    String? picked = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return ListView(
          children: countries.map((country) {
            return ListTile(
              title: Text(country),
              onTap: () => Navigator.pop(context, country),
            );
          }).toList(),
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedCountry = picked;
      });
    }
  }

  void _selectTravellers() async {
    int? picked = await showModalBottomSheet<int>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(7, (index) {
            int count = index + 1;
            return ListTile(
              title: Text('$count Traveller${count > 1 ? 's' : ''}'),
              onTap: () => Navigator.pop(context, count),
            );
          }),
        );
      },
    );

    if (picked != null) {
      setState(() {
        travellers = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C6FB),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'VISA',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B4F9C),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _selectCountry,
                      child: visaOptionTile(
                          Icons.location_on, selectedCountry, 'Country'),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: visaOptionTile(
                          Icons.calendar_today,
                          'Date of Entry',
                          entryDate != null
                              ? '${entryDate!.day}/${entryDate!.month}/${entryDate!.year}'
                              : 'Select Date'),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: visaOptionTile(
                          Icons.calendar_today_outlined,
                          'Date of Exit',
                          exitDate != null
                              ? '${exitDate!.day}/${exitDate!.month}/${exitDate!.year}'
                              : 'Select Date'),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _selectTravellers,
                      child: visaOptionTile(Icons.person, 'Travelers',
                          '$travellers Traveller${travellers > 1 ? 's' : ''}'),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        // You can navigate or handle data here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0C1F3E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                      ),
                      child: const Text('View Offers'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.tealAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_forward, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Track Visa Application Status',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF0F1841), Color(0xFF302D69)]),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.location_on, color: Colors.white),
                  Icon(Icons.favorite_border, color: Colors.white),
                  Icon(Icons.person_outline, color: Colors.white),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget visaOptionTile(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF3D6ECF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              )
            ],
          )
        ],
      ),
    );
  }
}
