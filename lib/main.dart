  import 'package:flutter/material.dart';
  import 'package:final_tugas/pages/home.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'arif maulana insaf',  
        theme: ThemeData(
          primaryColor: Colors.teal,
        ),
        home: HomePage(),
      );
    }
  }

    // class HomePage extends StatefulWidget {
    //   @override
    //   _HomePageState createState() => _HomePageState();
    // }

    // class _HomePageState extends State<HomePage> {
    //   int _selectedIndex = 0;

    //   void _onItemTapped(int index) {
    //     setState(() {
    //       _selectedIndex = index;
    //     });
    //   }

    //   final List<Widget> _pages = [
    //     Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    //     Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
    //   ];

    //   @override
    //   Widget build(BuildContext context) {
    //     return Scaffold(
    //       appBar: AppBar(
    //         title: Text('hip-hop banda aceh'),
    //         centerTitle: true,
    //       ),
    //       drawer: Drawer(
    //         child: ListView(
    //           padding: EdgeInsets.zero,
    //           children: <Widget>[
    //             DrawerHeader(
    //               decoration: BoxDecoration(
    //                 color: Colors.blue,
    //               ),
    //               child: Text(
    //                 'Menu',
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 24,
    //                 ),
    //               ),
    //             ),
    //             ListTile(
    //               leading: Icon(Icons.home),
    //               title: Text('Home'),
    //               onTap: () {},
    //             ),
    //             ListTile(
    //               leading: Icon(Icons.person),
    //               title: Text('Profile'),
    //               onTap: () {},
    //             ),
    //           ],
    //         ),
    //       ),
    //       // body: _pages[_selectedIndex],
    //       bottomNavigationBar: BottomNavigationBar(
    //         items: const <BottomNavigationBarItem>[
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.home),
    //             label: 'Home',
    //           ),
    //           BottomNavigationBarItem(
    //             icon: Icon(Icons.person),
    //             label: 'Profile',
    //           ),
    //         ],
    //         currentIndex: _selectedIndex,
    //         selectedItemColor: Colors.blue,
    //         onTap: _onItemTapped,
    //       ),
    //     );
    //   }
    // }
