import "package:sample_flutter_app/models/route_data/main.dart";

import "package:sample_flutter_app/screens/home.dart";
import "package:sample_flutter_app/screens/images.dart";
import "package:sample_flutter_app/screens/single_image.dart";
import "package:sample_flutter_app/screens/settings.dart";

class RoutesWrapper {
  static final Map<String, RouteDataModel> all = {
    HomeScreen.route.key: HomeScreen.route,
    ImagesScreen.route.key: ImagesScreen.route,
    SingleImageScreen.route.key: SingleImageScreen.route,
    SettingsScreen.route.key: SettingsScreen.route,
  };
}
