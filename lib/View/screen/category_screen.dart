import 'package:bookappforappavenger/View/screen/search_screen.dart';
import 'package:bookappforappavenger/View/utils/categoryscreen_book_design.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedList = 0;
  List categoryList = [
    "Free",
    "Paid",
    "Novels",
    "Biography",
    "Business",
    "Children",
    "Cookery",
    "Fiction",
    "Arts",
    "Science",
  ];

  @override
  Widget build(BuildContext context) {
    // print(selectedList);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xffEFEFEF).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, right: 15),
                          child: Icon(Icons.search, color: Color(0xff212121)),
                        ),
                        Text("Search Books. Authors. or ISBN",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.5,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  onTap: (){
                    showSearch(
                        context: context,
                        delegate: SearchScreen()
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: categoryList.map((tagName) {
                    var index = categoryList.indexOf(tagName);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedList = index;
                          });
                        },
                        child: Text(
                          tagName,
                          style: TextStyle(
                              color: selectedList == index
                                  ? Colors.black
                                  : Colors.black.withOpacity(0.4),
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            categoryList[selectedList] != "Free" && categoryList[selectedList] != "Paid"
                 ?Expanded(
                    child: CategoryScreenBookDesign(
                        categoryName: categoryList[selectedList]))
                : categoryList[selectedList] == "Free"
                    ? Expanded(
                        child: CategoryScreenBookDesign(
                            categoryName: "fiction&filter=free-ebooks"))
                    : Expanded(
                        child: CategoryScreenBookDesign(
                            categoryName: "fiction&filter=paid-ebooks"))
          ],
        ));
  }
}
