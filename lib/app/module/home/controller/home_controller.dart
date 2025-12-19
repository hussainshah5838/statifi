import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedPeriod = "This Week".obs;

  var selectedLinePeriod = "This Week".obs;
  var selectedBarPeriod = "This Week".obs;
  // Separate selection for the total bar chart so it doesn't change when
  // the main bar chart's dropdown is used.
  var selectedBarTotalPeriod = "This Week".obs;

  /// Total P&L value (reactive)
  var totalPnL = "\$134,455.99".obs;

  var spots = <FlSpot>[
    const FlSpot(0, 1.2), // Mon - ~$48k
    const FlSpot(1, 0.8), // Tue - ~$32k
    const FlSpot(2, 3.2),
    const FlSpot(3, 1.5),
    const FlSpot(4, 2.8),
    const FlSpot(5, 1.0),
    const FlSpot(6, 3.0),
  ].obs;

  // Increased example values so chart candles are more visually prominent.
  var profitSpots = <double>[3.2, 2.8, 5.2, 3.5, 4.8, 2.0, 5.0].obs;
  var lossSpots = <double>[0.0, 0.8, 0.0, 0.0, 1.5, 0.0, 0.0].obs;

  // Data for the "total" bar chart (independent of the main bar chart)
  // Total chart uses larger seeded values for stronger visual contrast
  var totalProfitSpots = <double>[3.2, 2.6, 0.0, 3.5, 4.3, 0.0, 5.0].obs;
  var totalLossSpots = <double>[0.0, 1.4, 4.5, 0.0, 0.0, 1.5, 0.0].obs;
  var totalPnLTotal = "\$134,455.99".obs;

  var profitTrades = <List<String>>[
    ['P#101', 'P#102'],
    ['P#103'],
    ['P#104', 'P#105', 'P#106'],
    ['P#107'],
    ['P#108', 'P#109'],
    ['P#110'],
    ['P#111', 'P#112'],
  ].obs;

  var lossTrades = <List<String>>[
    <String>[],
    ['L#201'],
    <String>[],
    <String>[],
    ['L#202'],
    <String>[],
    <String>[],
  ].obs;

  int dollarsFromY(double y) {
    return (y * 40000).round();
  }

  String formatCurrencyPositive(int amount, {bool includePlus = false}) {
    final s = amount.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (m) => ',',
    );
    if (includePlus) return '+\$' + s;
    return '\$' + s;
  }

  int getProfitAmountForIndex(int index) {
    if (index < 0 || index >= profitSpots.length) return 0;
    return dollarsFromY(profitSpots[index]);
  }

  int getLossAmountForIndex(int index) {
    if (index < 0 || index >= lossSpots.length) return 0;
    return dollarsFromY(lossSpots[index]);
  }

  int totalProfitForBarPeriod() {
    final sum = profitSpots.fold<double>(0.0, (prev, e) => prev + e);
    return (sum * 40000).round();
  }

  int totalLossForBarPeriod() {
    final sum = lossSpots.fold<double>(0.0, (prev, e) => prev + e);
    return (sum * 40000).round();
  }

  void changePeriod(String period) {
    selectedPeriod.value = period;

    switch (period) {
      case "This Week":
        spots.value = const [
          FlSpot(0, 1.2), // Mon
          FlSpot(1, 0.8), // Tue
          FlSpot(2, 3.2), // Wed
          FlSpot(3, 1.5), // Thu
          FlSpot(4, 2.8), // Fri
          FlSpot(5, 1.0), // Sat
          FlSpot(6, 3.0), // Sun
        ];
        profitSpots.value = [3.2, 2.8, 5.2, 3.5, 4.8, 2.0, 5.0];
        lossSpots.value = [0.0, 0.8, 0.0, 0.0, 1.5, 0.0, 0.0];
        totalPnL.value = "\$134,455.99";
        break;

      case "Last Week":
        spots.value = const [
          FlSpot(0, 2.5), // Mon
          FlSpot(1, 1.8), // Tue
          FlSpot(2, 0.5), // Wed
          FlSpot(3, 2.2), // Thu
          FlSpot(4, 1.5), // Fri
          FlSpot(5, 3.0), // Sat
          FlSpot(6, 2.0), // Sun
        ];
        profitSpots.value = [2.5, 1.5, 0.2, 2.2, 1.0, 3.0, 1.8];
        lossSpots.value = [0.0, 2.3, 0.3, 0.0, 0.5, 0.0, 0.2];
        totalPnL.value = "\$98,750.50";
        break;

      case "This Month":
        spots.value = const [
          FlSpot(0, 0.8),
          FlSpot(1, 1.5),
          FlSpot(2, 2.2),
          FlSpot(3, 3.0),
        ];
        profitSpots.value = [0.8, 1.2, 2.2, 3.0];
        lossSpots.value = [0.0, 0.3, 0.0, 0.0];
        totalPnL.value = "\$215,820.75";
        break;

      case "Last Month":
        spots.value = const [
          FlSpot(0, 1.0), // Week 1
          FlSpot(1, 1.8), // Week 2
          FlSpot(2, 1.5), // Week 3
          FlSpot(3, 2.0), // Week 4
        ];
        profitSpots.value = [1.0, 1.3, 1.5, 2.0];
        lossSpots.value = [0.0, 0.5, 0.0, 0.0];
        totalPnL.value = "\$187,340.25";
        break;

      default:
        // fallback to "This Week"
        spots.value = const [
          FlSpot(0, 1.2),
          FlSpot(1, 0.8),
          FlSpot(2, 3.2),
          FlSpot(3, 1.5),
          FlSpot(4, 2.8),
          FlSpot(5, 1.0),
          FlSpot(6, 3.0),
        ];
        profitSpots.value = [3.2, 2.8, 5.2, 3.5, 4.8, 2.0, 5.0];
        lossSpots.value = [0.0, 0.8, 0.0, 0.0, 1.5, 0.0, 0.0];
        totalPnL.value = "\$134,455.99";
        break;
    }
  }

  /// Change only the line chart period (does not affect bar chart)
  void changeLinePeriod(String period) {
    selectedLinePeriod.value = period;

    switch (period) {
      case "This Week":
        spots.value = const [
          FlSpot(0, 1.2),
          FlSpot(1, 0.8),
          FlSpot(2, 3.2),
          FlSpot(3, 1.5),
          FlSpot(4, 2.8),
          FlSpot(5, 1.0),
          FlSpot(6, 3.0),
        ];
        break;
      case "Last Week":
        spots.value = const [
          FlSpot(0, 2.5),
          FlSpot(1, 1.8),
          FlSpot(2, 0.5),
          FlSpot(3, 2.2),
          FlSpot(4, 1.5),
          FlSpot(5, 3.0),
          FlSpot(6, 2.0),
        ];
        break;
      case "This Month":
        spots.value = const [
          FlSpot(0, 0.8),
          FlSpot(1, 1.5),
          FlSpot(2, 2.2),
          FlSpot(3, 3.0),
        ];
        break;
      case "Last Month":
        spots.value = const [
          FlSpot(0, 1.0),
          FlSpot(1, 1.8),
          FlSpot(2, 1.5),
          FlSpot(3, 2.0),
        ];
        break;
      default:
        spots.value = const [
          FlSpot(0, 1.2),
          FlSpot(1, 0.8),
          FlSpot(2, 3.2),
          FlSpot(3, 1.5),
          FlSpot(4, 2.8),
          FlSpot(5, 1.0),
          FlSpot(6, 3.0),
        ];
        break;
    }
  }

  void changeBarPeriod(String period) {
    selectedBarPeriod.value = period;

    switch (period) {
      case "This Week":
        profitSpots.value = [3.2, 2.8, 5.2, 3.5, 4.8, 2.0, 5.0];
        lossSpots.value = [0.0, 0.8, 0.0, 0.0, 1.5, 0.0, 0.0];
        totalPnL.value = "\$134,455.99";
        break;
      case "Last Week":
        profitSpots.value = [2.5, 1.5, 0.2, 2.2, 1.0, 3.0, 1.8];
        lossSpots.value = [0.0, 0.3, 0.3, 0.0, 0.5, 0.0, 0.2];
        totalPnL.value = "\$98,750.50";
        break;
      case "This Month":
        profitSpots.value = [0.8, 1.2, 2.2, 3.0];
        lossSpots.value = [0.0, 0.3, 0.0, 0.0];
        totalPnL.value = "\$215,820.75";
        break;
      case "Last Month":
        profitSpots.value = [1.0, 1.3, 1.5, 2.0];
        lossSpots.value = [0.0, 0.5, 0.0, 0.0];
        totalPnL.value = "\$187,340.25";
        break;
      default:
        profitSpots.value = [3.2, 2.8, 5.2, 3.5, 4.8, 2.0, 5.0];
        lossSpots.value = [0.0, 0.8, 0.0, 0.0, 1.5, 0.0, 0.0];
        totalPnL.value = "\$134,455.99";
        break;
    }
  }

  /// Change only the total bar chart period (independent of the other bar chart)
  void changeTotalBarPeriod(String period) {
    selectedBarTotalPeriod.value = period;

    switch (period) {
      case "This Week":
        totalProfitSpots.value = [3.2, 2.6, 0.0, 3.5, 4.3, 0.0, 5.0];
        totalLossSpots.value = [0.0, 1.4, 4.5, 0.0, 0.0, 1.5, 0.0];
        totalPnLTotal.value = "\$134,455.99";
        break;
      case "Last Week":
        totalProfitSpots.value = [2.5, 1.5, 0.0, 2.2, 1.0, 3.0, 1.8];
        totalLossSpots.value = [0.0, 0.0, 0.3, 0.0, 0.5, 0.0, 0.2];
        totalPnLTotal.value = "\$98,750.50";
        break;
      case "This Month":
        totalProfitSpots.value = [0.8, 1.2, 2.2, 3.0];
        totalLossSpots.value = [0.0, 0.3, 0.0, 0.0];
        totalPnLTotal.value = "\$215,820.75";
        break;
      case "Last Month":
        totalProfitSpots.value = [1.0, 1.3, 1.5, 2.0];
        totalLossSpots.value = [0.0, 0.5, 0.0, 0.0];
        totalPnLTotal.value = "\$187,340.25";
        break;
      default:
        totalProfitSpots.value = [3.2, 2.6, 0.0, 3.5, 4.3, 0.0, 5.0];
        totalLossSpots.value = [0.0, 1.4, 4.5, 0.0, 0.0, 1.5, 0.0];
        totalPnLTotal.value = "\$134,455.99";
        break;
    }
  }

  /// Get Y-axis labels based on current period
  List<String> getYAxisLabels() {
    return ["\$200k", "\$100k", "\$75k", "\$50k", "\$10k", "\$0k"];
  }

  /// Get X-axis labels based on current period
  List<String> getXAxisLabels() {
    switch (selectedPeriod.value) {
      case "This Week":
      case "Last Week":
        return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
      case "This Month":
        return ["W1", "W2", "W3", "W4"];
      case "Last Month":
        return ["W1", "W2", "W3", "W4"];
      default:
        return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    }
  }

  /// Convert spot value to actual dollar amount for tooltips
  String getDollarAmount(double yValue) {
    // Assuming yValue 1.0 = $40,000 for scaling
    final amount = (yValue * 40000).round();
    if (amount >= 1000) {
      return "\$${amount ~/ 1000}k";
    }
    return "\$$amount";
  }

  /// Get max Y value for chart scaling
  double getMaxY() {
    return 5.0; // Consistent scale for bar chart
  }

  /// Update chart spots dynamically
  void updateChart(List<FlSpot> newSpots) {
    spots.value = newSpots;
  }

  /// Update total P&L value
  void updateTotalPnL(String newValue) {
    totalPnL.value = newValue;
  }
}
