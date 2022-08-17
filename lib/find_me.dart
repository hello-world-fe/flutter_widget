import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Widget'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String str;
  const TagWidget({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFE1DD),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(9, 1, 9, 1),
      child: Text(str, style: const TextStyle(
        fontSize: 10
      )),
    );
  }
}

class RoomInfoWidget extends StatelessWidget {
  final String str;
  final int color;
  const RoomInfoWidget({Key? key, required this.str, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      str,
      style: TextStyle(
        fontSize: 10,
        color: Color(color),
      )
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.fromLTRB(12, 14, 12, 14),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.network('https://qiniustatic.wodidashi.com/picture/KKgFqrYQeu8dE?imageView/2/w/200/h/200', width: 60, height: 60),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Flexible(
                        child: Text('穷哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈休息休息嘻嘻嘻哈哈哈哈哈哈哈哈哈哈哈哈哈哈吼吼吼', 
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xD9000000),
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ),
                    const SizedBox(width: 6),
                    Image.network('https://qiniustatic.wodidashi.com/sex_flutter.png', width: 16, height: 16),
                    const SizedBox(width: 6),
                    Image.network('https://qiniustatic.wodidashi.com/huizhang_flutter.png', width: 16, height: 16),
                  ],
                ),
                SizedBox(
                  height: 15,
                  child: Wrap(
                      clipBehavior: Clip.hardEdge,
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      spacing: 4,
                      children: const  [
                        TagWidget(str: 'CP'),
                        TagWidget(str: '家族好友'),
                        TagWidget(str: '附近的人 100米以内'),
                        TagWidget(str: '家族好友'),
                        TagWidget(str: '附近的人 100米以内'),
                        TagWidget(str: '家族好友家族好友'),
                        TagWidget(str: 'CP'),
                        TagWidget(str: '家族好友'),
                        TagWidget(str: '附近的人 100米以内'),
                        TagWidget(str: '家族好友'),
                        TagWidget(str: '附近的人 100米以内'),
                        TagWidget(str: '家族好友家族好友'),
                      ],
                  )),
                
                Row(
                    children: const [
                      RoomInfoWidget(str: '你画我猜-游戏场次', color: 0xFF21DB9E),
                      SizedBox(width: 8),
                      RoomInfoWidget(str: '5684258房', color: 0x73000000),
                      SizedBox(width: 8),
                      RoomInfoWidget(str: '5684258房', color: 0x73000000),
                    ],
                )           
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network('https://qiniustatic.wodidashi.com/right_flutter.png', width: 16, height: 16),
          )
        ],
      ),
    );
  }
}