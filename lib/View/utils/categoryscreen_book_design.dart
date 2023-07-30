import 'package:bookappforappavenger/Update/api_calls.dart';
import 'package:bookappforappavenger/View/utils/book_design.dart';
import 'package:flutter/material.dart';

class CategoryScreenBookDesign extends StatelessWidget {
  final String categoryName;
  CategoryScreenBookDesign({super.key,required this.categoryName});

  final BookApi api = BookApi();
  final String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // print(categoryName);
    return FutureBuilder(
      future:api.getCategoryBooks(bookCategory: categoryName,maxResult:"39"),
        builder: (context,snapshot){
    if (snapshot.hasData) {
      return GridView.builder(
        padding:
        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.45,
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 35),
        itemCount: snapshot.data.items!.length,
        itemBuilder: (context, index) {
          return LayoutBuilder(builder: (context, constraints){
            return Center(
              child: BookDesign(screenWidth: screenWidth,
                books: snapshot.data,
                errorLink: errorLink,
                index: index,
                constraints: constraints,),
            );}
          );
        },
      );
    }
    if (snapshot.hasError){
      return const Center(child: Text("Ops! Try again later"),);
    }
    return const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ));

        }
    );
  }
}
