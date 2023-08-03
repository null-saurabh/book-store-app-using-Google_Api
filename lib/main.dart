import 'package:bookappforappavenger/Update/wishlist_provider.dart';
import 'package:bookappforappavenger/View/screen/main_screen_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider ( create: (context) => WishListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Store',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomNavigation(),
      ),
    );
  }
}

