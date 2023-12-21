import 'package:flutter/material.dart';
import 'package:xhs_current/views/widgets/card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class RecommendPage extends StatelessWidget {
//   const RecommendPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GridView.count(
//             crossAxisCount: 2,
//             children: List.generate(100, (index) {
//               return Center(child: Text('Item $index'));
//             })));
//   }
// }

final List<String> imageUrls = [
  "https://picsum.photos/250/400?image=7",
  "https://picsum.photos/250/200?image=7",
  "https://picsum.photos/250/300?image=7",
];

class RecommendPage extends StatelessWidget {
  const RecommendPage({Key? key}) : super(key: key);

  final double borderRadius = 6;

  int getColumns(double width) {
    // 550 / 270 = 2.x -> 3 275
    return (width / 270).ceil();
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    int columns = getColumns(pageWidth);

    return Scaffold(
        body: MasonryGridView.count(
            itemCount: 20,
            crossAxisCount: columns,
            itemBuilder: (context, index) {
              return CardWidget(
                  imageUrl: imageUrls[index % 3],
                  title: "别再花钱装系统了 自己就可以 很简单",
                  avatarUrl: "https://picsum.photos/250?image=9",
                  username: "小红书",
                  likeCount: 100);
            }));
  }
}

Widget generateCard() {
  return const Text('hello');
}
