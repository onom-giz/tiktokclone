import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String username;
  String comment;
  final datePublished;
  List likes;
  String profilePhoto;
  String uid;
  String id;

  Comment({
    required this.comment,
    required this.datePublished,
    required this.username,
    required this.id,
    required this.likes,
    required this.profilePhoto,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'comment': comment,
        "datePublished": datePublished,
        'likes': likes,
        'profilePhoto': profilePhoto,
        'uid': uid,
        'id': id,
      };
  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Comment(
        comment: snapshot['username'],
        datePublished: snapshot['datePublished'],
        username: snapshot['username'],
        id: snapshot['id'],
        likes: snapshot['likes'],
        profilePhoto: snapshot['profilePhoto'],
        uid: snapshot['uid']);
  }
}
