class HomeCardInfo {
  HomeCardInfo({this.title, this.shortDescription, this.query});

  final String title;
  final String shortDescription;
  final String query;
}

class HomeCardCategory {
  HomeCardCategory({this.title, this.cards});

  final HomeCardInfo cards;
  final String title;
}

List<List<HomeCardInfo>> homeCards = [
  [
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Fractal", shortDescription: "Fractal Images"),
    HomeCardInfo(title: "Nature", shortDescription: "Nature Images"),
  ],
  [
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
  ],
  [
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
  ],
  [
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
  ],
  [
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
  ],
  [
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
    HomeCardInfo(title: "Minimalist", shortDescription: "Minimalist Images"),
  ],
];
