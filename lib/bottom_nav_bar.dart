import 'package:flutter/material.dart';
import 'package:tech_share/no_login/landing_page.dart';
import 'index.dart';

class BottomNavBar extends StatefulWidget {
  final SnackBar? snackBar;
  const BottomNavBar({Key? key, this.snackBar}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Index(),
    Placeholder(),
    LandingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(widget.snackBar!);
    });
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Index',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'PAGINA2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'PAGINA3',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.green,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }
}
