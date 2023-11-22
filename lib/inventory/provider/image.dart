import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class image extends ChangeNotifier {
  String picture = "";
  File? f;

  String sam2 = "";
  File? f2;

  String sam3 = "";
  File? f3;

  String sam4 = "";
  File? f4;

  void pic() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    picture = img!.path.toString();
    f = File(img.path);
    notifyListeners();
  }

  String sam1 = "";
  File? f1;

  List<File> pics = [];
  void up1() async {
    try {
      if (pics.isNotEmpty) {
        pics.clear();
      }
      sam1 = "";
      sam2 = "";
      sam3 = "";
      sam4 = "";

      final img = await ImagePicker().pickMultiImage();

      for (var e in img) {
        pics.add(File(e.path));
      }
      if (pics.length == 1) {
        f1 = pics[0];
        sam1 = f1!.path.toString();
      } else if (pics.length == 2) {
        f1 = pics[0];
        sam1 = f1!.path.toString();

        f2 = pics[1];

        sam2 = f2!.path.toString();
      } else if (pics.length == 3) {
        f1 = pics[0];
        sam1 = f1!.path.toString();

        f2 = pics[1];

        sam2 = f2!.path.toString();
        f3 = pics[2];

        sam3 = f3!.path.toString();
      } else if (pics.length == 4) {
        f1 = pics[0];
        sam1 = f1!.path.toString();

        f2 = pics[1];

        sam2 = f2!.path.toString();

        f3 = pics[2];
        sam3 = f3!.path.toString();

        f4 = pics[3];

        sam4 = f4!.path.toString();
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
