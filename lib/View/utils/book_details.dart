import 'package:bookappforappavenger/Model/book_details_model.dart';
import 'package:bookappforappavenger/Update/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyBook extends StatelessWidget {
  final String bookId;
  BuyBook({super.key,required this.bookId});

  final BookApi api = BookApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.showBooksDetails(bookId: bookId),
        builder: (context,snapshot){
          if(snapshot.hasData){
            DetailModel details = snapshot.data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 1),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${details.volumeInfo.authors?.join(" ")}",style: const TextStyle(color: Colors.grey,fontSize: 18),),
                      Text(details.volumeInfo.title,style: const TextStyle(fontSize: 29,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text("Price",style: TextStyle(color: Colors.grey,fontSize: 18,),),
                              const SizedBox(width: 5,),

                              details.saleInfo.retailPrice?.amount != null
                                  ?Text("\$${details.saleInfo.retailPrice!.amount}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                                  :const Text("Free",style: TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.bold)),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              children: [
                                const Text("Review",style: TextStyle(color: Colors.grey,fontSize: 18),),
                                const SizedBox(width: 5,),
                                IgnorePointer(
                                  ignoring: true,
                                  child: RatingBar.builder(
                                    initialRating: details.volumeInfo.averageRating ?? 0.0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Color(0xff5ABD8C),
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                ),
                              ],
                            ),
                          )


                        ],
                      ),
                      const Text("Description",style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10,),
                      ReadMoreText(
                        details.volumeInfo.description ?? "No Description Available",
                        trimLines: 6,
                        colorClickableText: Colors.black87,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Read More',
                        style: const TextStyle(fontSize: 14),
                        trimExpandedText: ' Less',
                      ),
                      const SizedBox(height: 25,)


                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: ElevatedButton(
                  onPressed: () async {
                    Uri url = Uri.parse(
                        "${snapshot.data?.volumeInfo?.infoLink}");

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode:
                          LaunchMode.externalApplication);
                    } else {
                      throw 'could not launch $url';
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black87,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Buy",
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                  ),
                ),
                const SizedBox(height: 20,)

              ],
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
