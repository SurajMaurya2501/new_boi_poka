class HomeBookModel {
  String kind;
  String id;
  String etag;
  String selfLink;
  VolumeInfo volumeInfo;

  HomeBookModel({
    required this.kind,
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
  });

  factory HomeBookModel.fromJson(Map<String, dynamic> json) {
    return HomeBookModel(
      kind: json['kind'],
      id: json['id'],
      etag: json['etag'],
      selfLink: json['selfLink'],
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo']),
    );
  }
}

class VolumeInfo {
  String title;
  List<String> authors;
  ImageLinks imageLinks;
  List<IndustryIdenfiers> industryIdentifiers;
  final String description;
  List<dynamic> categories;

  VolumeInfo(
      {required this.title,
      required this.authors,
      required this.imageLinks,
      required this.industryIdentifiers,
      required this.description,
      required this.categories});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    List<dynamic> industryIdentifiersList = json['industryIdentifiers'] ?? [];

    return VolumeInfo(
        description: json['description'] ?? "No Descirption Available",
        title: json['title'],
        authors: List<String>.from(json['authors'] ?? []),
        imageLinks: ImageLinks.fromJson(json["imageLinks"] ?? {}),
        //  json["imageLinks"],
        industryIdentifiers: industryIdentifiersList
            .map((e) => IndustryIdenfiers.fromJson(e))
            .toList(),
        categories: json['categories'] ?? []);
  }
}

class ImageLinks {
  String smallThumbnail;
  String thumbnail;

  ImageLinks({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
    );
  }
}

class IndustryIdenfiers {
  final String identifier;
  final String type;

  IndustryIdenfiers({required this.type, required this.identifier});

  factory IndustryIdenfiers.fromJson(Map<String, dynamic> json) {
    return IndustryIdenfiers(
        identifier: json['identifier'] ?? "", type: json['type'] ?? "");
  }
}
