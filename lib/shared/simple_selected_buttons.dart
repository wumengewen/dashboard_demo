import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class SimpleSelectButtonData {
  final String label;
  
  const SimpleSelectButtonData({
    required this.label,
  });
}


class SimpleSelectButton extends StatefulWidget {
  final int initSelectedIndex;
  final List<SimpleSelectButtonData> data;
  final Function(int index, SimpleSelectButtonData data) onSelected;

  const SimpleSelectButton({
    Key? key,
    this.initSelectedIndex = 0,
    required this.data,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<SimpleSelectButton> createState() => _SimpleSelectButtonState();
}

class _SimpleSelectButtonState extends State<SimpleSelectButton> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.asMap().entries.map((e) {
        final index = e.key;
        final data = e.value;
        bool selected = index == selectedIndex;

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // TODO: 指示条动画不生效
            Container()
              .constrained(width: 5, height: selected ? 20 : 0, animate: true)
              .decorated(
                color: selected ? Theme.of(context).primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                animate: true
              )
              .padding(right: 5)
              .animate(const Duration(milliseconds: 200), Curves.linear), // 刚才这里设置了动画但是看起来没有动画效果是因为Duration使用的是microseconds的单位, 改成milliseconds就好了

            Row(
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: selected ? Theme.of(context).primaryColor : const Color.fromRGBO(72, 76, 99, 1),
                )
                .padding(right: selected ? 15 : 10, animate: true)
                .animate(const Duration(milliseconds: 200), Curves.linear),

                Text(data.label)
                  .textColor(selected ? Theme.of(context).primaryColor : const Color.fromRGBO(72, 76, 99, 1))
                  .fontSize(14)
                  .fontWeight(FontWeight.bold)
                  .scale(all: selected ? 1.2 : 1, animate: true)
                  .animate(const Duration(milliseconds: 200), Curves.linear),
              ],
            )
            .padding(all: 10)
            // .ripple(hoverColor: Colors.blueAccent.withOpacity(0.1), splashColor: Colors.blue.withOpacity(0.1)) // hoverColor设置指针悬浮item在上面时item的颜色, splashColor设置点击item时涟漪的颜色
            // .clipRRect(all: 30)
            .ripple(
              hoverColor: Colors.transparent, 
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent, // 这个用来控制一直点着时的颜色
            )
            .gestures(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onSelected(index, data);
              }
            )
            .expanded()
          ],
        );
      }).toList(),
    );
  }
}

