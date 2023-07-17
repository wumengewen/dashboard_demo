part of dashboard; // 以主页DashBoard为主控

class Pages {
  static const initialPage = _Path.dashboard;

  static final routes = [
    GetPage(
      name: _Path.dashboard,
      page: () => const DashBoard(),
      binding: DashBoardBinding(),
    ),
  ];
}