import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_share/user_profile.dart';
import 'package:tech_share/valores_e_funcoes.dart';
import 'index.dart';
import 'teste.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  final List<Widget> pageView = const [Index(), Teste(), UserProfile()];

   @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  /*static const List<Widget> _widgetOptions = <Widget>[
    Index(),
    Teste(),
    UserProfile(),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: const PageScrollPhysics(),
        itemCount: pageView.length,
        itemBuilder: (BuildContext context, int index) {
          final bool isCurrentPage = index == _selectedIndex;
          final double horizontalMargin = isCurrentPage ? 0.0 : 16.0;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
            child: pageView[index],
          );
        },
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      //body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: !isIOS
                ? const Icon(Icons.home)
                : const Icon(CupertinoIcons.home),
            label: 'Index',
          ),
          BottomNavigationBarItem(
            icon: !isIOS
                ? const Icon(Icons.question_answer)
                : const Icon(CupertinoIcons.chat_bubble_2),
            label: 'Conversas',
          ),
          BottomNavigationBarItem(
            icon: !isIOS
                ? const Icon(Icons.person)
                : const Icon(CupertinoIcons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.green,
        onTap: (index) => setState(() {
          _selectedIndex = index;
          pageController.jumpToPage(_selectedIndex);
        }),
      ),
    );
  }
}
