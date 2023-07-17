import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class SearchField extends StatelessWidget {
  final String? hintText;
  final Function(String text) onSearch;
  final controller = TextEditingController();

  SearchField({ // 去掉const后这里就不用声明controller了
    Key? key,
    this.hintText,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration( // 用来设置文本框的样式
        contentPadding: EdgeInsets.zero, // 这个属性用来设置内容的内边距
        hintText: hintText ?? '搜索',
        hintStyle: TextStyle(
          
          color: Colors.blueGrey[200]!,
        ),
        prefixIcon: const Icon(EvaIcons.search),// 不指定颜色时搜索框聚焦时会使用主题色高亮它
        // 这个border参数用来设置固定的边框
        // border: OutlineInputBorder( 
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: const BorderSide(width: 0.4, color: Colors.transparent,),
        // ),
        focusedBorder: OutlineInputBorder( // 这个border用来设置聚焦时的边框, 如果使用的是UnderlineInputBorder
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
        ),
        enabledBorder:  OutlineInputBorder( // 这个border用来设置未聚焦时的边框
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 240, 241, 244), // 设置搜索框背景色
        // focusColor: Colors.blue
        
      ),
      // onChanged: onSearch,
      onSubmitted: onSearch,
      style: TextStyle(color: Colors.blueGrey[600]),
      // 文本默认对齐方式时水平左对齐, 垂直居中
      // textAlign: TextAlign.center, // 这个用来控制水平对齐方式
      // textAlignVertical: TextAlignVertical.center, // 这个用来控制垂直对齐方式
    );
  }
}