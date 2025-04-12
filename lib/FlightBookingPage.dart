import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'FlightResults.dart';

class FlightBookingPage extends StatefulWidget {
  const FlightBookingPage({Key? key}) : super(key: key);

  @override
  State<FlightBookingPage> createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage>
    with SingleTickerProviderStateMixin {
  String fromCity = 'Dhaka';
  String fromAirport = 'DAC, Hazrat Shahjalal International Airport';

  String toCity = "Cox's Bazar";
  String toAirport = "CXB, Cox's Bazar Airport";

  DateTime departureDate = DateTime.now();
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  String selectedOption = 'One Way'; // Default selected option

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMM').format(departureDate);
    String formattedDay = DateFormat('EEEE').format(departureDate);

    handleChangeOption(String label) {
      setState(() {
        // Update the selected option when a button is tapped
        selectedOption = label;
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('Flight Booking'),
        centerTitle: true,
        elevation: 1,
        leading: const BackButton(),
      ),
      body: FadeTransition(
        opacity: _fadeIn,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _tripTypeSelector(selectedOption, handleChangeOption),
              const SizedBox(height: 24),
              _locationTile('From', fromCity, fromAirport, (city, airport) {
                setState(() {
                  fromCity = city;
                  fromAirport = airport;
                });
              }),
              const Divider(),
              _locationTile('To', toCity, toAirport, (city, airport) {
                setState(() {
                  toCity = city;
                  toAirport = airport;
                });
              }),
              const Divider(),
              _dateSelector('Departure', formattedDate, formattedDay, (picked) {
                setState(() {
                  departureDate = picked;
                });
              }),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text('+ Add Return Date',
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              _infoTile('Travelers', '01'),
              _infoTile('Class', 'Economy'),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade500,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FlightResultsPage()),
                    );
                  },
                  icon: const Icon(Icons.search, color: Colors.white),
                  label: const Text('Search',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 24),
              _infoCard(),
              const SizedBox(height: 24),
              const Text('Hot Deals',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              _dealImagesRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tripTypeSelector(
      String selectedOption, Function(String) onOptionSelected) {
    final List<String> tripTypes = ['One Way', 'Round Trip', 'Multi City'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tripTypes.map((type) {
        bool isSelected = type == selectedOption;
        return _tabButton(type, isSelected, onOptionSelected);
      }).toList(),
    );
  }

  Widget _tabButton(
      String label, bool selected, Function(String) onOptionSelected) {
    return GestureDetector(
      onTap: () => onOptionSelected(label),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.orange[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
          border: selected
              ? Border.all(color: Colors.orange.shade700, width: 2)
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.orange.shade800 : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _locationTile(String title, String city, String airport,
      Function(String, String) onSelected) {
    return GestureDetector(
      onTap: () => _showCitySelector(onSelected),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(),
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(city,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Text(airport, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _dateSelector(
      String title, String date, String day, Function(DateTime) onSelected) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: departureDate,
          firstDate: DateTime(2024),
          lastDate: DateTime(2030),
        );
        if (picked != null) {
          onSelected(picked);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(),
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(date,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Text(day, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label.toUpperCase(),
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _infoCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.flight_takeoff, color: Colors.blueAccent),
          const SizedBox(width: 12),
          const Expanded(
            child: Text('How to book flights easily with our app?',
                style: TextStyle(fontSize: 14)),
          ),
          TextButton(
            onPressed: () {},
            child:
                const Text('Watch Video', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  Widget _dealImagesRow() {
    return Row(
      children: [
        Expanded(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('assets/images/download.jpeg',
              height: 90, fit: BoxFit.cover),
        )),
        const SizedBox(width: 10),
        Expanded(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset('assets/images/download.jpeg',
              height: 90, fit: BoxFit.cover),
        )),
      ],
    );
  }

  void _showCitySelector(Function(String, String) onSelected) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              title: const Text("Dhaka"),
              subtitle:
                  const Text("DAC, Hazrat Shahjalal International Airport"),
              onTap: () {
                Navigator.pop(context);
                onSelected(
                    "Dhaka", "DAC, Hazrat Shahjalal International Airport");
              },
            ),
            ListTile(
              title: const Text("Chattogram"),
              subtitle: const Text("CGP, Shah Amanat International Airport"),
              onTap: () {
                Navigator.pop(context);
                onSelected(
                    "Chattogram", "CGP, Shah Amanat International Airport");
              },
            ),
            ListTile(
              title: const Text("Cox's Bazar"),
              subtitle: const Text("CXB, Cox's Bazar Airport"),
              onTap: () {
                Navigator.pop(context);
                onSelected("Cox's Bazar", "CXB, Cox's Bazar Airport");
              },
            ),
          ],
        );
      },
    );
  }
}
