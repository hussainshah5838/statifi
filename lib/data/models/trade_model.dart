class Trade {
  final String title;
  final String setTrade;
  final String sellTrade;
  final String type;
  final String tradeType;
  final String? profitLoss;
  final String dateTime;

  Trade({
    required this.setTrade,
    required this.sellTrade,
    required this.title,
    required this.type,
    required this.tradeType,
    this.profitLoss,
    required this.dateTime,
  });
}
