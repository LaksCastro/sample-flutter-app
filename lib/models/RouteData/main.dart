class RouteDataModel<P> {
  final String name;
  final String description;
  final String key;
  final String path;
  final bool hasParams;
  final P params;

  RouteDataModel(
      {this.name,
      this.description,
      this.key,
      this.path,
      this.hasParams,
      this.params});
}
