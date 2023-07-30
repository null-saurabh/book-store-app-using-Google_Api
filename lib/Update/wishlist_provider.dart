
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListProvider with ChangeNotifier {
  List<String> _bookIds = [];

  List<String> get wishlistBookIds => _bookIds;

  WishListProvider() {
    _loadWishList();
  }

  Future<void> _loadWishList() async {
    final prefs = await SharedPreferences.getInstance();
    _bookIds = prefs.getStringList('wishlist') ?? [];
    notifyListeners();
  }

  void _saveWishList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('wishlist', _bookIds);
  }

  void addBookToWishList(String bookId) {
    _bookIds.add(bookId);
    _saveWishList();
    notifyListeners();  // notify all the listeners about this update
  }

  void removeBookFromWishList(String bookId) {
    _bookIds.remove(bookId);
    _saveWishList();
    notifyListeners();  // notify all the listeners about this update
  }
}


