import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class ListItem {
  const ListItem({required this.day, required this.img, required this.username});
  final String day;
  final String img;
  final String username;
  ListItem copyWith({String? day, String? img, String? username}) {
    return ListItem(
      day: day ?? this.day,
      img: img ?? this.img,
      username: username ?? this.username,
    );
  }
}

@immutable
class FamousItem {
  const FamousItem({required this.month, required this.list, required this.key});
  final int month;
  final List<ListItem> list;
  final GlobalKey key;
  FamousItem copyWith({int? month, double? position, List<ListItem>? list, GlobalKey? key}) {
    return FamousItem(
      month: month ?? this.month,
      list: list ?? this.list,
      key: key ?? this.key,
    );
  }
}

List<FamousItem> dealData() {
  List<FamousItem> famousList = [];
  for(int i=0;i<=10;i++){
    famousList.add(FamousItem(
      month: i + 1,
      list: const [
        ListItem(
          day: '1',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        ),
        ListItem(
          day: '2',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        ),
        ListItem(
          day: '3',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        ),
        ListItem(
          day: '4',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        ),
        ListItem(
          day: '5',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        ),
        ListItem(
          day: '6',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        ),
        ListItem(
          day: '7',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        ),
        ListItem(
          day: '8',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        ),
        ListItem(
          day: '9',
          img: 'https://qiniustatic.wodidashi.com/taikongsha111.png?imageView2/0/w/320',
          username: '大象姑娘'
        )
      ],
      key: GlobalKey()
    ));
  }
  return famousList;
}

final List<FamousItem> famousList = dealData();
int currentMonth = famousList[0].month;
final currentMonthProvider = StateProvider((ref) => currentMonth);

final positionsProvider = StateProvider(((ref) {
  return [];
}));

final famousProvider = StateProvider((ref) => {
  ref.read(positionsProvider.notifier).state = [],
  famousList.forEach((element) {
    ref.read(positionsProvider.notifier).state.add({
      'month': element.month,
      'position': 0.0,
    });
  })
});

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MyWidget();
  }
}


class TopBarWidget extends StatelessWidget {
  const TopBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.fromLTRB(14, top, 14, 0), 
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://qiniustatic.wodidashi.com/back_arrow.png',
              width: 24,
              height: 24,
            ),
            const Text('花神名人堂', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF)
            ),),
            Image.network(
              'https://qiniustatic.wodidashi.com/wenhao_widget.png',
              width: 24,
              height: 24,
            ),
          ]
        ),
      )
    );
  }
}

class MonthWidget  extends StatefulWidget {
  final int month;
  final dynamic monthKey;
  const MonthWidget ({Key? key, required this.month, required this.monthKey}) : super(key: key);
  @override
  State<MonthWidget> createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Transform.translate(
        offset: const Offset(-4.0, 0),
        child: Row(
          key: widget.monthKey,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
              )
            ),
            const SizedBox(width: 8),
            Text(
              widget.month.toString(),
              style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 32
              )
            ),
            const SizedBox(width: 4),
            const Text(
              '月',
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, .5),
                fontSize: 15
              )
            )
          ]
        ),
      ),
    );
  }
}

class TopThreeWidget extends StatelessWidget {
  final List topThreeList;
  const TopThreeWidget({Key? key, required this.topThreeList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PeopleItem(item: topThreeList[0], month: 1, monthIndex: 0, itemIndex: 0),
          const SizedBox(width: 9),
          Column(children: [
            PeopleItem(item: topThreeList[1], month: 1, monthIndex: 0, itemIndex: 1),
            const SizedBox(height: 9),
            PeopleItem(item: topThreeList[1], month: 1, monthIndex: 0, itemIndex: 2),
          ])
        ]
      ),
    );
  }
}

class PeopleItem extends StatelessWidget {
  final int month;
  final dynamic item;
  final int monthIndex;
  final int itemIndex;
  const PeopleItem({Key? key, required this.item, required this.month, required this.monthIndex, required this.itemIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: itemIndex == 0 ? 221 : 106,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.img),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
        ),
        Positioned(
          left: 11,
          bottom: 8,
          child: Text(
            '${item.username}',
            style: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 13,
              fontWeight: FontWeight.bold
            )
          )
        ),
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            width: 23,
            height: 43,
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://qiniustatic.wodidashi.com/right_tag.png'),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  month.toString(),
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                  )
                ),
                const SizedBox(height: 4),
                Text(
                  item.day,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                  )
                )
              ]
            ),
          )
        )
      ],
    );
  }
}

