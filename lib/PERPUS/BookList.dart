import 'package:flutter/material.dart';

void main() {
  runApp(BookList());
}

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardScreen(),
    Center(child: Text('Search Page', style: TextStyle(color: Colors.white))),
    Center(child: Text('Notifications Page', style: TextStyle(color: Colors.white))),
    Center(child: Text('Menu Page', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1E1E2C),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {
      'title': 'Laut Bercerita',
      'time': '3d 5h',
      'progress': '75%',
      'image': 'assets/book1.jpg',
    },
    {
      'title': 'My Neighbor Totoro',
      'time': '10d 5h',
      'progress': '23%',
      'image': 'assets/book2.jpg',
    },
    {
      'title': 'Your Name',
      'time': '1d 2h',
      'progress': '50%',
      'image': 'assets/book4.jpeg',
    },
  ];

  final List<Map<String, String>> bestSellers = [
    {
      'title': 'The Tiny Dragon',
      'categories': 'Drama, Romance, Adventure',
      'image': 'assets/book34.jpeg',
    },
    {
      'title': 'Under Land',
      'categories': 'Drama',
      'image': 'assets/book3.jpg',
    },
    {
      'title': 'Under Land',
      'categories': 'Drama',
      'image': 'assets/book3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E2C),
      appBar: AppBar(
        backgroundColor: Color(0xFF1E1E2C),
        elevation: 0,
        title: Text(
          'Good Morning\nUser',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFFFE724C),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.white, size: 18),
                SizedBox(width: 4),
                Text(
                  '240 Point',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionButton('Claim', Icons.card_giftcard),
                  _actionButton('Get Point', Icons.point_of_sale),
                  _actionButton('My Card', Icons.credit_card),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'My Book',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _myBooksList(context),
              SizedBox(height: 24),
              Text(
                'Best Seller',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _bestSellerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionButton(String label, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFF2A2A3D),
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _myBooksList(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              // Navigasi ke detail buku dapat ditambahkan di sini.
            },
            child: _bookCard(
              book['title']!,
              book['time']!,
              book['progress']!,
              book['image']!,
            ),
          );
        },
      ),
    );
  }

  Widget _bookCard(String title, String time, String progress, String image) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Text(
            progress,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _bestSellerList() {
    return Column(
      children: bestSellers.map((book) {
        return _bestSellerItem(
          book['title']!,
          book['categories']!,
          book['image']!,
        );
      }).toList(),
    );
  }

  Widget _bestSellerItem(String title, String categories, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 50,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                categories,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class BookDetailScreen extends StatelessWidget {
  final String title;
  final String time;
  final String progress;

  const BookDetailScreen({
    Key? key,
    required this.title,
    required this.time,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Book"),
        backgroundColor: Color(0xFF1E1E2C),
        elevation: 0,
      ),
      backgroundColor: Color(0xFF1E1E2C),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Cover Buku
              Container(
                height: 200,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/book4.jpeg'), // Ganti dengan path gambar Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Judul dan Penulis
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                "Rupert Carter", // Penulis (contoh)
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              // Informasi Tambahan
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _infoBox("4.5", "Rating"),
                  _infoBox("160", "Number of Page"),
                  _infoBox("Eng", "Language"),
                ],
              ),
              SizedBox(height: 24),
              // Deskripsi
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 24),
              // Tombol "Start Reading"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border, color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFE724C),
                      padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      "Start Reading",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk kotak informasi
  Widget _infoBox(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

