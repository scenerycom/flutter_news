import 'package:flutter/material.dart';
import 'get_app_manager.dart';

class RunAppManager {
  /// 启动app逻辑
  static handleRunAppLogic() {
    runApp(GetAppManager.rootApp);
  }
}
