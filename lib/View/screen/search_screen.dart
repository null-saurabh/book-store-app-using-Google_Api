import 'package:bookappforappavenger/Update/api_calls.dart';
import 'package:bookappforappavenger/View/screen/book_details_scrren.dart';
import 'package:flutter/material.dart';

class SearchScreen extends SearchDelegate {
  String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  final BookApi api = BookApi();
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder(
      future: api.searchBooks(searchBook: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Ops! Try again later!"),
          );
        }
        if (snapshot.hasData) {
          // print(snapshot.data?.items?.length);
          return ListView.builder(
            itemCount: snapshot.data?.items!.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    snapshot.data?.items?[index].id != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookDetailScreen(
                                    bookId: snapshot.data?.items?[index].id,
                                    image: snapshot
                                            .data
                                            ?.items?[index]
                                            .volumeInfo
                                            ?.imageLinks
                                            ?.thumbnail ??
                                        errorLink)))
                        : null;
                  },
                  leading: SizedBox(
                    width: 48,
                    child: Image(
                      image: NetworkImage(
                          "${snapshot.data?.items?[index].volumeInfo?.imageLinks?.thumbnail ?? errorLink}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      snapshot.data?.items![index].volumeInfo?.authors == null
                          ? const Text("Author Not Found",
                              style: TextStyle(color: Colors.grey))
                          : Text(
                              "Author: ${snapshot.data?.items![index].volumeInfo?.authors.join(" ")}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                      Text(
                          "Published Date:${snapshot.data?.items![index].volumeInfo?.publishedDate} ",
                          style: const TextStyle(color: Colors.grey))
                    ],
                  ),
                  title: Text(
                      "${snapshot.data?.items![index].volumeInfo?.title}",
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black87,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    return FutureBuilder(
      future: api.searchBooks(searchBook: "Business"),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Ops! Try again later!"),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 10,
            // snapshot.data?.items?.length
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: ListTile(
                    onTap: () {
                      snapshot.data?.items?[index].id != null
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetailScreen(
                                      bookId: snapshot.data?.items?[index].id,
                                      image: snapshot
                                              .data
                                              ?.items?[index]
                                              .volumeInfo
                                              ?.imageLinks
                                              ?.thumbnail ??
                                          errorLink)))
                          : null;
                    },
                    leading: SizedBox(
                      width: 48,
                      child: Image(
                        image: NetworkImage(
                          snapshot.data?.items?[index].volumeInfo?.imageLinks
                                  ?.thumbnail ??
                              errorLink,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Author: ${snapshot.data?.items?[index].volumeInfo?.authors?.join(" ")}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                            "Published Date:${snapshot.data?.items![index].volumeInfo?.publishedDate} ",
                            style: const TextStyle(color: Colors.grey))
                      ],
                    ),
                    title: Text(
                        "${snapshot.data?.items![index].volumeInfo?.title}",
                        style: const TextStyle(fontWeight: FontWeight.bold))),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black87,
          ),
        );
      },
    );
  }
}
