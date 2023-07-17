part of dashboard;

class _TaskInProgress extends StatelessWidget {
  final List<TaskCardData> data;
  final Function(TaskCardData data) onPressedTaskCard;

  const _TaskInProgress({
    Key? key,
    required this.data,
    required this.onPressedTaskCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder( // ?这里使用ListView可以更好控制这些卡片列表且不会像使用ScrollView那样多出一个滚动条影响视觉, 如果使用Row, 会有一些问题, 比如卡片列表超出屏幕overflow、无法滚动等
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(), //physic这个用来设置滚动的效果, 这里使用BouncingScrollPhysics, 会有回弹效果
      // shrinkWrap: true, // 这里使用shrinkWrap, 会让ListView的高度自适应
      padding: const EdgeInsetsDirectional.symmetric(vertical: 30),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final curData = data[index];
        return TaskCard(
          data: curData,
          onPressed: onPressedTaskCard,
        ).padding(horizontal: 10);
      },
    )
    .constrained(height: 300);
  }
}