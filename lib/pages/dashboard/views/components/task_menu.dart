part of dashboard; // 以主页为主控

class _TaskMenu extends StatelessWidget {
  final List<SimpleSelectButtonData> data;
  final Function(int index, SimpleSelectButtonData data) onSelected;

  const _TaskMenu({
    Key? key,
    required this.data,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleSelectButton(data: data, onSelected: onSelected);
  }
}