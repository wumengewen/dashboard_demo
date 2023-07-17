import 'package:dashboard_demo/pages/dashboard/views/dashboard.dart';
import 'package:dashboard_demo/draft01.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // 刚才使用GetMaterialApp时报Duplicated global key, 是因为Deme01里也套了个GetMaterialApp
      initialRoute: Pages.initialPage,
      getPages: Pages.routes,
      debugShowCheckedModeBanner: false, // 去掉App窗口右上角的DEBUG标签
    );
  }
}
