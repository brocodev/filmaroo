
import 'dart:convert';

import 'package:filmaroo/src/models/movie.dart';

MovieCast movieCastFromJson(String str) => MovieCast.fromJson(json.decode(str));

String movieCastToJson(MovieCast data) => json.encode(data.toJson());

class MovieCast {
  MovieCast({
    this.id,
    this.cast, Movie movie,
  });

  int id;
  List<Cast> cast;

  factory MovieCast.fromJson(Map<String, dynamic> json) => MovieCast(
    id: json["id"],
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
  };
}

class Cast {
  Cast({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    castId: json["cast_id"],
    character: json["character"],
    creditId: json["credit_id"],
    gender: json["gender"],
    id: json["id"],
    name: json["name"],
    order: json["order"],
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "cast_id": castId,
    "character": character,
    "credit_id": creditId,
    "gender": gender,
    "id": id,
    "name": name,
    "order": order,
    "profile_path": profilePath,
  };

  final _baseImageUrl = "https://image.tmdb.org/t/p/w500/";
  final _noAvailableImagePath = "https://i.ibb.co/rFNrFrF/placeholder-no-available.png";

  String getProfileImagePath(){
    if(profilePath !=null){
      return "$_baseImageUrl$profilePath";
    }else{
      return _noAvailableImagePath;
    }
  }
}
