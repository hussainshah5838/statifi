import 'package:flutter/material.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';

class ChartCardBottom extends StatelessWidget {
  final int wins;
  final int losses;
  final double winRate; // e.g. 45.8
  final String avgWin;
  final String avgLoss;

  const ChartCardBottom({
    super.key,
    this.wins = 13,
    this.losses = 4,
    this.winRate = 45.8,
    this.avgWin = r"$0.00",
    this.avgLoss = r"$0.00",
  });

  @override
  Widget build(BuildContext context) {
    final total = (wins + losses) > 0 ? (wins + losses) : 1;
    final winFlex = (wins / total * 100).round();
    final lossFlex = (losses / total * 100).round();

    return Row(
      children: [
        Expanded(child: _winRateCard(context, winFlex, lossFlex)),
        const SizedBox(width: 12),
        Expanded(child: _riskRewardCard(context)),
      ],
    );
  }

  Widget _winRateCard(BuildContext context, int winFlex, int lossFlex) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1A1C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Win rate',
            style: AppTextStyles.body.copyWith(color: Colors.grey[400]),
          ),
          const SizedBox(height: 6),
          Text(
            '${winRate.toStringAsFixed(1)}%',
            style: AppTextStyles.heading2.copyWith(
              fontSize: 20,
              color: const Color(0xFF36CFE6),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),

          // stacked bar
          Container(
            height: 18,
            decoration: BoxDecoration(
              color: const Color(0xFF14302F),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                // green portion
                Expanded(
                  flex: winFlex,
                  child: Transform.scale(
                    scale: 1.08,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF12B76A),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '$wins',
                          style: AppTextStyles.title.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // red portion
                Expanded(
                  flex: lossFlex,
                  child: Transform.scale(
                    scale: 1.08,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF04438),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '$losses',
                          style: AppTextStyles.title.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // counts row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              // wins
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Wins',
                  style: AppTextStyles.title.copyWith(
                    color: Colors.grey[300],
                    fontSize: 12,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  'Loses',
                  style: AppTextStyles.title.copyWith(
                    color: Colors.grey[300],
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _riskRewardCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1A1C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF234557)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Risk/Reward',
            style: AppTextStyles.title.copyWith(fontSize: 15),
          ),
          const SizedBox(height: 8),

          // ratio placeholder
          Text(
            '--',
            style: AppTextStyles.title.copyWith(
              color: const Color(0xFF36CFE6),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    avgWin,
                    style: AppTextStyles.heading2.copyWith(
                      color: const Color(0xFF36CFE6),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Avg. Win',
                    style: AppTextStyles.body.copyWith(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    avgLoss,
                    style: AppTextStyles.heading2.copyWith(
                      color: const Color(0xFFF04438),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Avg. Loss',
                    style: AppTextStyles.body.copyWith(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
