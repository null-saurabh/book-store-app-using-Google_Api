import 'package:bookappforappavenger/Update/wishlist_provider.dart';
import 'package:bookappforappavenger/View/utils/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailScreen extends StatelessWidget {
  final String bookId;
  final String image;
  const BookDetailScreen(
      {super.key, required this.bookId, required this.image});

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
            Stack(
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.2,
                    origin: Offset(0, screenWidth * 0.8),
                    child: Container(
                      width: screenWidth,
                      height: screenWidth,
                      decoration: const BoxDecoration(
                          color: Color(0xffCFEDEF),
                          borderRadius: BorderRadius.all(Radius.circular(0))),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const Center(
                        child: Text(
                          "BookStore",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios)),
                      ),
                      // leadingWidth: 5,
                      actions: [
                        Consumer<WishListProvider>(
                            builder: (context, provider, child) {
                              // print(provider.wishlistBookIds);
                          if (provider.wishlistBookIds.contains(bookId)) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                  iconSize: 34,
                                  onPressed: () {
                                    provider.removeBookFromWishList(bookId);
                                  },
                                  icon: const Icon(Icons.favorite)),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                  iconSize: 34,
                                  onPressed: () {
                                    provider.addBookToWishList(bookId);
                                  },
                                  icon: const Icon(Icons.favorite_border)),
                            );
                          }
                        })
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        child: Image(
                      width: screenWidth * 0.38,
                      height: screenWidth * 0.60,
                      fit: BoxFit.fill,
                      image: NetworkImage(image),
                    )),
                  ],
                )
              ],
            ),
            BuyBook(
              bookId: bookId,
            ),
          ],
        ),
      ),
    );
  }
}
