// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  String kind;
  int totalItems;
  List<Item> items;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
    required this.searchInfo,
  });

  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;
  SaleInfo saleInfo;
  AccessInfo accessInfo;
  SearchInfo searchInfo;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: SearchInfo.fromJson(json["searchInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
        "searchInfo": searchInfo.toJson(),
      };
}

class AccessInfo {
  AccessInfo({
    required this.country,
    required this.viewability,
    required this.embeddable,
    required this.publicDomain,
    required this.textToSpeechPermission,
    required this.epub,
    required this.pdf,
    required this.webReaderLink,
    required this.accessViewStatus,
    required this.quoteSharingAllowed,
  });

  String country;
  String viewability;
  bool embeddable;
  bool publicDomain;
  String textToSpeechPermission;
  Epub epub;
  Epub pdf;
  String webReaderLink;
  String accessViewStatus;
  bool quoteSharingAllowed;

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: json["country"],
        viewability: json["viewability"],
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: json["textToSpeechPermission"],
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: json["accessViewStatus"],
        quoteSharingAllowed: json["quoteSharingAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "viewability": viewability,
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermission,
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatus,
        "quoteSharingAllowed": quoteSharingAllowed,
      };
}

class Epub {
  Epub({
    required this.isAvailable,
  });

  bool isAvailable;

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
      );

  Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
      };
}

class SaleInfo {
  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
    required this.listPrice,
    required this.retailPrice,
    required this.buyLink,
    required this.offers,
  });

  String country;
  String saleability;
  bool isEbook;
  SaleInfoListPrice listPrice;
  SaleInfoListPrice retailPrice;
  String buyLink;
  List<Offer> offers;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
        listPrice: SaleInfoListPrice.fromJson(json["listPrice"] ?? {}),
        retailPrice: SaleInfoListPrice.fromJson(json["retailPrice"] ?? {}),
        buyLink: json["buyLink"] ?? '',
        offers: json["offers"] != null ? List<Offer>.from((json["offers"]).map((x) => Offer.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "saleability": saleability,
        "isEbook": isEbook,
        "listPrice": listPrice.toJson(),
        "retailPrice": retailPrice.toJson(),
        "buyLink": buyLink,
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}

class SaleInfoListPrice {
  SaleInfoListPrice({
    required this.amount,
    required this.currencyCode,
  });

  int amount;
  String currencyCode;

  factory SaleInfoListPrice.fromJson(Map<String, dynamic> json) => SaleInfoListPrice(
        amount: json["amount"] ?? 0,
        currencyCode: json["currencyCode"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currencyCode": currencyCode,
      };
}

class Offer {
  Offer({
    required this.finskyOfferType,
    required this.listPrice,
    required this.retailPrice,
  });

  int finskyOfferType;
  OfferListPrice listPrice;
  OfferListPrice retailPrice;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json["finskyOfferType"],
        listPrice: OfferListPrice.fromJson(json["listPrice"]),
        retailPrice: OfferListPrice.fromJson(json["retailPrice"]),
      );

  Map<String, dynamic> toJson() => {
        "finskyOfferType": finskyOfferType,
        "listPrice": listPrice.toJson(),
        "retailPrice": retailPrice.toJson(),
      };
}

class OfferListPrice {
  OfferListPrice({
    required this.amountInMicros,
    required this.currencyCode,
  });

  int amountInMicros;
  String currencyCode;

  factory OfferListPrice.fromJson(Map<String, dynamic> json) => OfferListPrice(
        amountInMicros: json["amountInMicros"],
        currencyCode: json["currencyCode"],
      );

  Map<String, dynamic> toJson() => {
        "amountInMicros": amountInMicros,
        "currencyCode": currencyCode,
      };
}

class SearchInfo {
  SearchInfo({
    required this.textSnippet,
  });

  String textSnippet;

  factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
      );

  Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
      };
}

class VolumeInfo {
  VolumeInfo({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.panelizationSummary,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  String title;
  String subtitle;
  List<String> authors;
  String publisher;
  String publishedDate;
  String description;
  List<IndustryIdentifier> industryIdentifiers;
  ReadingModes readingModes;
  int pageCount;
  String printType;
  List<String> categories;
  double averageRating;
  int ratingsCount;
  String maturityRating;
  bool allowAnonLogging;
  String contentVersion;
  PanelizationSummary panelizationSummary;
  ImageLinks imageLinks;
  String language;
  String previewLink;
  String infoLink;
  String canonicalVolumeLink;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"] ?? '',
        authors: List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"] ?? '',
        publishedDate: json["publishedDate"],
        description: json["description"] ?? '',
        industryIdentifiers: List<IndustryIdentifier>.from(json["industryIdentifiers"].map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"],
        printType: json["printType"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        averageRating: json["averageRating"] != null ? double.parse(json["averageRating"].toString()) : 0.0,
        ratingsCount: json["ratingsCount"] ?? 0,
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: PanelizationSummary.fromJson(json["panelizationSummary"] ?? {}),
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "publisher": publisher,
        "publishedDate": publishedDate,
        "description": description,
        "industryIdentifiers": List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
        "readingModes": readingModes.toJson(),
        "pageCount": pageCount,
        "printType": printType,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary.toJson(),
        "imageLinks": imageLinks.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
      };
}

class ImageLinks {
  ImageLinks({
    required this.smallThumbnail,
    required this.thumbnail,
  });

  String smallThumbnail;
  String thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
      };
}

class IndustryIdentifier {
  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  String type;
  String identifier;

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
      };
}

class PanelizationSummary {
  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  bool containsEpubBubbles;
  bool containsImageBubbles;

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"] ?? false,
        containsImageBubbles: json["containsImageBubbles"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
      };
}

class ReadingModes {
  ReadingModes({
    required this.text,
    required this.image,
  });

  bool text;
  bool image;

  factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
      };
}
