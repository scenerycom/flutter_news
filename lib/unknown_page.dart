import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text("未知路由页面"),
          )),
    );
  }
}
