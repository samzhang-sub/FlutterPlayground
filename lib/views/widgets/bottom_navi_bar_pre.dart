import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhs_current/models/main_page_model.dart';
import 'package:xhs_current/views/main_view_pre.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageIndexController pageIndexController =
        Get.find<PageIndexController>();

    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _tabItem(MainPageEnum.home, '首页', pageIndexController),
          _tabItem(MainPageEnum.shopping, '购物', pageIndexController),
          Icon(Icons.add),
          _tabItem(MainPageEnum.message, '消息', pageIndexController),
          _tabItem(MainPageEnum.mine, '我的', pageIndexController),
        ],
      ),
    );
  }

  Widget _tabItem(
      MainPageEnum index, String text, PageIndexController controller) {
    return TextButton(
      onPressed: () {
        controller.updatePageIndex(index);
      },
      child: Obx(
        () {
          final isSelected = controller.pageIndex == index;
          return Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: isSelected ? 15 : 14,
            ),
          );
        },
      ),
    );
  }
}
