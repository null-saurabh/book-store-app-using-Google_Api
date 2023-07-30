import 'package:bookappforappavenger/Model/Book_Model.dart';
import 'package:bookappforappavenger/View/screen/book_details_scrren.dart';
import 'package:flutter/material.dart';

class TopSellerBookDesign extends StatelessWidget {
  final Items bookDetail;
  const TopSellerBookDesign({super.key, required this.bookDetail});
  final String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        width: screenWidth * 0.32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, 2),
                          blurRadius: 5)
                    ]),
                child:
                bookDetail.volumeInfo!.imageLinks == null ||
                    bookDetail.volumeInfo!.imageLinks!.thumbnail == null
                    ? Container(
                    width: screenWidth * 0.32,
                    height: screenWidth * 0.50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(child: Text("No image found")))
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    width: screenWidth * 0.32,
                    height: screenWidth * 0.50,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        bookDetail.volumeInfo!.imageLinks!.thumbnail!),
                  ),
                ),
              ),
              onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailScreen(bookId: bookDetail.id,image: bookDetail.volumeInfo?.imageLinks?.thumbnail?? errorLink)));
              }
              ),
            const SizedBox(
              height: 15,
            ),
            Text(
              bookDetail.volumeInfo!.title,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xff212121),
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
            bookDetail.volumeInfo!.authors == null
                ?const Text("No Author Details")
                :Text(
              bookDetail.volumeInfo!.authors!.join(', '),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xff212121).withOpacity(0.4),
                fontSize: 11,
              ),
            )
          ],
        ));
  }
}
