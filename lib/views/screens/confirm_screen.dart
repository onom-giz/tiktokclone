import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictok_clone2/controllers/upload_video_controller.dart';
import 'package:tictok_clone2/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const ConfirmScreen(
      {super.key,
      required this.videoFile,
      required this.videoPath});

  @override
  State<ConfirmScreen> createState() =>
      _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  TextEditingController _songController =
      TextEditingController();

  TextEditingController _captionController =
      TextEditingController();

  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller =
          VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height:
                  MediaQuery.of(context).size.height / 1.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10),
                    width:
                        MediaQuery.of(context).size.width -
                            20,
                    child: TextInputField(
                        controller: _songController,
                        icon: Icons.music_note,
                        lebelText: 'Song Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10),
                    width:
                        MediaQuery.of(context).size.width -
                            20,
                    child: TextInputField(
                        controller: _captionController,
                        icon: Icons.closed_caption,
                        lebelText: 'Caption'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () =>
                          uploadVideoController.uploadVideo(
                              _songController.text,
                              _captionController.text,
                              File(widget.videoPath)),
                      child: const Text(
                        'Share!',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
