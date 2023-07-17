part of dashboard;

class _TaskAssignItemList extends StatelessWidget {
  final List<TaskAssignItemData> data;
  final Function(int index, TaskAssignItemData data) onPressed;
  final Function(int index, TaskAssignItemData data) onPressAssignTo;

  const _TaskAssignItemList({
    Key? key,
    required this.data,
    required this.onPressed,
    required this.onPressAssignTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.asMap().entries.map((e) {
        final index = e.key;
        final data = e.value;

        return TaskAssignItem(
          data: data,
          onPressed: () => onPressed(index, data),
          onPressAssignTo: () => onPressAssignTo(index, data),
        );
      }).toList(),
    );
  }
}