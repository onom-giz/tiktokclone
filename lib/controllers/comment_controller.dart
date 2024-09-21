import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tictok_clone2/constants.dart';
import 'package:tictok_clone2/models/comment.dart';

class CommentController extends GetxController {
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get comments => _comments.value;

  String _postId = "";
  uploadPostId(String id) {
    _postId = id;
    getComment();
  }

  getComment() async {}
  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        DocumentSnapshot userDoc = await firestore
            .collection('users')
            .doc(authController.user.uid)
            .get();
        var allDocs = await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .get();
        int len = allDocs.docs.length;

        Comment comment = Comment(
          comment: commentText.trim(),
          datePublished: DateTime.now(),
          username: (userDoc.data()! as dynamic)['name'],
          id: 'Comment $len',
          likes: [],
          profilePhoto:
              (userDoc.data()! as dynamic)['profilePhoto'],
          uid: authController.user.uid,
        );
        await firestore
            .collection('videos')
            .doc(_postId)
            .collection('comments')
            .doc('Comment $len')
            .set(
              comment.toJson(),
            );
      }
    } catch (e) {
      Get.snackbar(
        'Error While Commenting',
        e.toString(),
      );
    }
  }

  void updatePostId(String id) {}
}
