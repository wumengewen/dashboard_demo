import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class Demo01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(
              'assets/images/rabbit.jpeg'), // 前面报Image找不到是因为没有在pubspec.yaml中声明assets
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed:() {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
          ),
          child: const Text('ElevatedButton'),
        )
      ],
    ).center()
    .decorated(color: Colors.white);
  }
}
