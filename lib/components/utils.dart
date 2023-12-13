//import 'dart:io';

//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:file_picker/file_picker.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}


Future<List<XFile>> pickImages() async {
  List<XFile> images = [];
  try {
    List<XFile>? pickedImages = await ImagePicker().pickMultiImage(
      //maxImages: 5, // Set the maximum number of images to be picked
      //imageQuality: 
    );

    if (pickedImages != null && pickedImages.isNotEmpty) {
      images.addAll(pickedImages);
    }
  } catch (e) {
    print('Error picking images: $e');
  }
  return images;
}
/*
Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return images;
}*/