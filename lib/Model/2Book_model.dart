// class Books {
//   String? kind;
//   int? totalItems;
//   List<Items>? items;
//
//   Books({this.kind, this.totalItems, this.items});
//
//   Books.fromJson(Map<String, dynamic> json) {
//     kind = json['kind'];
//     totalItems = json['totalItems'];
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items?.add(Items.fromJson(v));
//       });
//     }
//   }
// }
//
// class Items {
//   String? kind;
//   String? id;
//   String? etag;
//   String? selfLink;
//   VolumeInfo? volumeInfo;
//   SaleInfo? saleInfo;
//   AccessInfo accessInfo;
//
//
//   Items({this.kind, this.id, this.etag, this.selfLink, this.volumeInfo, this.saleInfo,this.accessInfo,});
//
//   Items.fromJson(Map<String, dynamic> json) {
//     kind = json['kind'];
//     id = json['id'];
//     etag = json['etag'];
//     selfLink = json['selfLink'];
//     volumeInfo = json['volumeInfo'] != null
//         ? VolumeInfo.fromJson(json['volumeInfo'])
//         : null;
//     saleInfo = json['saleInfo'] != null
//         ?SaleInfo.fromJson(json['saleInfo'])
//         :null;
//   }
// }
//
// class VolumeInfo {
//   String? title;
//   List<String>? authors;
//   String? publisher;
//   String? publishedDate;
//   String? description;
//   int? pageCount;
//   String? printType;
//   List<String>? categories;
//   double? averageRating;
//   int? ratingsCount;
//   ImageLinks? imageLinks;
//   SaleInfo? saleInfo;
//
//   VolumeInfo(
//       {this.title,
//         this.authors,
//         this.publisher,
//         this.publishedDate,
//         this.description,
//         this.pageCount,
//         this.printType,
//         this.categories,
//         this.averageRating,
//         this.ratingsCount,
//         this.imageLinks,
//         this.saleInfo
//       });
//
//   VolumeInfo.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     authors = json['authors']?.cast<String>();
//     publisher = json['publisher'];
//     publishedDate = json['publishedDate'];
//     description = json['description'];
//     pageCount = json['pageCount'];
//     printType = json['printType'];
//     categories = json['categories']?.cast<String>();
//     averageRating = json['averageRating']?.toDouble();
//     ratingsCount = json['ratingsCount'];
//     imageLinks = json['imageLinks'] != null
//         ? ImageLinks.fromJson(json['imageLinks'])
//         : null;
//     saleInfo: json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
//   }
// }
//
// class ImageLinks {
//   String? smallThumbnail;
//   String? thumbnail;
//
//   ImageLinks({this.smallThumbnail, this.thumbnail});
//
//   ImageLinks.fromJson(Map<String, dynamic> json) {
//     smallThumbnail = json['smallThumbnail'];
//     thumbnail = json['thumbnail'];
//   }
// }
//
// class SaleInfo {
//   final String? country;
//   final String? saleability;
//   final bool? isEbook;
//   final Price? listPrice;
//   final Price? retailPrice;
//
//   SaleInfo({this.country, this.saleability, this.isEbook, this.listPrice, this.retailPrice});
//
//   factory SaleInfo.fromJson(Map<String, dynamic> json) {
//     return SaleInfo(
//       country: json['country'],
//       saleability: json['saleability'],
//       isEbook: json['isEbook'],
//       listPrice: json['listPrice'] != null ? Price.fromJson(json['listPrice']) : null,
//       retailPrice: json['retailPrice'] != null ? Price.fromJson(json['retailPrice']) : null,
//     );
//   }
// }
//
// class Price {
//   final double? amount;
//   final String? currencyCode;
//
//   Price({this.amount, this.currencyCode});
//
//   factory Price.fromJson(Map<String, dynamic> json) {
//     return Price(
//       amount: json['amount'],
//       currencyCode: json['currencyCode'],
//     );
//   }
// }
