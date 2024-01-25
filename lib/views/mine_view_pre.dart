import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:xhs_current/views/widgets/card_widget.dart';

final List<String> imageUrls = [
  // "https://picsum.photos/250/400?image=7",
  // "https://picsum.photos/250/200?image=7",
  // "https://picsum.photos/250/300?image=7",
  "assets/images/IMG_0114.JPG",
  "assets/images/test_image.png"
];

TextStyle tinyTextStyle = const TextStyle(
  fontSize: 13,
  color: Colors.white,
  fontWeight: FontWeight.w100,
);

// normal text
double normalTextFontSize = 16;

TextStyle normalTextStyleW = TextStyle(
  fontSize: normalTextFontSize,
  color: Colors.white,
);

TextStyle normalTextStyleB = TextStyle(
  fontSize: normalTextFontSize,
  color: Colors.black,
);

// larger text
double largerTextFontSize = 18;

TextStyle largerTextStyleW = TextStyle(
  fontSize: largerTextFontSize,
  color: Colors.white,
);

TextStyle largerTextStyleB = TextStyle(
  fontSize: largerTextFontSize,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

// outline border style
ButtonStyle outlineBorderStyle = OutlinedButton.styleFrom(
  side: BorderSide(
    color: Colors.white,
    width: 1,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
);

ButtonStyle outlineBorderStyle2 = OutlinedButton.styleFrom(
  side: BorderSide(
    color: Colors.white,
    width: 1,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  padding: const EdgeInsets.all(0),
);

class MineView extends StatefulWidget {
  MineView({Key? key}) : super(key: key);

  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: AppBar(
        // title: Text('Mine'),
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              // pinned: false,
              // floating: false,
              // pinned: true,
              // expandedHeight: 400.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 48, 65, 61),
                      Color.fromARGB(255, 73, 85, 92),
                      // Colors.white,
                      Color.fromARGB(255, 91, 104, 112),
                      Color.fromARGB(255, 91, 104, 112),
                      // Colors.white,
                    ],
                    stops: [0.0, 0.2, .5, 1.0],
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    "https://picsum.photos/450?image=7"),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(3),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'xiaohsongshu 6552C',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '小红书号:  12312390981',
                                style: tinyTextStyle,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'IP属地:  山东',
                                style: tinyTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '点击这里，填写简介',
                        style: normalTextStyleW,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          top: 2,
                          bottom: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 112, 122, 127),
                        ),
                        // color: Colors.grey,
                        child: Icon(
                          Icons.male,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          _relation(0, '关注'),
                          _relation(0, '粉丝'),
                          _relation(1, '获赞与收藏'),
                          Spacer(),
                          OutlinedButton(
                            style: outlineBorderStyle,
                            onPressed: () {},
                            child: Text(
                              '编辑资料',
                              style: normalTextStyleW,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          TextButton(
                            style: outlineBorderStyle2,
                            onPressed: () {},
                            child: const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDeligate(
                TabBar(
                  labelStyle: largerTextStyleB,
                  indicatorColor: Colors.red,
                  tabs: [
                    Tab(text: '笔记'),
                    Tab(text: '收藏'),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  MasonryGridView.count(
                      itemCount: 20,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) {
                        return CardWidget(
                            imageUrl: imageUrls[index % 2],
                            title: "别再花钱装系统了 自己就可以 很简单a",
                            avatarUrl: "https://picsum.photos/250?image=9",
                            username: "小红书",
                            likeCount: 100);
                      }),
                  Container(
                    child: Center(
                      child: Text('收藏'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _relation(int number, String text) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Text(
            number.toString(),
            style: normalTextStyleW,
          ),
          Text(
            text,
            style: tinyTextStyle,
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDeligate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDeligate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDeligate oldDelegate) {
    return true;
  }
}
