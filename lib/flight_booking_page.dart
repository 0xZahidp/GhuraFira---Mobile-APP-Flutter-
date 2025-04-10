import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'FlightResults.dart';

class FlightBookingPage extends StatefulWidget {
  const FlightBookingPage({Key? key}) : super(key: key);

  @override
  State<FlightBookingPage> createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage> {
  String fromCity = 'Dhaka';
  String fromAirport = 'DAC, Hazrat Shahjalal International Airport';

  String toCity = "Cox's Bazar";
  String toAirport = "CXB, Cox's Bazar Airport";

  DateTime departureDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd MMM').format(departureDate);
    String formattedDay = DateFormat('EEEE').format(departureDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flights'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _tripTypeSelector(),
            const SizedBox(height: 20),
            _locationTile('From', fromCity, fromAirport, (city, airport) {
              setState(() {
                fromCity = city;
                fromAirport = airport;
              });
            }),
            _locationTile('To', toCity, toAirport, (city, airport) {
              setState(() {
                toCity = city;
                toAirport = airport;
              });
            }),
            _dateSelector('Departure', formattedDate, formattedDay, (picked) {
              setState(() {
                departureDate = picked;
              });
            }),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('+ ADD RETURN DATE', style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 10),
            _infoTile('TRAVELERS', '01'),
            _infoTile('CLASS', 'Economy'),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlightResults(
                        fromCity: fromCity,
                        toCity: toCity,
                        departureDate: departureDate,
                      ),
                    ),
                  );
                },
                child: const Text('Search', style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.flight_takeoff, color: Colors.black54),
                  const SizedBox(width: 10),
                  const Expanded(child: Text('How to Book Flight?')),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Watch Video', style: TextStyle(color: Colors.blue)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Hot Deals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Image.asset('assets/download.jpeg', height: 80, fit: BoxFit.cover),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Image.asset('assets/download.jpeg', height: 80, fit: BoxFit.cover),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _tripTypeSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tabButton('One Way', true),
        _tabButton('Round Way', false),
        _tabButton('Multi City', false),
      ],
    );
  }

  Widget _tabButton(String label, bool selected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.yellow[700] : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.black : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _locationTile(String title, String city, String airport, void Function(String, String) onSelected) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ListTile(
                  title: const Text("Dhaka"),
                  subtitle: const Text("DAC, Hazrat Shahjalal International Airport"),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected("Dhaka", "DAC, Hazrat Shahjalal International Airport");
                  },
                ),
                ListTile(
                  title: const Text("Chattogram"),
                  subtitle: const Text("CGP, Shah Amanat International Airport"),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected("Chattogram", "CGP, Shah Amanat International Airport");
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
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(city, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(airport, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _dateSelector(String title, String date, String day, void Function(DateTime) onSelected) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
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
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 4),
          Text(date, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(day, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}