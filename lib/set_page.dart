import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'set_get_controller.dart';

class SetPage extends GetView<SetGetController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SetGetController>(() => SetGetController());

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("设置页面"),
        ),
        body: Container(
          child: GetBuilder<SetGetController>(builder: (_) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  String title = controller.data[index]["title"];
                  return ListTile(
                      title: Text(title),
                      trailing: Icon(Icons.chevron_right),
                      selectedColor: Colors.red,
                      onTap: () {
                        controller.handleJumpPageLogic(title);
                      });
                });
          }),
        ));
  }
}
