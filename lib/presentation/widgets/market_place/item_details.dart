import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {

  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Item Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: [
                    Image.network(
                      'https://source.unsplash.com/400x250/?car',
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Listed 3 days ago",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Jeep SUV 2018",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "Risus rhoncus pretium et congue pharetra lorem orci diam id. Eros ultrices laoreet velit aliquam enim.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "N125,000,000",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Negotiable",
                    style: TextStyle(fontSize: 14, color: Colors.orange),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Brand", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("BMW"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Color", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Yellow"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Model", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Lorem"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Sedan"),
                    ],
                  ),
                ],
              ),
              const Divider(height: 20),
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://source.unsplash.com/50x50/?face'),
                ),
                title: Text("John Doe", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("Seller"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Text("4.8"),
                  ],
                ),
              ),
              const Text(
                "Jikwoyi Phase 2, AMAC, Abuja.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              const Text(
                "Eros ultrices laoreet velit aliquam enim. Risus rhoncus pretium et congue lorem orci diam id.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              const Text(
                "3 months ago",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              const Text(
                "Show All",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

}