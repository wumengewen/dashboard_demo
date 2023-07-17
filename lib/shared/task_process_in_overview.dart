import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:percent_indicator/percent_indicator.dart'; // 这个包用于生成进度条

class TaskProgressOverviewData {
  final int completed;
  final int total;

  const TaskProgressOverviewData({
    required this.completed,
    required this.total,
  });
}

class TaskProgressOverview extends StatelessWidget {
  final TaskProgressOverviewData data;

  const TaskProgressOverview({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('当前任务') //TODO: 后面尝试用DataTime生成对应日期
          .fontSize(18)
          .fontWeight(FontWeight.w800)
          .expanded(),
        const Spacer(),
        Row(
          children: [
            Text('${data.completed}/${data.total} 已完成')
              .fontSize(12)
              .textColor(Colors.grey),

            // 这个来源于这个包percent_indicator, 它自带有padding, 这里用到LinearPercentIndicator跟firstdaliytask那个项目的不太一样, 比它多了个barRadius参数
            LinearPercentIndicator( // !这个组件如果不指定width, 则会默认infinity, 然后会导致父组件使用它的报RenderFlex ... but incoming unbounded constrained的错误, 记住infinity = unbounded constrained, 它和flex和extand这些弹性布局组件是不一样的
              lineHeight: 8,
              barRadius: const Radius.circular(5),
              percent: data.completed / data.total,
              backgroundColor: Colors.blueGrey[100],
              progressColor: Colors.blue[400],
            )
            .expanded() // 由于LinearPercentIndicator的原型是Container并且其默认宽度是infinity, 只有将其转成弹性组件后才可contrained它的宽度

            // LinearProgressIndicator( //这个是ProgressIndicator, flutter自带的
            //   value: data.completed / data.total,
            //   backgroundColor: Colors.blueGrey[200],
            //   valueColor: AlwaysStoppedAnimation(Colors.blue[400]),
            // )
          ],
        )
        .constrained(width: 200) // 解释: 见.expanded()那里的注释
      ],
    );
    // .padding(horizontal: 10);
    // .expanded(); // 加上这个回报高度unbound
  }
}
