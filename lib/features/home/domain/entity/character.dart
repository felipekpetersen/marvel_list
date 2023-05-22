import 'package:equatable/equatable.dart';

class Character extends Equatable{
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final Thumbnail? thumbnail;
  final String? resourceURI;
  final Comics? comics;
  final Comics? series;
  final Comics? stories;
  final Comics? events;
  final List<Urls>? urls;

  const Character(
      {required this.id,
      required this.name,
       this.description,
       this.modified,
       this.thumbnail,
       this.resourceURI,
       this.comics,
       this.series,
       this.stories,
       this.events,
       this.urls});
       
         @override
         // TODO: implement props
         List<Object?> get props => [id, name, description, modified, thumbnail, resourceURI, comics, series, stories, events, urls];
  }

class Thumbnail extends Equatable{
  final String? path;
  final String? extension;

  Thumbnail({this.path, this.extension});
  
  @override
  // TODO: implement props
  List<Object?> get props => [path, extension];
}

class Comics extends Equatable{
  final int? available;
  final String? collectionURI;
  final List<Items>? items;
  final int? returned;

  Comics({this.available, this.collectionURI, this.items, this.returned});
  
  @override
  // TODO: implement props
  List<Object?> get props => [available, collectionURI, items, returned];
}


class Items extends Equatable{
  final String? resourceURI;
  final String? name;
  final String? type;

  Items({this.resourceURI, this.name, this.type});

  @override
  List<Object?> get props => [resourceURI, name, type];
}


class Urls extends Equatable{
  final String? type;
  final String? url;

  Urls({this.type, this.url});

  @override 
  List<Object?> get props => [type, url];
}