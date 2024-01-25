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

// small text

TextStyle smallTextStyle = const TextStyle(fontSize: 13, color: Colors.grey);

TextStyle normalTextStyle = const TextStyle(fontSize: 17, color: Colors.white);

ButtonStyle outlinedBorderStyle = OutlinedButton.styleFrom(
  side: BorderSide(
    color: Colors.white,
    width: 1,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              // pinned: true,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    // radius: .1,
                    colors: [
                      Color.fromARGB(255, 48, 65, 61),
                      Color.fromARGB(255, 67, 81, 83),
                      Color.fromARGB(255, 78, 90, 97),
                    ],
                    stops: [0, 0.3, 1],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '68离异带俩娃',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('小红书号: 12312390981', style: smallTextStyle),
                            Text('IP属地 背景', style: smallTextStyle),
                          ],
                        )
                      ],
                    ),
                    _vspL(),
                    Text('点击这里，填写简介', style: normalTextStyle),
                    _vspL(),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 112, 122, 127),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.male,
                        size: 17,
                        color: Color.fromARGB(255, 123, 179, 230),
                      ),
                    ),
                    _vspL(),
                    Row(
                      children: [
                        _relation(0, '关注'),
                        _hsp(),
                        _relation(0, '粉丝'),
                        _hsp(),
                        _relation(0, '获赞与收藏'),
                        Spacer(),
                        OutlinedButton(
                          style: outlinedBorderStyle,
                          onPressed: () {},
                          child: Text('编辑资料', style: normalTextStyle),
                        ),
                        _hsp(),
                        OutlinedButton(
                            style: outlinedBorderStyle,
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDeligate(
                TabBar(
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

  Widget _hsp() {
    // horizontal space
    return const SizedBox(width: 20);
  }

  Widget _vspS() {
    //small vertical space
    return const SizedBox(
      height: 10,
    );
  }

  Widget _vspL() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _relation(int number, String text) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: normalTextStyle,
        ),
        Text(
          text,
          style: smallTextStyle,
        ),
      ],
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
    return false;
  }
}
