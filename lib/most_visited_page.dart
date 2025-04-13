import 'package:flutter/material.dart';
// import 'package:tourpackage/TourDetailsPage.dart';
import 'TourDetailsPage.dart';

class MostVisitedPage extends StatelessWidget {
  final String location;

  const MostVisitedPage({super.key, required this.location});

  final List<Map<String, dynamic>> places = const [
    {
      "title": "Tajhat Jamidar Bari",
      "rating": 4.8,
      "country": "Bangladesh",
      "price": 120,
      "image": "assets/images/img_1.png"
    },
    {
      "title": "Lake Fond",
      "rating": 4.9,
      "country": "India",
      "price": 250,
      "image": "assets/images/img_2.png"
    },
    {
      "title": "Venice",
      "rating": 4.7,
      "country": "Italy",
      "price": 400,
      "image": "assets/images/img_3.png"
    },
    {
      "title": "Saint Martin’s Island",
      "rating": 4.5,
      "country": "Cox’s Bazar",
      "price": 150,
      "image": "assets/images/img_4.png"
    },
    {
      "title": "Kangchenjungha",
      "rating": 5.0,
      "country": "India",
      "price": 300,
      "image": "assets/images/img_5.png"
    },
    {
      "title": "Sajek Valley",
      "rating": 4.6,
      "country": "Bangladesh",
      "price": 140,
      "image": "assets/images/img_1.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00C6FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Most Visited",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TourDetailsPage(
                          place: place,
                          tour: {},
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    child: Image.asset(
                      place["image"],
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place["title"],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 18),
                              const SizedBox(width: 4),
                              Text('${place["rating"]}'),
                              const SizedBox(width: 8),
                              const Icon(Icons.location_on,
                                  color: Colors.grey, size: 18),
                              Text(place["country"],
                                  style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text('\$${place["price"]}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TourDetailsPage(
                              place: place,
                              tour: {},
                            ),
                          ),
                        );
                      },
                      child: const Text("Book Now"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
