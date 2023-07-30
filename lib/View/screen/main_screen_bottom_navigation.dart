import 'package:bookappforappavenger/View/screen/category_screen.dart';
import 'package:bookappforappavenger/View/screen/home_screen.dart';
import 'package:bookappforappavenger/View/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with TickerProviderStateMixin{

  // int _currentIndex = 0;
  // final screens = const [
  //   HomeScreen(),
  //   CategoryScreen(),
  //   WishlistScreen(),
  // ];
  TabController? controller;


  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: const [
        HomeScreen(),
        CategoryScreen(),
        WishlistScreen(),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Wishlist",
              ),
            ]),
      ),

    );
  }
}























// Replace the body and bottomNavigationBar with below code to main the state of the Pages



// body: IndexedStack(
// index: _currentIndex,
// children: screens,
// ),
// bottomNavigationBar: BottomNavigationBar(
// currentIndex: _currentIndex,
// backgroundColor: Colors.white,
// selectedItemColor: Colors.black87,
// unselectedItemColor: Colors.grey,
// selectedLabelStyle: const TextStyle(fontSize: 15),
// unselectedLabelStyle: const TextStyle(fontSize: 13),
// items: const [
// BottomNavigationBarItem(
// icon: Icon(Icons.home),
// label: 'Home',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.category),
// label: 'Categories',
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.star),
// label: 'Wishlist',
// ),
//
// ],
// onTap: (index) {
// setState(() {
// _currentIndex = index;
// });
// },
// ),