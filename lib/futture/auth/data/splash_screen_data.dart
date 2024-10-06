class SplashScreenData {
  final String imagePath;
  final String title;
  final String description;

  SplashScreenData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

List<SplashScreenData> splashScreenData = <SplashScreenData>[
  SplashScreenData(
    imagePath: "assets/images/splash_screen_1.png",
    title: "Premium Food\nAt Your Doorstep",
    description:
        "Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy",
  ),
  SplashScreenData(
    imagePath: "assets/images/splash_screen_2.png",
    title: "Buy Premium\nQuality Fruits",
    description:
        "Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy",
  ),
  SplashScreenData(
    imagePath: "assets/images/splash_screen_3.png",
    title: "Buy Quality\nDairy Products",
    description:
        "Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy",
  ),
  SplashScreenData(
    imagePath: "assets/images/splash_screen_4.png",
    title: "Get Discounts\nOn All Products",
    description:
        "Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy",
  ),
];
