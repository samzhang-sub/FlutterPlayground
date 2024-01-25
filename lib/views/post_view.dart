import 'package:flutter/material.dart';
import 'package:xhs_current/views/widgets/comment_widget.dart';

final List<String> images = [
  "https://picsum.photos/450?image=8",
  "https://picsum.photos/400/300?image=10",
  "https://picsum.photos/100/300?image=11",
  "https://picsum.photos/450?image=7",
  "https://picsum.photos/450?image=7",
  "https://picsum.photos/450?image=7",
  "https://picsum.photos/400/300?image=10",
  "https://picsum.photos/100/300?image=11",
  "https://picsum.photos/400/300?image=10",
  "https://picsum.photos/100/300?image=11",
  "https://picsum.photos/400/300?image=10",
  "https://picsum.photos/100/300?image=11",
];

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  int _currentPage = 0;
  int _leftBorder = 0;

  late BuildContext myContext;

  ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (myContext.mounted) {
          ScaffoldMessenger.of(myContext).showSnackBar(
            const SnackBar(
              content: Text('No more comments'),
              duration: Duration(milliseconds: 500),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    myContext = context;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Post'),
      // ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 500,
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.network(images[index], fit: BoxFit.contain);
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                  print(index);
                },
              ),
            ),
            _indicator(images.length),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title here',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  Text('Content here Content here'),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            NetworkImage("https://picsum.photos/450?image=7"),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20, top: 10, bottom: 10, right: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '留下你的想法',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.favorite_sharp),
                              SizedBox(width: 8),
                              Icon(Icons.emoji_emotions),
                              SizedBox(width: 8),
                              Icon(Icons.image_aspect_ratio),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  CommentWidget(
                    avatarUrl: "https://picsum.photos/100/300?image=11",
                    username: "来杯阿华田",
                    comment: "是的 三场 上海 成都 广州 还有澳门台湾",
                    time: "9小时前 吉林",
                    favoriteCount: 22,
                  ),
                  CommentWidget(
                    avatarUrl: "https://picsum.photos/100/300?image=11",
                    username: "来杯阿华田",
                    comment: "是的 三场 上海 成都 广州 还有澳门台湾",
                    time: "9小时前 吉林",
                    favoriteCount: 22,
                    isReply: true,
                  ),
                  CommentListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(int numPages) {
    int _intervalL = _leftBorder;
    int _intervalR = _leftBorder + 4;

    if (_currentPage == _intervalR && _currentPage != numPages - 1) {
      _leftBorder += 1;
    }
    if (_currentPage == _intervalL && _currentPage != 0) {
      _leftBorder -= 1;
    }

    _intervalL = _leftBorder;
    _intervalR = _leftBorder + 4;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        numPages,
        (index) {
          bool show = _intervalL <= index && index <= _intervalR;
          bool isSmall = (_intervalL == index || index == _intervalR) &&
              index != 0 &&
              index != numPages - 1;
          double radius = show ? (isSmall ? 6 : 8) : 0;

          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: radius,
            height: radius,
            margin: EdgeInsets.all(show ? 3 : 0),
            // color: Colors.red,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == _currentPage ? Colors.red : Colors.grey[400],
            ),
          );
        },
      ),
    );
  }
}
