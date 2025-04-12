import 'package:flutter/material.dart';

class TourDetailsPage extends StatelessWidget {
  final Map<String, dynamic> place;
  final Map<String, dynamic> tour;

  const TourDetailsPage({super.key, required this.place, required this.tour});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                place["image"],
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        place["title"],
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${place["price"]}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey, size: 18),
                      Text(place["country"], style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 18),
                      Text("${place["rating"]} ", style: const TextStyle(fontWeight: FontWeight.w500)),
                      const Text("(150 Reviews)", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("About", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  const Text(
                    "Stay with Saint Martin and enjoy the sea beach. We have good facilities to enjoy.",
                    style: TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  const Text("Read More...", style: TextStyle(color: Colors.blueAccent)),
                  const SizedBox(height: 16),
                  const Text("Facilities", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Row(children: [Icon(Icons.check, size: 16), SizedBox(width: 4), Text("Free Wifi")]),
                      Row(children: [Icon(Icons.check, size: 16), SizedBox(width: 4), Text("Pool")]),
                      Row(children: [Icon(Icons.check, size: 16), SizedBox(width: 4), Text("Breakfast")]),
                      Row(children: [Icon(Icons.check, size: 16), SizedBox(width: 4), Text("Lunch")]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF00C6FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.bookmark_border, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Handle booking
                },
                child: const Text("Book Now", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
