
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:dotted_border/dotted_border.dart';

class UserProfileData {
  final ImageProvider? image;
  final String name;
  final String email;
  final bool showMoreInfo;

  const UserProfileData({
    this.image,
    required this.name,
    required this.email,
    this.showMoreInfo = false,
  });
}

class UserProfile extends StatelessWidget {
  final UserProfileData data;
  final Function(UserProfileData data) onPressed;

  const UserProfile({
    Key? key,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: data.email,
      waitDuration: const Duration(milliseconds: 500),
      // verticalOffset: 5,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: DottedBorder(
              strokeCap: StrokeCap.round, // 加上这个虚线变实线
              color: Colors.blueGrey[100]!,
              borderType: BorderType.Circle,
              strokeWidth: 2,
              padding: const EdgeInsets.all(1), // 默认DottedBorder跟child会有点all: 2的间距
              child: CircleAvatar(
                radius: 20,
                backgroundImage: data.image ?? const AssetImage('assets/images/default.png'),
              )
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.name, maxLines: 1, overflow: TextOverflow.ellipsis)
                .fontSize(14)
                .fontWeight(FontWeight.w500)
                .textColor(Colors.grey[800]),
              data.showMoreInfo 
                ? Text(data.email, maxLines: 1, overflow: TextOverflow.ellipsis)
                  .fontSize(12)
                  .textColor(Colors.grey)
                : Container(),
            ],
          ).expanded(),// 名称和邮箱这块要弹性填充完剩余空间, 否则TextOverflow.ellipsis不生效导致文字把IconButton挤出去导致overflow

          // const Spacer(),
          IconButton(
            onPressed: () => onPressed(data),
            icon: const Icon(Icons.more_horiz, color: Colors.grey),
            splashRadius: 20, // 控制按钮大小
          )
        ],
      ).padding(all: 5)
      .ripple(
        hoverColor: Colors.transparent
      )
      .clipRRect(all: 30)
      .gestures(
        onTap: () => onPressed(data),
      ),
    );
  }
}
