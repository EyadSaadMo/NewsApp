import 'package:flutter/material.dart';

class UserModel {
  final String image;
  final String name;
  final String message;
  final String time;
  UserModel(@required this.image, @required this.name, @required this.message,
      @required this.time);
}