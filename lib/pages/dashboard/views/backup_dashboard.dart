// // 测试组件用
// class DashBoard extends GetView<DashBoardController> {
//   const DashBoard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     DashBoardController controller = Get.put(DashBoardController());

//     return Scaffold(
//       body: Column(
//         children: [
//           _MainMenu(
//             data: controller.selectedButtonData,
//             onSelected: controller.onSelectedMainMenu,
//           ),
//           const SizedBox(height: 30,),
//           _TaskMenu(
//             data: controller.selectTaskButtonData,
//             onSelected: controller.onSelectedTaskMenu,
//           ),
//           const SizedBox(height: 30,),

//           _TaskProgress(
//             data: controller.taskProgressData,
//           ),

//           const SizedBox(height: 30),
          
//           ListView.builder( // ?这里使用ListView可以更好控制这些卡片列表且不会像使用ScrollView那样多出一个滚动条影响视觉, 如果使用Row, 会有一些问题, 比如卡片列表超出屏幕overflow、无法滚动等
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(), //physic这个用来设置滚动的效果, 这里使用BouncingScrollPhysics, 会有回弹效果
//             // shrinkWrap: true, // 这里使用shrinkWrap, 会让ListView的高度自适应
//             padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
//             itemCount: controller.taskCardData.length,
//             itemBuilder: (context, index) {
//               final data = controller.taskCardData[index];
//               return _TaskCard(
//                 data: data,
//                 onPressed: controller.onPressedTaskCard,
//               ).padding(horizontal: 10);
//             },
//           ).constrained(height: 220), // !刚才这里报constraint.hasBoundHeight is not true 是因为使用横向的ListView.builder需要限制List的高度, 纵向的需要限制宽度, 这里设置好constrained(height就好了
          
//           // const Spacer(), 使用这个会报 RenderFlex children have non-zero flex but incoming height constraints are unbounded.
//           const SizedBox(height: 30),
//           _TaskListAssignColumn(
//             data: controller.taskListAssignData,
//             onPressed: controller.onPressedTaskListAssign,
//             onPressAssignTo: controller.onPressedTaskListAssignMember,
//           )
//         ],  
//       ).scrollable()
//       .center()
//     );
//   }
// }