part of dashboard;

class _HeaderWeeklyTask extends StatelessWidget {
  final Function() onPressedNewTask;
  final Function() onPressedAssignTask;

  const _HeaderWeeklyTask({
    Key? key,
    required this.onPressedNewTask,
    required this.onPressedAssignTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('所有任务')
          .fontSize(18)
          .fontWeight(FontWeight.w800),
        const Spacer(),
        ElevatedButton.icon(
          onPressed: onPressedNewTask,
          icon: const Icon(Icons.link),
          label: const Text('分配'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey[800],
            backgroundColor: Colors.blueGrey[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
        ).padding(right: 5),
        ElevatedButton.icon(
          onPressed: onPressedNewTask,
          icon: const Icon(EvaIcons.plus),
          label: const Text('新建'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
        )
      ],
    );
  }
}