




import 'dart:io';


import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final  chatState;
  const DisplayImage({super.key, required this.chatState});

  @override
  Widget build(BuildContext context) {
     final image = chatState.selectedImage;
    
    return Positioned(
        right: 10,
        bottom: 51,
        child: Container(
          height: 60,
          width: 90,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: FileImage(File(image!)),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  }

}
