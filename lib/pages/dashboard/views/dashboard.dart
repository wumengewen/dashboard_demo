library dashboard;

import 'package:dashboard_demo/pages/dashboard/views/components/draft01.dart';
import 'package:dashboard_demo/shared/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:dashboard_demo/shared/reponsive_builder.dart';
import 'package:dashboard_demo/shared/icon_selected_buttons.dart';
import 'package:dashboard_demo/shared/simple_selected_buttons.dart';
import 'package:dashboard_demo/shared/task_card.dart';
import 'package:dashboard_demo/shared/task_process_in_overview.dart';
import 'package:dashboard_demo/shared/task_assign_item.dart';
import 'package:dashboard_demo/shared/user_profile.dart';
import 'package:multi_split_view/multi_split_view.dart';


part '../../../conf/routes/app_pages.dart';
part '../../../conf/routes/app_routes.dart';
part '../controllers/controller.dart';
part '../bindings/dashboard_binding.dart';
part 'components/main_menu.dart';
part 'components/task_menu.dart';
part 'components/task_in_progress.dart';
part 'components/task_assign_list.dart';
part 'components/member_group.dart';
part 'components/header_weekly_task.dart';


// 响应式多端适配布局
class DashBoard extends GetView<DashBoardController> {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: controller.scaffoldKey, // 这里要传入controller创建的Scaffold的globalKey, 不然不能通过controller控制scaffold的功能(如: openDrawer)
      drawer: ResponsiveBuilder.isDesktop(context) 
        ? null 
        : Drawer(
          child: SafeArea(
            child: _buildSideBar(),
          )
        ),
      body: SafeArea(
        // child: ResponsiveBuilder(
        //   mobileBuilder: (context, constraints) {
        //     return ElevatedButton(
        //       // onPressed: () {
        //       //   Scaffold.of(context).openDrawer();
        //       // },
        //       onPressed: () => controller.openDrawer(),
        //       child: const Text('open drawer'),
        //     ).center();
        //   },
        //   tabletBuilder: (context, constraints) {
        //     return ElevatedButton(
        //       // onPressed: () {
        //       //   Scaffold.of(context).openDrawer();
        //       // },
        //       onPressed: () => controller.openDrawer(),
        //       child: const Text('open drawer'),
        //     ).center();
        //   },
        //   desktopBuilder: (context, constraints) {
        //     // return Obx(() => 
        //     //   Row(
        //     //     crossAxisAlignment: CrossAxisAlignment.start,
        //     //     children: [
        //     //       AnimatedSwitcher(
        //     //         duration: const Duration(milliseconds: 200),
        //     //         switchInCurve: Curves.linear,
        //     //         switchOutCurve: Curves.linear,
        //     //         transitionBuilder: (child, animation) => SlideTransition(
        //     //           position: Tween<Offset>(
        //     //             begin: const Offset(-1, 0),
        //     //             end: const Offset(0, 0),
        //     //           ).animate(animation),
        //     //           child: child,
        //     //         ),
        //     //         child: controller.desktopShowMenu.value
        //     //           ? _buildSideBar()
        //     //               .constrained(width: 300)
        //     //           : const SizedBox(width: 0,),
        //     //       ),

        //     //       AnimatedContainer(
        //     //         duration: const Duration(milliseconds: 200),
        //     //         curve: Curves.linear,
        //     //         width: controller.desktopShowMenu.value ? constraints.maxWidth - 300 : constraints.maxWidth,
        //     //         child: _buildMainContent()
        //     //       )
                  
        //     //     ],
        //     //   )
        //     // );
        //     // return MultiSplitView(
        //     //   children: [
        //     //     _buildSideBar(),
        //     //     _buildMainContent(),
        //     //   ],
        //     // );
            
        //   },
        // ),
        child:  Obx(() => Row(
          children: [
            _buildSideBar()
              .constrained(width: controller.desktopShowMenu.value ? 300 : 0, animate: true)
              .animate(
                const Duration(milliseconds: 200),
                Curves.linear,
              ),
            _buildMainContent(context)
              .constrained(maxWidth: controller.desktopShowMenu.value ? maxWidth - 300: maxWidth, animate: true)
              // .scrollable(scrollDirection: Axis.horizontal)
              .animate(
                const Duration(milliseconds: 300), // *两边动画速率不一样也会导致慢的那一边overflow, 这时可考虑也将_buildMainContent()包一层水平的scrollable
                Curves.linear,
              ),
          ],
        )),
      ),
    );
  }

  Widget _buildSideBar() {
    return Column(
      children: [
        UserProfile(
          data: controller.userProfileData,
          onPressed: controller.onPressedUserProfile,
        ).padding(vertical: 10),
        const SizedBox(height: 20),
        _MainMenu(
          data: controller.mainMenuData,
          onSelected: controller.onSelectedMainMenu,
        ),
        Divider(
          indent: 5,  // 左边距
          thickness: 1,
          endIndent: 5, // 右边距
          height: 60,
          color: Colors.grey[200]!,
        ),
        _MemberGroup(
          data: controller.memberGroupData,
          onPressed: controller.onPressedUserProfile,
        ),
        Divider(
          indent: 5, // 左边距
          thickness: 1,
          endIndent: 5, // 右边距
          height: 50,
          color: Colors.grey[200]!,
        ),
        _TaskMenu(
          data: controller.taskMenuData,
          onSelected: controller.onSelectedTaskMenu,
        )
      ],
    )
    .padding(horizontal: 12)
    .constrained(maxWidth: 300) // !这里必须设置宽度, 否则在应用水平scrollable时会报RenderFlex children have non-zero flex but incoming width constraints are unbounded的错误
    .scrollable()
    .scrollable(scrollDirection: Axis.horizontal)
    ;
  }

  Widget _buildMainContent(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          children: [
            Obx(() => AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.linear,
              switchOutCurve: Curves.linear,
              transitionBuilder: (child, animation) => FadeTransition(
                  opacity: controller.desktopSideBarAnimationController,
                  child: child,
              ),
              child: controller.desktopShowMenu.value
              ? IconButton(
                icon: Icon(EvaIcons.menu2, color: Colors.grey[700],),
                iconSize: 30,
                splashRadius: 20, // 控制按钮ripple的大小
                onPressed: () => controller.closeSideBar(),
              )
              : IconButton(
                icon: Icon(EvaIcons.menu, color: Colors.grey[700],),
                iconSize: 30,
                splashRadius: 20, // 控制按钮ripple的大小
                onPressed: () => controller.openSideBar(),
              )
            )
            ),
            SearchField(
              hintText: '搜索任务',
              onSearch: controller.onSerach,
            ).padding(all: 20)
            .constrained(height: 80)
            .expanded(),
            IconButton(
              icon: Icon(EvaIcons.calendarOutline, color: Colors.blueGrey[700]),
              iconSize: 30,
              splashRadius: 20, // 控制按钮ripple的大小
              onPressed: () => {},
            )
          ],
        ).padding(horizontal: 20),
        TaskProgressOverview(
          data: controller.taskProgressOverviewData,
        ).padding(horizontal: 20),
        _TaskInProgress(
          data: controller.taskCardsData,
          onPressedTaskCard: controller.onPressedTaskCard,
        ),
        _HeaderWeeklyTask(
          onPressedNewTask: controller.onPressedNewTask,
          onPressedAssignTask: controller.onPressedAssignTask,
        ).padding(horizontal: 20, vertical: 10),
        _TaskAssignItemList(
          data: controller.taskAssignItemListData,
          onPressed: controller.onPressedTaskListAssign,
          onPressAssignTo: controller.onPressedTaskListAssignMember,
        ).padding(horizontal: 20, vertical: 10),
      ],
    )
    // .constrained(maxWidth: maxWidth)
    .scrollable()
    // .scrollable(scrollDirection: Axis.horizontal)
    ;
  }
}


