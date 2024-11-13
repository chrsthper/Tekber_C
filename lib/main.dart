import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Me',
      theme: ThemeData.dark(),
      home: AboutMePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AboutMePage extends StatelessWidget {
  final String name = "Christhoper Carlos Pangaribuan";
  final String nim = "5026221150";
  final String funFact =
      "A musical athlete! Can play almost any instrument you hand me, and then I'll probably beat you in a 10k race afterwards just for fun.";
  final List<String> favoriteArtists = [
    "Frank Ocean",
    "Daniel Caesar",
    "Drake",
  ];
  final List<String> favoriteSongs = [
    "White Ferrari - Frank Ocean",
    "About You - The 1975",
    "Self Control - Frank Ocean",
  ];
  final List<String> artistImages = [
    'assets/frankocean.jpg',
    'assets/danielcaesar.jpg',
    'assets/drake.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple.shade800, Colors.blueGrey.shade900],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile picture
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.8),
                        spreadRadius: 10,
                        blurRadius: 30,
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/selfphoto.JPG'),
                    backgroundColor: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 30),

                // Name
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 15,
                        color: Colors.deepPurple,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 10),

                // NIM
                Text(
                  "NRP: $nim",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    color: Colors.grey.shade300,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.blue.withOpacity(0.5),
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),

                // Fun Fact
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade400, Colors.blue.shade400],
                    ),
                  ),
                  child: Text(
                    funFact,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Favorite Artists and Songs Section with Uniform Card Sizes
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Favorite Artists Column
                    Expanded(
                      child: Column(
                        children: [
                          _buildSectionTitle("Favorite Artists"),
                          SizedBox(height: 10),
                          _buildFavoriteListWithImages(favoriteArtists, artistImages),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Favorite Songs Column
                    Expanded(
                      child: Column(
                        children: [
                          _buildSectionTitle("Favorite Songs"),
                          SizedBox(height: 10),
                          _buildFavoriteList(favoriteSongs),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),

                // Social icons section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Email Icon
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent.withOpacity(0.2),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.email, color: Colors.redAccent),
                        iconSize: 30,
                        onPressed: () {
                          // Add email action here
                        },
                      ),
                    ),
                    SizedBox(width: 30),
                    
                    // Phone Icon
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.greenAccent.withOpacity(0.2),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.phone, color: Colors.greenAccent),
                        iconSize: 30,
                        onPressed: () {
                          // Add phone action here
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Helper function to build lists of favorite items with images, with fixed card size
  Widget _buildFavoriteListWithImages(List<String> items, List<String> images) {
    return Column(
      children: List.generate(items.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(8),
          height: 60, // Set uniform height
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(
                images[index],
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  items[index],
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Helper function to build lists of favorite songs, with fixed card size
  Widget _buildFavoriteList(List<String> items) {
    return Column(
      children: List.generate(items.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(8),
          height: 60, // Set uniform height
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              items[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                color: Colors.grey.shade300,
              ),
            ),
          ),
        );
      }),
    );
  }
}
