import 'package:bookappforappavenger/Model/Book_Model.dart';
import 'package:bookappforappavenger/Update/api_calls.dart';
import 'package:bookappforappavenger/View/utils/top_seller_book_design.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class TopSellerBooks extends StatefulWidget {
  const TopSellerBooks({super.key});

  @override
  State<TopSellerBooks> createState() => _TopSellerBooksState();
}

class _TopSellerBooksState extends State<TopSellerBooks> {
  final BookApi api = BookApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getCategoryBooks(bookCategory: "science",maxResult: "10"),
        builder: (context,snapshot){
          if(snapshot.hasData){
            Books books = snapshot.data;

            return CarouselSlider.builder(
              itemCount: books.items!.length,
              itemBuilder: (context, index,_) {
                if (books.totalItems != 0)
                {
                  return TopSellerBookDesign(bookDetail: books.items![index]);}
                else
                  {
                    return const Text("No Data Found");
                  }
              },
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 1,
                enlargeCenterPage: true,
                viewportFraction: 0.45,
                enlargeFactor: 0.4,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Ops! Try again later!"),
            );
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}





