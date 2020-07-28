class ImageData {
  final String id;
  final ImageUrl url;
  final String color;
  final double width;
  final double height;

  ImageData({this.url, this.id, this.color, this.width, this.height});
}

class ImageUrl {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  ImageUrl({this.raw, this.full, this.regular, this.small, this.thumb});
}
