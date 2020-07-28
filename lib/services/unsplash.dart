import "dart:async";
import "dart:convert";

import 'package:http/http.dart' as http;

import "package:sample_flutter_app/models/image_data/main.dart";

class UnsplashApi {
  static final String _baseUrl = "https://api.unsplash.com";
  final String unsplashClientId;

  UnsplashApi({this.unsplashClientId});

  Future<List<ImageData>> Function({int page}) getByKeyword(String keyword) {
    String endpoint = "/search/photos";

    String url = "${UnsplashApi._baseUrl}$endpoint";

    Future<List<ImageData>> getWithThisConfig({int page}) async {
      var response = await http.get("$url?page=$page&query=$keyword",
          headers: {"Authorization": "Client-ID $unsplashClientId"});

      List<dynamic> data = jsonDecode(response.body)["results"];
      List<ImageData> images = [];

      data.forEach((result) {
        var urls = result["urls"];

        images.add(ImageData(
            id: result["id"],
            url: ImageUrl(
                full: urls["full"],
                raw: urls["raw"],
                regular: urls["regular"],
                small: urls["small"],
                thumb: urls["thumb"]),
            color: result["color"],
            width: result["width"].toDouble(),
            height: result["height"].toDouble()));
      });

      return images;
    }

    return getWithThisConfig;
  }
}
