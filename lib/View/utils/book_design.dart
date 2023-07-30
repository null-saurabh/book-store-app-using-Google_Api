import 'package:bookappforappavenger/Model/Book_Model.dart';
import 'package:bookappforappavenger/View/screen/book_details_scrren.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookDesign extends StatelessWidget {
  final double screenWidth;
  final Books books;
  final String errorLink;
  final int index;
  final BoxConstraints constraints;


  const BookDesign({
    super.key,
    required this.screenWidth,
    required this.books,
    required this.errorLink,
    required this.index,
    required this.constraints,
  });



  @override
  Widget build(BuildContext context) {
    // print(constraints.maxWidth * 0.18);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(bookId: books.items![index].id,image: books.items?[index].volumeInfo?.imageLinks?.thumbnail?? errorLink)));
      },
      child: Container(
        width: screenWidth * 0.32,
        padding:
        const EdgeInsets.only(left: 0, bottom: 5, top: 5,right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: SizedBox(
                height: constraints.maxHeight * 0.6,
                width: screenWidth *3.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: NetworkImage(
                      books.items?[index].volumeInfo?.imageLinks?.thumbnail ?? errorLink,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text(
              "${books.items?[index].volumeInfo?.title}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),

            ),
            Text(
              "${books.items?[index].volumeInfo?.authors?.join(', ')}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 11,
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: RatingBar.builder(
                initialRating: books.items?[index].volumeInfo?.averageRating ?? 0.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color(0xff5ABD8C),
                ),
                onRatingUpdate: (rating) {},
              ),
            ),

            Container(
                height: constraints.maxHeight * 0.1,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12)),
                child:
                books.items?[index].saleInfo?.retailPrice?.amount != null
                    ?Text(
                  "\$${books.items?[index].saleInfo?.retailPrice?.amount}",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white),
                )
                    :const Text("Free",style: TextStyle(
                    fontSize: 15,
                    color: Colors.white))
            ),

          ],
        ),
      ),
    );
  }
}
