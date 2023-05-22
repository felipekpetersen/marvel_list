import 'package:marvel_list/features/home/domain/entity/character.dart';

class CharacterModel {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? etag;
  Data? data;

  CharacterModel(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.etag,
      this.data});

  CharacterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Results>? results;

  Data({this.offset, this.limit, this.total, this.count, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }
}

class Results extends Character {
  const Results(
      {required super.id,
      required super.name,
      super.description,
      super.modified,
      super.thumbnail,
      super.resourceURI,
      super.comics,
      super.series,
      super.stories,
      super.events,
      super.urls});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      modified: json['modified'],
      thumbnail: json['thumbnail'] != null
          ? ThumbnailModel.fromJson(json['thumbnail'])
          : null,
      resourceURI: json['resourceURI'],
      comics: json['comics'] != null
          ? new ComicsModel.fromJson(json['comics'])
          : null,
      series: json['series'] != null
          ? new ComicsModel.fromJson(json['series'])
          : null,
      stories: json['stories'] != null
          ? new ComicsModel.fromJson(json['stories'])
          : null,
      events: json['events'] != null
          ? new ComicsModel.fromJson(json['events'])
          : null,
      urls: (json['urls'] != null)
          ? new List<UrlsModel>.from(
              json['urls'].map((x) => UrlsModel.fromJson(x)))
          : null,
    );
  }
}

class ThumbnailModel extends Thumbnail {
  String? path;
  String? extension;

  ThumbnailModel({this.path, this.extension});

  ThumbnailModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }
}

class ComicsModel extends Comics {
  ComicsModel(
      {super.available, super.collectionURI, super.items, super.returned});

  factory ComicsModel.fromJson(Map<String, dynamic> json) {
    return ComicsModel(
        available: json['available'],
        collectionURI: json['collectionURI'],
        items: json['items'] != null
            ? List<ItemsModel>.from(
                json['items'].map((x) => ItemsModel.fromJson(x)))
            : null,
        returned: json['returned']
        );
  }
}

class ItemsModel extends Items {
  String? resourceURI;
  String? name;
  String? type;

  ItemsModel({this.resourceURI, this.name, this.type});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }
}

class UrlsModel extends Urls {
  String? type;
  String? url;

  UrlsModel({this.type, this.url});

  UrlsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }
}
