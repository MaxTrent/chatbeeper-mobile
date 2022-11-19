// To parse this JSON data, do
//
//     final getBeepModel = getBeepModelFromJson(jsonString);

import 'dart:convert';

List<GetBeepModel> getBeepModelFromJson(String str) => List<GetBeepModel>.from(
    json.decode(str).map((x) => GetBeepModel.fromJson(x)));

String getBeepModelToJson(List<GetBeepModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBeepModel {
  GetBeepModel({
    required this.id,
    required this.text,
    required this.userId,
    required this.commentsCount,
    required this.likes,
    required this.likesCount,
    required this.dislikes,
    required this.dislikesCount,
    required this.beeps,
    required this.beepsCount,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String? id;
  String? text;
  String? userId;
  int? commentsCount;
  List<dynamic>? likes;
  int? likesCount;
  List<dynamic>? dislikes;
  int? dislikesCount;
  List<dynamic>? beeps;
  int? beepsCount;
  List<dynamic>? comments;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory GetBeepModel.fromJson(Map<String, dynamic> json) => GetBeepModel(
        id: json["_id"]??null,
        text: json["text"]?? null,
        userId: json["userId"]?? null,
        commentsCount: json["commentsCount"]??null,
        likes: json["likes"]!=null && json["likes"].isNotEmpty?
        List<dynamic>.from(json["likes"].map((x) => x)):null,
        likesCount: json["likesCount"]??null,
        dislikes: json['dislikes']!=null && json['dislikes'].isNotEmpty?
        List<dynamic>.from(json["dislikes"].map((x) => x)):null,
        dislikesCount: json["dislikesCount"]??null,
        beeps: json['beeps']!=null && json['beeps'].isNotEmpty?
        List<dynamic>.from(json["beeps"].map((x) => x)):null,
        beepsCount: json["beepsCount"]??null,
        comments: json['comments']!=null && json['comments'].isNotEmpty?
        List<dynamic>.from(json["comments"].map((x) => x)):null,
        createdAt: DateTime.parse(json["createdAt"]??null),
        updatedAt: DateTime.parse(json["updatedAt"]??null),
        v: json["__v"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "_id": id??"",
        "text": text ?? "",
        "userId": userId?? "",
        "commentsCount": commentsCount ?? "",
        "likes": likes!=null ?List<dynamic>.from(likes!.map((x) => x)):[],
        "likesCount": likesCount??"",
        "dislikes": dislikes!=null?List<dynamic>.from(dislikes!.map((x) => x)):[],
        "dislikesCount": dislikesCount,
        "beeps": beeps!=null?List<dynamic>.from(beeps!.map((x) => x)):[],
        "beepsCount": beepsCount??"",
        "comments":comments!=null? List<dynamic>.from(comments!.map((x) => x)):[],
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v?? "",
      };
}
