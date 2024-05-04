import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  ImagePicker? imagePicker;
  File? image;
  String? result;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  imgFromCamera() async {
    XFile? pickedFile =
        await imagePicker?.pickImage(source: ImageSource.camera);
    pickedFile != null ? image = File(pickedFile.path) : () {};
    setState(() {
      image;
    });
  }

  imgFromGallery() async {
    XFile? pickedFile =
        await imagePicker?.pickImage(source: ImageSource.gallery);
    pickedFile != null ? image = File(pickedFile.path) : () {};
    setState(() {
      image;
    });
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Center(
        child: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              width: 500,
              height: 500,
              child: image != null
                  ? Image.file(
                      image!,
                    )
                  : Container()),
        ]),
      ),
      floatingActionButton: BottomNavigationBar(
        elevation: 3,
        onTap: (index) {
          onItemTapped(index);
          if (index == 0) {
            imgFromGallery();
          } else {
            imgFromCamera();
          }
        },
        currentIndex: selectedIndex,
        backgroundColor: Colors.deepPurpleAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Galery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_enhance),
            label: 'Camera',
          ),
        ],
      ),
    );
  }
}
