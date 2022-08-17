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
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('Flutter Widget'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 80,
      color: Colors.pink,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius:BorderRadius.circular(4.0),
              child: Image.network(
                'https://qiniustatic.wodidashi.com/taikongsha111.png',
                width: 44.0,
                height: 44.0,
                fit: BoxFit.cover
              )
            )
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      child: const Text(
                        'h5-小饭团-一日三餐', 
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1
                      ),
                    ),
                    Container(
                      child: Text('2022/07/15'),
                    )
                  ],
                ),
                Container(
                  child: Text('玩吧-少飞（06-19）:不能吧'),
                )
              ],
            )
          ) 
        ]
      )
    );
  }
}
