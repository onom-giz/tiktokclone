import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tictok_clone2/controllers/auth_controller.dart';
import 'package:tictok_clone2/views/screens/add_video_screen.dart';
import 'package:tictok_clone2/views/screens/video_screen.dart';

List pages = [
  VideoScreen(),
  Text('Search Screen'),
  const AddVideoScreen(),
  Text('Messages Screen'),
  Text('Profile Screen'),
];

//COLORS
const backgroundColors = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
