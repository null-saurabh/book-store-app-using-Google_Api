import 'package:bookappforappavenger/View/screen/search_screen.dart';
import 'package:bookappforappavenger/View/utils/homescreen_category.dart';
import 'package:bookappforappavenger/View/utils/top_seller_books.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Align(
                child: Transform.scale(
                  scale: 1.5,
                  origin: Offset(0, screenWidth * 0.8),
                  child: Container(
                    width: screenWidth,
                    height: screenWidth,
                    decoration: BoxDecoration(
                        color: const Color(0xffCFEDEF),
                        borderRadius: BorderRadius.circular(screenWidth * 0.5)),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: const Text(
                      "Top Sellers",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                    leading: Container(),
                    leadingWidth: 5,
                    actions: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: IconButton(
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: SearchScreen()
                              );
                            }, icon: const Icon(Icons.search_outlined)),
                      )
                    ],

                  ),
                  SizedBox(
                    width: screenWidth,
                    height: screenWidth * 0.8,
                    child: const TopSellerBooks()
                  ),
                  HomeScreenCategory(categoryName: "Fantasy & Fiction",maxResult: "6",),
                  HomeScreenCategory(categoryName: "Arts",maxResult: "6"),
                  HomeScreenCategory(categoryName: "Anime",maxResult: "6"),

                ],
              ),

            ]),
          ],
        ),
      ),
    );
  }
}