class PeopleWidget extends StatelessWidget {
  final List peopleList;
  final int month;
  final int monthIndex;
  const PeopleWidget({Key? key, required this.peopleList, required this.month, required this.monthIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 9,
      runSpacing: 9,
      children: peopleList.asMap().entries.map<Widget>((item) => PeopleItem(item: item.value, month: month, monthIndex: monthIndex, itemIndex: item.key + 3)).toList(),
    );
  }
}

class PeopleListWidget extends StatelessWidget {
  final List peopleList;
  final int month;
  final int monthIndex;
  const PeopleListWidget({Key? key, required this.peopleList, required this.month, required this.monthIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(monthIndex == 0) {
      return Column(
        children: [
          TopThreeWidget(topThreeList: peopleList.sublist(0, 3)),
          const SizedBox(height: 9),
          PeopleWidget(peopleList: peopleList.sublist(3), month: month, monthIndex: monthIndex)
        ]
      );
    } else {
      return PeopleWidget(peopleList: peopleList, month: month, monthIndex: monthIndex);
    }
  }
}


class ListViewWidget extends ConsumerStatefulWidget {
  final List famousList;
  const ListViewWidget({Key? key, required this.famousList}) : super(key: key);

  @override
  ConsumerState<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends ConsumerState<ListViewWidget> {
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      famousList.asMap().entries.forEach((element) {
        _setPosition(element.value.key, element, element.value.month);
      });
    });
  }

  _getY(key, element, month) {
    final RenderObject renderObject;
    if (key.currentContext != null) {
      renderObject = key.currentContext.findRenderObject()!;
      var vector3 = renderObject.getTransformTo(null).getTranslation();
      double top = vector3.y;
      if (top < 0) {
        ref.read(currentMonthProvider.state).state = month;
      }else if(top == 80) {
        ref.read(currentMonthProvider.state).state = famousList[0].month;
      }
      return top;
    }
    return 0;
  }

  _setPosition(key, element, month) {
    ref.read(positionsProvider.state).state = [
      ...ref.read(positionsProvider.state).state,
      {
        'position': _getY(key, element, month),
        'month': month
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child:  ListView.builder(
        controller: _controller,
        clipBehavior: Clip.none,
        itemCount: famousList.length,
        itemBuilder: (BuildContext context, int $index) {
          return Column(
            children: [
              $index != 0 ? MonthWidget(month: widget.famousList[$index].month, monthKey: widget.famousList[$index].key) : const Text(''),
              PeopleListWidget(peopleList: widget.famousList[$index].list, month: widget.famousList[$index].month, monthIndex: $index),
            ]
          );
        },
      ) 
    );
  }
}

class FirstTimeLine extends StatelessWidget {
  final int month;
  final dynamic monthKey;
  final int monthIndex;
  const FirstTimeLine({Key? key, required this.month, required this.monthKey, required this.monthIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        monthIndex == 0 ? Positioned(
          left: 8,
          top: -4,
          child: MonthWidget(month: month, monthKey: monthKey)
        ) : Positioned(
          top: -4,
          child: MonthWidget(month: month, monthKey: monthKey)
        )
      ],
    );
  }
}

class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  Widget build(BuildContext context) {
    int currentMonth = ref.watch(currentMonthProvider);
    ref.watch(famousProvider);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFFEA8CFF),
            Color(0xFF876FFF),
          ],
        ),
      ),
      child: Column(children: [
        const TopBarWidget(),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 360,
                height: double.infinity,
                child: ListViewWidget(famousList: famousList)
              ),
              Positioned(
                top: 12,
                left: 8,
                child: Container(
                  width: 1,
                  height: 1300,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF)
                  ),
                ),
              ),
              Positioned(
                child: FirstTimeLine(month: currentMonth, monthKey: famousList[0].key, monthIndex: 0)
              )
            ],
          )
        )
      ]),
    );
  }
}