import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:tictok_clone2/controllers/comment_controller.dart';

// ignore: must_be_immutable
class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({super.key, required this.id});

  final TextEditingController _commentController =
      TextEditingController();

  CommentController commentController =
      Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage(
                                  'profile photo'),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  'username',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight:
                                          FontWeight.w700),
                                ),
                                Text(
                                  'comment description',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight:
                                          FontWeight.w500),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  'date',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '10 likes',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            trailing: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.favorite,
                                size: 25,
                                color: Colors.red,
                              ),
                            ),
                          );
                        });
                  }),
            ),
            const Divider(),
            ListTile(
              title: TextFormField(
                controller: _commentController,
                style: const TextStyle(
                    fontSize: 16, color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Comment',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              trailing: TextButton(
                  onPressed: () => commentController
                      .postComment(_commentController.text),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                        fontSize: 16, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
