import 'package:bookappforappavenger/View/screen/category_screen.dart';
import 'package:bookappforappavenger/View/utils/homescreen_book_design.dart';
import 'package:flutter/material.dart';

class HomeScreenCategory extends StatelessWidget {

  const HomeScreenCategory({Key? key, required this.categoryName, required this.maxResult, required this.position})
      : super(key: key);

  final String categoryName;
  final String maxResult;
  final int position;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top:16, right:20, bottom:0, left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryName,
                style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,
              ),
              InkWell(
                onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(selectedList: position),
                    ),
                  );
                },
                child: const Icon(Icons.arrow_forward,color: Colors.blueAccent,),
              )
            ],
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: screenHeight * 0.30,
              child: HomeScreenBooksDesign(categoryName: categoryName,maxResult: maxResult,))
        ],
      ),

    );
  }
}











