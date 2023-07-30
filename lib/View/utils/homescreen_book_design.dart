import 'package:bookappforappavenger/Model/Book_Model.dart';
import 'package:bookappforappavenger/Update/api_calls.dart';
import 'package:bookappforappavenger/View/utils/book_design.dart';
import 'package:flutter/material.dart';

class HomeScreenBooksDesign extends StatelessWidget {
  final String categoryName;
  final String maxResult;
  HomeScreenBooksDesign({super.key,required this.categoryName,required this.maxResult,});

  final BookApi api = BookApi();
  final String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: api.getCategoryBooks(bookCategory: categoryName,maxResult: maxResult),
        builder: (context,snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Opps! Try again later!"),
            );
          }
          if (snapshot.hasData) {
            Books books = snapshot.data;
            return LayoutBuilder(builder: (context, constraints) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: books.items!.length,
                itemBuilder: (context, index) {
                  // print(books.items!.length);
                  return BookDesign(screenWidth: screenWidth, books: books, errorLink: errorLink,index: index,constraints: constraints,);
                },
              );
            });
          }
          return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ));
        });
  }
}

