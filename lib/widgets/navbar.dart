import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';


class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar>
{
  int _selectedIndex = 0;

  static const List<Widget> _options  = <Widget> [
    DashboardPage(),
    AccountPage(),
    CryptosPage(),
    StoragesPage(),
    ToolsPage(),
  ];

  void _onItemTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _options.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: HexColor('#FFFFFF'),
          border: Border(top: BorderSide(color: HexColor('#E0E0E0'), width: 1.0))
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline_outlined),
              label: 'Profile',
              backgroundColor: HexColor('#FFFFFF'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.people_alt_outlined),
              label: 'Account',
              backgroundColor: HexColor('#FFFFFF'),
            ),
            BottomNavigationBarItem(
              icon:  const Icon(Icons.graphic_eq_rounded),
              label: 'Cryptos',
              backgroundColor: HexColor('#FFFFFF'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.storage_outlined),
              label: 'Storages',
              backgroundColor: HexColor('#FFFFFF'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_applications_outlined),
              label: 'Tools',
              backgroundColor: HexColor('#FFFFFF'),
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.black,
          iconSize: 35,
          onTap: _onItemTap,
          elevation: 5,
        ),
      ),
    );
  }
}
