import 'dart:convert';
import 'package:bookappforappavenger/Model/Book_Model.dart';
import 'package:bookappforappavenger/Model/book_details_model.dart';
import 'package:http/http.dart' as http;

class BookApi{

  Future getCategoryBooks({required String bookCategory, required String maxResult}) async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=subject:$bookCategory&startIndex=0&maxResults=$maxResult&key=AIzaSyA-MUZ0dH9r-ihqedSBgSbzSElKGV0mzqM"),
    );
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return Books.fromJson(data);
    }
    else{
      throw Exception('Failed to load');
    }
  }



  Future searchBooks({required String searchBook}) async {
    final response = await http.get(
      Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=$searchBook&maxResults=39&key=AIzaSyA-MUZ0dH9r-ihqedSBgSbzSElKGV0mzqM"),
    );
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return Books.fromJson(data);
    }
    else{
      throw Exception('Failed to load');
    }
  }

  Future showBooksDetails({required String bookId}) async {
    final response = await http.get(
      Uri.parse("https://www.googleapis.com/books/v1/volumes/$bookId&key=AIzaSyA-MUZ0dH9r-ihqedSBgSbzSElKGV0mzqM"),
    );
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return DetailModel.fromJson(data);
      // return BookDetails.fromJson(data);
    }
    else{
      throw Exception('Failed to load');
    }
  }
}