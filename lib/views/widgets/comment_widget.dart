import 'dart:math';

import 'package:flutter/material.dart';

class Comment {
  Comment({
    required this.avatarUrl,
    required this.username,
    required this.comment,
    required this.time,
    required this.favoriteCount,
    this.isReply = false,
    this.replies = const [],
  });

  final String avatarUrl;
  final String username;
  final String comment;
  final String time;
  final int favoriteCount;
  final bool isReply;

  List<Comment> replies = [];
}

Comment comment = Comment(
  avatarUrl: "https://picsum.photos/100/300?image=11",
  username: "来杯阿华田",
  comment: "是的 三场 上海 成都 广州 还有澳门台湾",
  time: "9小时前 吉林",
  favoriteCount: 22,
  isReply: true,
  replies: List<Comment>.generate(
    20,
    (index) => Comment(
      avatarUrl: "https://picsum.photos/100/300?image=11",
      username: "来杯阿华田",
      comment: "reply $index 是的 三场 上海 成都 广州 还有澳门台湾",
      time: "9小时前 吉林",
      favoriteCount: 22,
      isReply: true,
    ),
  ),
);

class CommentWidget extends StatelessWidget {
  CommentWidget({
    Key? key,
    required this.avatarUrl,
    required this.username,
    required this.comment,
    required this.time,
    required this.favoriteCount,
    this.isReply = false,
  }) : super(key: key);

  final String avatarUrl;
  final String username;
  final String comment;
  final String time;
  final int favoriteCount;
  final bool isReply;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: isReply ? 42 : 0),
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        SizedBox(
          width: 12,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              Text(
                comment,
              ),
              // RichText(text: TextSpan(children: [

              // ]))
              RichText(
                text: TextSpan(
                  // text: 'Timestamp + ip here 回复',
                  children: [
                    TextSpan(
                      text: time,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    TextSpan(
                      text: '  回复',
                      style: TextStyle(
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Icon(Icons.favorite_border),
            Text(favoriteCount.toString()),
          ],
        )
      ],
    );
  }
}

class CommentListWidget extends StatefulWidget {
  CommentListWidget({Key? key}) : super(key: key);

  @override
  _CommentListWidgetState createState() => _CommentListWidgetState();
}

class _CommentListWidgetState extends State<CommentListWidget> {
  int toShow = 3;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: toShow,
      itemBuilder: (context, index) {
        if (index == 0) {
          return CommentWidget(
            avatarUrl: comment.avatarUrl,
            username: comment.username,
            comment: comment.comment,
            time: comment.time,
            favoriteCount: comment.favoriteCount,
          );
        } else if (index == toShow - 1 && toShow < comment.replies.length + 1) {
          return Container(
            padding: EdgeInsets.only(left: 82),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  toShow = min(toShow + 3, comment.replies.length + 1);
                });
              },
              child: Text("查看更多评论", style: TextStyle(color: Colors.indigo)),
            ),
          );
        }
        return CommentWidget(
          avatarUrl: comment.replies[index - 1].avatarUrl,
          username: comment.replies[index - 1].username,
          comment: comment.replies[index - 1].comment,
          time: comment.replies[index - 1].time,
          favoriteCount: comment.replies[index - 1].favoriteCount,
          isReply: true,
        );
        // return CommentWidget(
        //   avatarUrl: "https://picsum.photos/100/300?image=11",
        //   username: "来杯阿华田",
        //   comment: "是的 三场 上海 成都 广州 澳门台湾",
        //   time: "9小时前 吉林",
        //   favoriteCount: 22,
        //   isReply: true,
        // );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
    );
  }
}
// bottom indicator, always show 10 messages, 