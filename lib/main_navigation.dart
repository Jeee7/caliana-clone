import 'package:caliana_clone/home.dart';
import 'package:caliana_clone/utility/divider.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  bool _isClicked = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleBtn() {
    setState(() {
      _isClicked = !_isClicked;
    });
  }

  Widget _buildFabOption(String label, Widget iconWidget) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 140),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              decoration: TextDecoration.none,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 42.0,
          height: 42.0,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 204, 230, 241),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: iconWidget,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double itemWidth = (screenWidth - 60) / 2;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          // Main Scaffold
          Scaffold(
            body: IndexedStack(
              index: _selectedIndex,
              children: const <Widget>[
                HomeScreen(),
                // ProfilePage(),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _toggleBtn,
              backgroundColor: Colors.white,
              elevation: 4,
              shape: const CircleBorder(),
              child: Icon(
                _isClicked ? Icons.close : Icons.add,
                color: Colors.grey,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 8,
              elevation: 10,
              color: Colors.white,
              height: 70,
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Container(
                    height: 12,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: _selectedIndex == 0 ? itemWidth * 0.25 : null,
                          right: _selectedIndex == 1 ? itemWidth * 0.25 : null,
                          child: Container(
                            height: 3,
                            width: itemWidth * 0.5,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0DABDD),
                              borderRadius: BorderRadius.circular(1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => _onItemTapped(0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: _selectedIndex == 0
                                        ? const Color(0xFF0DABDD)
                                        : Colors.grey,
                                    size: 24,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Beranda',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _selectedIndex == 0
                                          ? const Color(0xFF0DABDD)
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => _onItemTapped(1),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 32),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: _selectedIndex == 1
                                        ? const Color(0xFF0DABDD)
                                        : Colors.grey,
                                    size: 24,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Profil',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _selectedIndex == 1
                                          ? const Color(0xFF0DABDD)
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Overlay when FAB is clicked
          if (_isClicked)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleBtn,
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            ),

          // FAB Options when expanded
          if (_isClicked)
            Positioned(
              bottom: 180,
              right: (screenWidth - 45) / 2, // Center the row
              child: _buildFabOption(
                'Registrasi',
                Image.asset(
                  'assets/icons/add-file.png',
                  width: 20,
                  height: 20,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          if (_isClicked)
            Positioned(
              bottom: 120,
              right: (screenWidth - 45) / 2,
              child: _buildFabOption(
                ' Pra Registrasi',
                Image.asset(
                  'assets/icons/add-file.png',
                  width: 20,
                  height: 20,
                  color: Colors.lightBlue,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
