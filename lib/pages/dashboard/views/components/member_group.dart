part of dashboard;

class _MemberGroup extends StatelessWidget {
  final List<UserProfileData> data;
  final Function(UserProfileData data) onPressed;

  const _MemberGroup({
    Key? key,
    required this.data,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((e) => 
        UserProfile(
          data: e,
          onPressed: onPressed,
        ).padding(bottom: 10)
      ).toList()
    );
  }
}