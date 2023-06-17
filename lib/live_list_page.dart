import 'package:flutter/material.dart';
import 'live_child_player_page.dart';

/// 仿照抖音

class LiveListPage extends StatefulWidget {
  const LiveListPage({Key? key}) : super(key: key);

  @override
  _LiveListPageState createState() => _LiveListPageState();
}

class _LiveListPageState extends State<LiveListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("抖音列表"),
        ),
        body: Container(
            child: PageView.builder(
                allowImplicitScrolling: true,
                scrollDirection: Axis.vertical,
                itemCount: 10,
                // onPageChanged: (int index) {
                //   print(index);
                // },
                itemBuilder: (BuildContext context, int index) {
                  return LiveChildPlayerPage(
                    currentIndex: index,
                  );
                })),
      ),
    );
  }
}
