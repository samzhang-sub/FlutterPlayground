import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.avatarUrl,
      required this.username,
      required this.likeCount})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String avatarUrl;
  final String username;
  final int likeCount;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final double borderRadius = 6;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        child: SizedBox(
            width: 270,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        topRight: Radius.circular(borderRadius)),
                    child: Image.asset(widget.imageUrl, fit: BoxFit.fill)),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                    NetworkImage(widget.avatarUrl)),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              widget.username,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.favorite_border,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(widget.likeCount.toString()),
                          ],
                        )
                      ]),
                ),
              ],
            )));
  }
}
