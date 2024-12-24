import 'package:flutter/material.dart';
import 'package:final_tugas/pages/deskrpsi.dart';
import 'package:final_tugas/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HIP-HOP BANDA ACEH',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      ListView(
        children: <Widget>[
          _buildListItem(
            'Beatbox',
            'beatbox adalah bentuk seni pertunjukan yang unik dimana seorang seniman menciptakan berbagai macam suara musik menggunakan aggota tubuhnya sendiri, terutama mulut, bibir, lidah dan tengorokan. Dengan menggabungkan teknik-teknik vokal yang berbeda, seprang beatboxer dapat menghasilkan beragam suara, mulai dari ketukan drum, hi-hat, snare dan masih banyak lain',
            'assets/images/beatbox.jpg', // Gambar lokal
          ),
          _buildListItem(
            'Break Dance',
            'Deskripsi untuk Item 2',
            'assets/images/breakdance.jpg',
          ),
          _buildListItem(
            'Rap',
            'Deskripsi untuk Item 3',
            'assets/images/rap.jpg',
          ),
          _buildListItem(
            'Grafiti Crew',
            'Deskripsi untuk Item 4',
            'assets/images/grafiti.jpg',
          ),
        ],
      ),
      ProfilePage(),
    ];
  }

  Widget _buildListItem(String title, String description, String imageUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DescriptionPage(
                title: title,
                description: description,
                imageUrl: imageUrl,
                additionalImages: [
                  'assets/images/beatbox.jpg',
                  'assets/images/breakdance.jpg',
                  'assets/images/grafiti.jpg',
                  'assets/images/rap.jpg',
                  'assets/images/beatbox1.jpg',
                  'assets/images/beatbox2.jpg',
                  'assets/images/beatbox3.jpg',
                  'assets/images/beatbox4.jpg',
                  'assets/images/beatbox5.jpg',
                  'assets/images/beatbox6.jpg',
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HIP-HOP BANDA ACEH',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.teal,
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ClipOval(
              child: Image.asset(
                'assets/images/hiphop.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
         color: Colors.black,
        ),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor:Colors.teal ,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Semua item di tengah secara vertikal
              crossAxisAlignment: CrossAxisAlignment.center, // Semua item di tengah secara horizontal
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/hiphop.jpg', // Ganti dengan path foto profil Anda
                    width: 100, // Atur lebar gambar
                    height: 100, // Atur tinggi gambar
                    fit: BoxFit.cover, // Memastikan gambar mengisi bulatan
                  ),
                ),
                const SizedBox(height: 16),
                 // Jarak antara foto profil dan deskripsi
                 
                const Text(
                  'Nama Pengguna', // Ganti dengan nama pengguna
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
                ),
                const SizedBox(height: 8), // Jarak antara nama dan deskripsi
                const Text(
                  'Ini adalah deskripsi singkat tentang pengguna. Anda dapat menambahkan informasi lebih lanjut di sini.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16,color: Colors.white,),
                ),
                const SizedBox(height: 20), // Jarak sebelum tombol logout
                ElevatedButton(
                  onPressed: () {
                    // Logika untuk logout
                    Navigator.pop(context); // Kembali ke halaman sebelumnya
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
