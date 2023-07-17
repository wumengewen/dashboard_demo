import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:timeago/timeago.dart' as timeago; // 用于格式化时间成指定字符串
import 'package:dotted_border/dotted_border.dart';

class TaskAssignItemData {
  final IconData icon;
  final String title;
  final String jobDesk;
  final DateTime? editDate;
  final String? assignTo;
  final Color? color;

  const TaskAssignItemData({
    required this.icon,
    required this.title,
    required this.jobDesk,
    this.editDate,
    this.assignTo,
    this.color
  });
}

class TaskAssignItem extends StatelessWidget {
  final TaskAssignItemData data;
  final Function() onPressed;
  final Function()? onPressAssignTo;

  const TaskAssignItem({
    Key? key,
    required this.data,
    required this.onPressed,
    required this.onPressAssignTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile( // 解锁新组件, 这个将InkWell封装在里面了
      onTap: onPressed, // 这里onTap是要传入一个void的Function
      hoverColor: Colors.transparent, // 这个属性是设置鼠标悬浮时的颜色
      splashColor: Colors.blueGrey[50]!, // 这个属性是设置点击时涟漪的颜色
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      leading: Icon(
        data.icon,
        color: data.color ?? Theme.of(context).primaryColor,
        )
        .padding(all: 10)
        .decorated(
          color: const Color.fromARGB(255, 242, 247, 250),
          borderRadius: BorderRadius.circular(15),
        )
        .elevation(
          0.5,
          shadowColor: Colors.grey[200]!,
          borderRadius: BorderRadius.circular(15),
        ),
      title: Text(data.title)
        .fontSize(14)
        .fontWeight(FontWeight.w600)
        .textColor(Colors.grey[800]),
      subtitle: Text(
          data.editDate == null ? 
            data.jobDesk : 
            '${data.jobDesk} \u2022 edited about ${timeago.format(data.editDate!)}'
        )
        .fontSize(12)
        .textColor(Colors.blueGrey),
      trailing: (data.assignTo != null)
        ? Tooltip( // 用于显示提示信息的组件
            message: data.assignTo!,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: data.color?.withOpacity(0.2) ?? Colors.orange.withOpacity(0.2),
              child: Text(data.assignTo!)
                .fontSize(14)
                .textColor(data.color ?? Colors.orange)
                .fontWeight(FontWeight.w800),
            )
          ).ripple()
            .clipRRect(all: 22)
        : DottedBorder(
            color: Colors.blueGrey[300]!,
            strokeWidth: .3,
            strokeCap: StrokeCap.round, // 加上这个虚线会更密集
            borderType: BorderType.Circle,
            child: IconButton(
              onPressed: onPressAssignTo,
              color: Colors.blueGrey,
              iconSize: 15,
              icon: const Icon(EvaIcons.plus),
              splashRadius: 22, // 这个属性是设置点击时涟漪的半径
              tooltip: "assign", // 这个属性是设置鼠标悬浮时显示的提示信息
            ),
          )
    );
  }
}