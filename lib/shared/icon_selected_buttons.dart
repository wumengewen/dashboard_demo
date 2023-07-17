import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class IconSelectedButtonData {
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String label;
  final int? notifCount;

  IconSelectedButtonData({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
    this.notifCount,
  });
}

class IconSelectedButtons extends StatefulWidget {
  const IconSelectedButtons({
    Key? key,
    this.initSelectedIndex = 0,
    required this.data,
    required this.onSelected,
  }) : super(key: key);

  final int initSelectedIndex;
  final List<IconSelectedButtonData> data;
  final Function(int index, IconSelectedButtonData data) onSelected;

  @override
  State<IconSelectedButtons> createState() => IconSelectedButtonsState();
}

class IconSelectedButtonsState extends State<IconSelectedButtons> {
  late int selectIndex;

  @override
  void initState() {
    super.initState();
    selectIndex = widget.initSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.asMap().entries.map((e) {
        final index = e.key;
        final data = e.value;
        final selected = index == selectIndex;

        return Row(
          children: [
            // TODO: 后面做一下切换两个图标的动画
            selected ? 
              Icon(data.activeIcon, color: Theme.of(context).primaryColor)
                .padding(right: 10)
              : 
              Icon(data.inactiveIcon, color: const Color.fromRGBO(72, 76, 99, 1))
                .padding(right: 10),
            
            Text(data.label)
              .fontSize(16)
              .fontWeight(FontWeight.bold)
              .textColor(selected ? Theme.of(context).primaryColor : const Color.fromRGBO(72, 76, 99, 1)),
            
            const Spacer(),

            data.notifCount != null ?
              Text((data.notifCount! > 99) ? '99+' : data.notifCount.toString(), textAlign: TextAlign.center)
                .fontSize(10)
                .textColor(Colors.white)
                .constrained(width: 20)
                .padding(all: 5)
                .decorated(
                  color: Colors.amber,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                )
                .padding(right: 5)
                :
                Container()
          ],
        ).padding(all: 10)
        .decorated(
          color: selected ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        )
        .ripple()
        .clipRRect(all: 30)
        .gestures( // 设置点击事件和ripple后, 鼠标在item上面悬浮时才会有选择的效果
          onTap: () {
            setState(() {
              selectIndex = index;
            });
            widget.onSelected(index, data);
          },
        )
        .padding(bottom: 5);
      }).toList(),
    );
  }
}