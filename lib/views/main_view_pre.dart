import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhs_current/models/main_page_model.dart';
import 'package:xhs_current/views/empty_page_pre.dart';
import 'package:xhs_current/views/mine_view.dart';
import 'package:xhs_current/views/recommend_view.dart';
import 'package:xhs_current/views/widgets/bottom_navi_bar_pre.dart';

class PageIndexController extends GetxController {
  var _pageIndex = MainPageEnum.home.obs;

  void updatePageIndex(MainPageEnum index) {
    _pageIndex.value = index;
  }

  MainPageEnum get pageIndex => _pageIndex.value;
}

class MainPageView extends StatelessWidget {
  final PageIndexController pageIndexController =
      Get.put(PageIndexController());

  @override
  Widget build(context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: pageIndexController._pageIndex.value.index,
          children: [
            RecommendPage(),
            EmptyPageView(),
            EmptyPageView(),
            MineView(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
