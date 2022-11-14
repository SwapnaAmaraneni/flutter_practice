import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import 'notifer_list.dart';

class UserImageComponent extends StatelessWidget {
  const UserImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return GestureDetector(
      onTap: (() async {
        final imageFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        userImagePath.value = imageFile;
      }),
      child: ValueListenableBuilder(
        valueListenable: userImagePath,
        builder: (context, value, child) {
          return value == null
              ? Image.asset("assets/user.png", width: 100,
                  height: 100,)
              : Image.file(
                  File(value.path),
                  
                );
        },
      ),
    );
  }
}
