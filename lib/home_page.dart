import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeLogic homeLogic = Get.put(HomeLogic());
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(GetPlatform.isAndroid);

    FlutterNativeSplash.remove();
  }

  final colors = const [
    Colors.red,
    Colors.green,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.blue,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        6,
        (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Container(
                height: 280,
                child: Center(
                    child: Text(
                  "Page $index",
                  style: TextStyle(color: Colors.indigo),
                )),
              ),
            ));
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text("首页"),
            ),
            body: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                SizedBox(height: 16),
                SizedBox(
                  height: 240,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return pages[index % pages.length];
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 12),
                  child: Text(
                    'Worm',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: const WormEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thinUnderground,
                  ),
                  onDotClicked: (index) {
                    print("点击${index}");
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Obx(
                  () => ElevatedButton(
                      child: Text("${homeLogic.count}"),
                      onPressed: () => homeLogic.add()),
                )),
                Center(
                    child: Obx(
                  () => ElevatedButton(
                      child: Text("${homeLogic.count}"),
                      onPressed: () => homeLogic.handleLivePageLogic()),
                )),
                Center(
                    child: Obx(
                  () => ElevatedButton(
                      child: Text("${homeLogic.count}"),
                      onPressed: () => homeLogic.handleVideoDetailPageLogic()),
                ))
              ],
            )))));
  }
}
