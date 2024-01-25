import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xhs_current/views/empty_page_pre.dart';
import 'package:xhs_current/views/mine_view.dart';
import 'package:xhs_current/views/recommend_view.dart';

enum MainPageEnum {
  main,
  shopping,
  message,
  mine,
}

class PageIndexController extends GetxController {
  var _pageIndex = MainPageEnum.main.obs;

  void updatePageIndex(MainPageEnum index) {
    _pageIndex.value = index;
  }

  MainPageEnum get pageIndex => _pageIndex.value;
}

class MainPageView extends StatelessWidget {
  @override
  Widget build(context) {
    final PageIndexController pageIndexController =
        Get.put(PageIndexController());

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: pageIndexController.pageIndex.index,
          children: [
            RecommendPage(),
            EmptyPageView(),
            EmptyPageView(),
            MineView(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _tabItem(MainPageEnum.main, '首页', pageIndexController),
            _tabItem(MainPageEnum.shopping, '购物', pageIndexController),
            // Icon(Icons.add, color: Colors.red),
            Image.asset('assets/images/add_icon.png', width: 30, height: 30),
            _tabItem(MainPageEnum.message, '消息', pageIndexController),
            _tabItem(MainPageEnum.mine, '我的', pageIndexController),
          ],
        ),
      ),
    );
  }

  Widget _tabItem(MainPageEnum index, String text,
      PageIndexController pageIndexController) {
    return TextButton(
      child: Obx(
        () {
          final RxBool isSelected =
              (index == pageIndexController.pageIndex).obs;

          return Text(
            text,
            style: TextStyle(
                color: isSelected.value ? Colors.black : Colors.grey,
                fontSize: isSelected.value ? 17 : 16,
                fontWeight:
                    isSelected.value ? FontWeight.bold : FontWeight.normal),
          );
        },
      ),
      onPressed: () {
        pageIndexController.updatePageIndex(index);
      },
    );
  }
}




// class MainPageView extends StatefulWidget {
//   MainPageView({Key? key}) : super(key: key);

//   @override
//   _MainPageViewState createState() => _MainPageViewState();
// }

// class _MainPageViewState extends State<MainPageView> {
//   late int pageIndex;

//   @override
//   void initState() {
//     pageIndex = 0;
//     super.initState();
//   }

//   @override
//   Widget build(context) {
//     return Scaffold(
//       body: const Center(child: Text('Not implemented yet')),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         onTap: (value) {
//           setState(() {
//             print("$pageIndex, $value");
//             pageIndex = value;
//           });
//         },
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle:
//             TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//         unselectedLabelStyle: TextStyle(
//           fontWeight: FontWeight.normal,
//           fontSize: 14,
//         ),
//         items: [
//           BottomNavigationBarItem(
//             icon: SizedBox(),
//             label: '首页',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: '购物',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: '发布',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: '消息',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: '我的',
//           ),
//         ],
//       ),
//     );
//   }
// }


