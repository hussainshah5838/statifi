class PlatformsModel {
  final String title;
  final String img;
  final String platform;
  final String broker;
  final String server;
  final String? profitLoss;
  final String? dateTime;

  PlatformsModel({
    required this.platform,
    required this.broker,
    required this.server,
    required this.title,
    required this.img,
    this.profitLoss,
    this.dateTime,
  });
}
