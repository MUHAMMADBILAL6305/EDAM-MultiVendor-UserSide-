
class ExplanationData {
  final String title;
  final String localImageSrc,description;
  final double imageHeight;
  final double imageWidth;

  ExplanationData({required this.title, required this.localImageSrc,required this.description, required this.imageHeight, required this.imageWidth});
}

final List<ExplanationData> data = [
  ExplanationData(
    title: "Search Items",
    localImageSrc: "assets/images/OnBoarding11.png",
    description: 'Search millions of items you want very easily.',
    imageWidth: 300.37,
    imageHeight: 300.14,
  ),
  ExplanationData(
    title: "Order It",
    localImageSrc: "assets/images/OnBoarding22.png",
    description: 'We are eShop and here to make your life easier. Just relax and get started',
    imageWidth: 320.95,
    imageHeight: 300.27,
  ),
  ExplanationData(
    title: "You Got It",
    localImageSrc: "assets/images/OnBoarding33.png",
    description: 'Special for you, you will got it to your door steps.',
    imageWidth: 350.36,
    imageHeight: 300.29,
  ),
  ExplanationData(
    title: "Complete your shopping",
    localImageSrc: "assets/images/OnBoarding44.png",
    description: 'Complete your shopping easily without any mobility at your hand.',
    imageWidth: 310.25,
    imageHeight: 310.73,
  ),
];
