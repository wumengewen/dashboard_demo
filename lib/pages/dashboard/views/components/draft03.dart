import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Draft03(),
    );
  }
}

class Draft03 extends StatefulWidget {
  const Draft03({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Draft03State createState() => _Draft03State();
}

class _Draft03State extends State<Draft03> {
  bool _selected = false;
  
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        // AnimatedContainer(
        //   duration: const Duration(milliseconds: 300),
        //   width: _selected ?  0: 100,
        //   height: maxHeight,
        //   color: Colors.amber,
        //   child: const Icon(Icons.home_filled, size: 80,),
        // ),
        // AnimatedContainer(
        //   duration: const Duration(milliseconds: 300),
        //   width: _selected ? maxWidth : maxWidth - 100,
        //   height: maxHeight,
        //   color: Colors.blue,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       setState(() {
        //         _selected = !_selected;
        //       });
        //     },
        //     child: const Text('Click'),
        //   )
        // ),
        Row(
          children: const [
            Icon(Icons.home_filled, size: 80,),
            Icon(Icons.star, size: 80,),
            Icon(Icons.ac_unit_sharp, size: 80,)
          ],
        )
          .scrollable(scrollDirection: Axis.horizontal)
          .constrained(width: _selected ?  0: 200, height: maxHeight, animate: true)
          .decorated(color: Colors.amber)
          .animate(const Duration(milliseconds: 300), Curves.linear)
          ,
        ElevatedButton(
          onPressed: () {
            setState(() {
              _selected = !_selected;
            });
          },
          child: const Text('Click'),
        )
          // .constrain
          .constrained(width: _selected ? maxWidth: maxWidth - 200, height: maxHeight, animate: true)
          .decorated(color: Colors.blue)
          .animate(const Duration(milliseconds: 300), Curves.linear)
      ],
    );
  }
}