part of dashboard; // 使用part of后, 就不用再import了, 它import的内容在library dashboard里import了

class _MainMenu extends StatelessWidget {
  final List<IconSelectedButtonData> data;
  final Function(int index, IconSelectedButtonData data) onSelected;

  const _MainMenu({
    Key? key,
    required this.data,
    required this.onSelected,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return IconSelectedButtons(data: data, onSelected: onSelected);
  }
}


