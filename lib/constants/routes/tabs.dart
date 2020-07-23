import "package:sample_flutter_app/constants/routes/wrapper.dart";

import 'package:sample_flutter_app/models/RouteData/main.dart';

class TabsRoutes {
  static Map<String, RouteDataModel> getTabs() {
    Map<String, RouteDataModel> tabs = {};

    RoutesWrapper.all.forEach((key, value) {
      var currentTab = RoutesWrapper.all[key];

      if (!currentTab.showInTab) {
        return;
      }

      tabs[key] = currentTab;
    });

    return tabs;
  }
}
