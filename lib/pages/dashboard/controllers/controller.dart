part of dashboard; // 使用part of后, 就不用再import了, 它import的内容在library dashboard里import了

class DashBoardController extends GetxController with GetTickerProviderStateMixin {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final desktopShowMenu = true.obs;

  late AnimationController desktopSideBarAnimationController;

  final userProfileData = const UserProfileData(
    image: AssetImage('assets/images/rabbit.jpeg'),
    name: 'SewenST',
    email: 'wumengewen@qq.com',
    showMoreInfo: true
  );

  final memberGroupData = const [
    UserProfileData(
      // image: AssetImage('assets/images/rabbit.jpeg'),
      name: 'Firgia',
      email: 'firgiawick@gmail.com'
    ),
    UserProfileData(
      image: AssetImage('assets/images/鹰酱.png'),
      name: 'John Wick',
      email: 'johnwick@gmail.com'
    ),
    UserProfileData(
      image: AssetImage('assets/images/wumen.png'),
      name: 'Avril Lavigne',
      email: 'avrillavigne@icloud.com'
    ),
  ];

  final mainMenuData = [
    IconSelectedButtonData(
      activeIcon: EvaIcons.home, 
      inactiveIcon: EvaIcons.homeOutline, 
      label: '首页',
      notifCount: 4
    ),
    IconSelectedButtonData(
      activeIcon: EvaIcons.bell, 
      inactiveIcon: EvaIcons.bellOutline, 
      label: '通知',
      notifCount: 100,
    ),
    IconSelectedButtonData(
      activeIcon: EvaIcons.checkmarkCircle2, 
      inactiveIcon: EvaIcons.checkmarkCircle, 
      label: '任务',
      notifCount: 10,
    ),
    IconSelectedButtonData(
      activeIcon: EvaIcons.settings2, 
      inactiveIcon: EvaIcons.settings2Outline, 
      label: '设置'
    ),
  ];

  final taskMenuData = const [
    SimpleSelectButtonData(label: '全部'),
    SimpleSelectButtonData(label: '待办'),
    SimpleSelectButtonData(label: '已办'),
    SimpleSelectButtonData(label: '问题'),
  ];

  final taskCardsData = const [
    TaskCardData(
      title: '设计师沟通会',
      type: '设计',
      time: '6月9日',
      remaindHours: '2天',
      color: Colors.redAccent,
    ),
    TaskCardData(
      title: '新产品开发大会',
      type: '开发',
      time: '6月12日',
      remaindHours: '36天',
      color: Colors.deepPurple,
    ),
    TaskCardData(
      title: '核心系统功能开发',
      type: '开发',
      time: '6月17日',
      remaindHours: '180天',
      color: Colors.amber,
    ),
    TaskCardData(
      title: '功能测试上线',
      type: '测试',
      time: '7月14',
      remaindHours: '30天',
      color: Colors.teal,
    ),
  ];

  final taskAssignItemListData = [
    TaskAssignItemData(
      icon: CupertinoIcons.pencil_outline,
      title: 'iPhone18系列原稿设计',
      jobDesk: '设计',
      editDate: DateTime.now().add(- const Duration(days: 1)),
      assignTo: '李四',
      color: Colors.blueAccent,
    ),
    TaskAssignItemData(
      icon: CupertinoIcons.checkmark_seal_fill,
      title: 'iPad Pro 2024测试上线',
      jobDesk: '测试',
      editDate: DateTime.now().add(- const Duration(hours: 4)),
      assignTo: '烟鬼',
      color: Colors.teal[400],
    ),
    TaskAssignItemData(
      icon: CupertinoIcons.book_solid,
      title: 'EBook内容更新',
      jobDesk: '运营',
      color: Colors.yellow[800],
    ),
    const TaskAssignItemData(
      icon: CupertinoIcons.cloud_fill,
      title: 'iCloud扩容',
      jobDesk: '维护',
      color: Colors.blue,
    ),
  ];

  final taskProgressOverviewData = const TaskProgressOverviewData(
    completed: 2,
    total: 4,
  );
  
  @override
  void onInit() {
    super.onInit();
    desktopSideBarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      value: 1
    );
  }

  void onPressedUserProfile(UserProfileData data) {

  }

  void onSelectedMainMenu(int index, IconSelectedButtonData data) {

  }

  void onSelectedTaskMenu(int index, SimpleSelectButtonData data) {

  }

  void onPressedTaskCard(TaskCardData data) {

  }

  void onPressedTaskListAssign(int index, TaskAssignItemData data) {

  }

  void onPressedTaskListAssignMember(int index, TaskAssignItemData data) {

  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void openSideBar() {
    desktopShowMenu.value = true;
  }

  void closeSideBar() {
    desktopShowMenu.value = false;
    desktopSideBarAnimationController.forward(from: 0);
  }

  void onSerach(String text) {

  }

  void onPressedNewTask() {

  }

  void onPressedAssignTask() {

  }
}



