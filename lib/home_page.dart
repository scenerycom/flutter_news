import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeLogic homeLogic = Get.put(HomeLogic());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(GetPlatform.isAndroid);

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Container(
            child: Scaffold(
                appBar: AppBar(
                  title: Text("首页"),
                ),
                body: Center(
                    child: Obx(
                  () => ElevatedButton(
                      child: Text("${homeLogic.count}"),
                      onPressed: () => homeLogic.add()),
                )))));
  }
}
