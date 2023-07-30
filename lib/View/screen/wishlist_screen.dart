import 'package:bookappforappavenger/Model/book_details_model.dart';
import 'package:bookappforappavenger/Update/api_calls.dart';
import 'package:bookappforappavenger/Update/wishlist_provider.dart';
import 'package:bookappforappavenger/View/screen/search_screen.dart';
import 'package:bookappforappavenger/View/utils/wishlist_book_design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final BookApi api = BookApi();
  final String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0,
        left: 25,right:25 ),
        child: Consumer<WishListProvider>(
            builder: (context, provider, child) {
              // provider.wishlistBookIds.contains(bookId)
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0,bottom: 10),
                    child: Text("Wishlist",style: TextStyle(color: Colors.black87,fontSize: 29,fontWeight: FontWeight.w700),),
                  ),
                  provider.wishlistBookIds.isEmpty
                  ?const Expanded(child: Center(child: Text("No Books in Wishlist",style: TextStyle(color: Colors.grey,fontSize: 29,fontWeight: FontWeight.w700),)))
                  :Expanded(
                    child: GridView.builder(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.45,
                          crossAxisCount: 3,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 35),
                      itemCount: provider.wishlistBookIds.length,
                      itemBuilder: (context, index) {
                        return LayoutBuilder(builder: (context, constraints){
                          return FutureBuilder(
                              future:api.showBooksDetails(bookId: provider.wishlistBookIds[index]),
                              builder: (context,snapshot){
                                if (snapshot.hasData) {
                                  DetailModel details = snapshot.data;

                                  return Center(
                                    child: WishlistBookDesign(screenWidth: screenWidth, books: details, errorLink: errorLink, constraints: constraints),
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
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),

    );
  }
}
