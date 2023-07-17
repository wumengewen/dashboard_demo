import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class TaskCardData {
  final String title;
  final String type;
  final String time;
  final String remaindHours;
  final Color color;

  const TaskCardData({
    required this.title,
    required this.type,
    required this.time,
    required this.remaindHours,
    required this.color,
  });
}

class TaskCard extends StatefulWidget {
  final TaskCardData data;
  final Function(TaskCardData data) onPressed;

  const TaskCard({
    Key? key,
    required this.data,
    required this.onPressed
  }) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard>  {
  late bool selected; // 借助该属性来实现点击卡片时的动画效果

  @override
  void initState() {
    super.initState();
    selected = false;
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardContent()
      .padding(all: 20)
      .constrained(width: 250, height: 250) // !刚才这里报RenderFlex children have non-zero flex but incoming width constraints are unbounded的错误, 是因为卡片没有设置宽高导致的
      // ? 这里设置的height好像没有用, 卡片的高度会随着ListView的个高度改变而改变
      .decorated(
        gradient: LinearGradient(
          colors: [widget.data.color, widget.data.color.withOpacity(0.5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      )
      .ripple(splashColor: widget.data.color.withOpacity(0.3))
      .clipRRect(all: 30)
      .scale(all: selected ? 1.05 : 1, animate: true) // 刚才能放大放小但没有动画效果是因为scale那里忘记设置animate: true了
      .gestures(
        // onTap: () => widget.onPressed(widget.data),
        onTapDown: (_) => setState(() => selected = true),
        onTapCancel: () => setState(() => selected = false),
      )
      .animate(const Duration(milliseconds: 200), Curves.bounceInOut)
    ;
  }

  Widget _buildCardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.data.title, maxLines: 1, overflow: TextOverflow.ellipsis)
          .textStyle(const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 1,
          )),
        const SizedBox(height: 10),
        Text(widget.data.type, overflow: TextOverflow.ellipsis)
          .fontSize(10)
          .textColor(Colors.white.withOpacity(0.8))
          .padding(all: 5)
          .decorated(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
        // const SizedBox(height: 30),
        const Spacer(flex: 2), // flex用于指定Spacer占用空白空间的比例
        Row(
          children: [
            const Icon(EvaIcons.clockOutline, color: Colors.white)
              .iconSize(15)
              .padding(right: 5),
            Text(widget.data.time, overflow: TextOverflow.ellipsis)
              .fontSize(10)
              .textColor(Colors.white.withOpacity(0.8)),
            const Spacer(),
            VerticalDivider(color: Colors.white.withOpacity(0.8))
              .constrained(height: 15),
            const Spacer(),
            const Icon(EvaIcons.clockOutline, color: Colors.white)
              .iconSize(15)
              .padding(right: 5),
            Text(widget.data.remaindHours, overflow: TextOverflow.ellipsis)
              .fontSize(10)
              .textColor(Colors.white.withOpacity(0.5)),
          ],
        ),
        // const SizedBox(height: ),这里就别手动指定固定高度了容易overflow
        const Spacer(),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(EvaIcons.checkmarkCircle2Outline),
          label: const Text('完成'),
          style: ElevatedButton.styleFrom( // 设置style属性可以自定义按钮样式
            backgroundColor: Colors.white,
            foregroundColor: widget.data.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )
        )
      ],
    );
  }
}
