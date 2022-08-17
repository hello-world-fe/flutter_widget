import 'package:flutter/material.dart';

final rankList = [{
    'userInfo': [
      {
        'imageUrl': 'https://qiniustatic.wodidashi.com/picture/KKgFqrYQeu8dE?imageView/2/w/200/h/200',
        'name': '六个',
        'sex': 'woman',
      },
      {
        'name': '六个字昵称啊哈哈',
        'sex': 'woman',
        'imageUrl': 'https://qiniustatic.wodidashi.com/picture/KKgFqrYQeu8dE?imageView/2/w/200/h/200'
      },
    ],
    'score': 500,
    'bg': 'https://qiniustatic.wodidashi.com/top_1_bg.png',
    'rankUrl': 'https://qiniustatic.wodidashi.com/top_1_bottom.png'
  },
  {
    'userInfo': [
      {
        'name': '六个字昵称啊哈哈',
        'sex': 'woman',
        'imageUrl': 'https://qiniustatic.wodidashi.com/picture/KKgFqrYQeu8dE?imageView/2/w/200/h/200'
      },
      {
        'name': '六个字昵称啊哈哈',
        'sex': 'woman',
        'imageUrl': 'https://qiniustatic.wodidashi.com/picture/KKgFqrYQeu8dE?imageView/2/w/200/h/200'
      },
    ],
    'score': 50,
    'bg': 'https://qiniustatic.wodidashi.com/top_2_bg.png',
    'rankUrl': 'https://qiniustatic.wodidashi.com/top_2_bottom.png'
  },
  {
    'userInfo': [
      {
        'name': '六个字昵称啊哈哈',
        'sex': 'woman',
        'imageUrl': 'https://qiniustatic.wodidashi.com/picture/KKgFqrYQeu8dE?imageView/2/w/200/h/200'
      },
      {
        'name': '六个字昵称啊哈哈',
        'sex': 'woman',
        'imageUrl': 'https://qiniustatic.wodidashi.com/picture/KKgFqrYQeu8dE?imageView/2/w/200/h/200'
      },
    ],
    'score': 30,
    'bg': 'https://qiniustatic.wodidashi.com/top_3_bg.png',
    'rankUrl': 'https://qiniustatic.wodidashi.com/top_3_bottom.png'
  }
];

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

class Avatar extends StatelessWidget {
  final String url;
  final double frameUrlWidth;
  final String frameUrl;
  const Avatar({Key? key, required this.url, required this.frameUrl, required this.frameUrlWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: SizedBox(
            width: frameUrlWidth,
            height: frameUrlWidth,
            child: AspectRatio(
              aspectRatio: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(frameUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        )
      ],
    );
  }
}

class RankItem extends StatelessWidget {
  final dynamic rankItemObj;
  final double avatarBgWidth;
  final double avatarBgHeight;
  final double avatarWidth;
  final double rankWidth;
  final double rankHeight;
  final double avatarTop;
  final double avatarLeft;
  final String frameUrl;
  const RankItem({Key? key, required this.rankItemObj, required this.avatarBgWidth, required this.avatarBgHeight, required this.avatarWidth, required this.rankWidth, required this.rankHeight, required this.avatarTop, required this.avatarLeft, required this.frameUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
            children: [
              Container(
                width: avatarBgWidth,
                height: avatarBgHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(rankItemObj['bg']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: avatarLeft,
                      top: avatarTop,
                      child: SizedBox(
                        width: avatarWidth,
                        height: avatarWidth,
                        child: Avatar(url: rankItemObj['userInfo'][0]['imageUrl'], frameUrl: frameUrl, frameUrlWidth: avatarWidth),
                      )
                    ),
                    Positioned(
                      right: avatarLeft,
                      top: avatarTop,
                      child: SizedBox(
                        width: avatarWidth,
                        height: avatarWidth,
                        child: Avatar(url: rankItemObj['userInfo'][1]['imageUrl'], frameUrl: frameUrl, frameUrlWidth: avatarWidth),
                      )
                    ),
                    Positioned(
                      bottom: -7.5,
                      child: Container(
                        width: rankWidth,
                        height: rankHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(rankItemObj['rankUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 70,
                        child: Text(
                          rankItemObj['userInfo'][0]['name'],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0XFFFFFFFF),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.network('https://qiniustatic.wodidashi.com/sex_flutter.png', width: 13, height: 13),
                      const SizedBox(width: 5),
                      Image.network('https://qiniustatic.wodidashi.com/rank_level.png', width: 18, height: 13),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text(
                          rankItemObj['userInfo'][1]['name'], 
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0XFFFFFFFF),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.network('https://qiniustatic.wodidashi.com/sex_flutter.png', width: 13, height: 13),
                      const SizedBox(width: 5),
                      Image.network('https://qiniustatic.wodidashi.com/rank_level.png', width: 18, height: 13),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text('亲密值${rankItemObj['score']}钻', style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    fontSize: 12
                  ))
                ],
              ),
        ],
      );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 344,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.5, 1],
          colors: [
            Color(0XFFFFA0C1),
            Color(0xFFF17483),
            Color(0xFFF17482)
          ],
        ),
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     SizedBox(
      //       // width: 400,
      //       child: ,
      //     )
      //   ],
      // )
      child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 340,
                    height: 213,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/rank_double_bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ),
                Positioned(
                  bottom: 100,
                  child: SizedBox(
                    width: 138,
                    child: RankItem(rankItemObj: rankList[0], avatarBgWidth: 138, avatarBgHeight: 80, avatarWidth: 56, rankWidth: 52.5, rankHeight: 32.5, avatarLeft: 7, avatarTop: 16, frameUrl: 'https://qiniustatic.wodidashi.com/avatar2.0/makeup/0/105/mianmian_nv.png'),
                  )
                ),
                Positioned(
                  left: 13,
                  bottom: 30,
                  child: SizedBox(
                    width: 138,
                    child: RankItem(rankItemObj: rankList[1], avatarBgWidth: 101.5, avatarBgHeight: 59, avatarWidth: 41, rankWidth: 42.5, rankHeight: 28, avatarLeft: 6, avatarTop: 12, frameUrl: 'https://qiniustatic.wodidashi.com/avatar2.0/makeup/0/105/mianmian_nv.png'),
                  )
                ),
                Positioned(
                  right: 13,
                  bottom: 30,
                  child: SizedBox(
                    width: 138,
                    child: RankItem(rankItemObj: rankList[2], avatarBgWidth: 101.5, avatarBgHeight: 59, avatarWidth: 41, rankWidth: 42.5, rankHeight: 28, avatarLeft: 6, avatarTop: 12, frameUrl: 'https://qiniustatic.wodidashi.com/avatar2.0/makeup/0/105/mianmian_nv.png'),
                  )
                )
              ],
            ),
    );
  }
}