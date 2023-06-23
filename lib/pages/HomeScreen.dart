import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_happyfish/bottomnav/home.dart';
import 'package:little_happyfish/bottomnav/profile.dart';
import 'package:little_happyfish/bottomnav/questions1.dart';
import 'package:little_happyfish/bottomnav/scores.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;
//calling firebase to log out
  void signuserout() {
    FirebaseAuth.instance.signOut();
  }

  late List<int> scores;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    //pages
    const UserHome(), //in bottomnav folder (home.dart)

    const Questions1(),
    //questions pages

    // Scores(Scores:scores), //scores page
    const ScoresPage(
      scores: [],
    ),

    ProfilePage(email: 'dadarozina@gmail.com', username: 'jojosiwa'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // String? _selectedOption = 'Maths';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          actions: <Widget>[
            // builddropdown(),
            IconButton(onPressed: signuserout, icon: const Icon(Icons.logout))
          ]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
             DrawerHeader(
            child: Text(
              'welcome to Happy Fish',
              style: TextStyle(fontSize:20),
            ),
            ),
            ListTile(
              leading: Icon(Icons.wallet),
              title:  Text('payments'),
              // onTap: () {
              //  // Navigator.pop(context);
              // },
            ),

             ListTile(
              leading: Icon(Icons.person),
              title:  Text('edit profile'),
             ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomnavbar(),
    );
  }

  BottomNavigationBar _bottomnavbar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz_outlined),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Scores',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
