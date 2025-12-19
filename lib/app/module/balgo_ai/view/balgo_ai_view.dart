import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/balgo_ai/controller/balgo_ai_controller.dart';
import 'package:statifi/app/module/balgo_ai/view/widgets/ai_generation_sheet.dart';
import 'package:statifi/app/module/balgo_ai/view/widgets/ai_report_generation_card.dart';
import 'package:statifi/app/module/balgo_ai/view/widgets/balgo_header.dart';
import 'package:statifi/app/module/balgo_ai/view/widgets/report_generation_bottom_sheet.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';

import '../../../../global_widgets/app_background.dart';
import '../../../../global_widgets/custom_bottom_sheet.dart';
import '../../../../global_widgets/profile_drawer.dart';
import '../../home/view/widgets/profile_sheet.dart';

class BalgoAiView extends GetView<BalgoAiController> {
  const BalgoAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: Container(
            height: context.screeHeight,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

            alignment: Alignment.center,
            decoration: BoxDecoration(gradient: AppBackground.splashGradient),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppbarHeader(
                    backImg: AppImages.drawer3,
                    onBackTap: () {
                      AppDialogs.openLeftSideSheet(
                        context: context,
                        child: const ProfileSheet(),
                      );
                    },
                  ),

                  const SizedBox(height: 15),

                  BalgoHeader(),

                  const SizedBox(height: 10),

                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.tColor1.withOpacity(0.3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.ranking, width: 24),
                            const SizedBox(width: 10),
                            Text(
                              'Ai Report Generation',
                              style: AppTextStyles.title.copyWith(fontSize: 16),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        AiReportGenerationCard(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => ReportGenerationBottomSheet(
                                title: "Generate Comprehensive Trading Report",
                                timeFrameText: "Report Timeframe",
                                timeText: "Weekly Report",
                                reportInclude: "Report will include:",
                                reportList: [
                                  "Previous trades analysis with performance metrics.",
                                  "Future market outlook for major forex pairs.",
                                  "Risk assessment and recommendations.",
                                  "Trading opportunities to watch",
                                  "Overall strategy adjustments needed",
                                ],
                                onTap: () {
                                  Navigator.pop(context);
                                  AiGenerationSheet.show(
                                    context: context,
                                    imagePath: AppImages.aiSymbol,
                                    title: "is Analyzing ...",
                                    subtitle1:
                                        "Processing your trading data with ForexFactory news to generate personalized insights.",
                                    buttonText: "Generate Now",
                                    onButtonTap: () {
                                      // Your button action
                                    },
                                  );
                                },
                              ),
                            );
                          },

                          cColor1: Color(0xFF1C8AC2).withOpacity(0.5),
                          cColor2: Color(0xFF1B2935).withOpacity(0.5),
                          img: AppImages.tradeOverview,
                          title: 'Complete Trading Overview Report',
                          subtitle:
                              'Comprehensive analysis combining past performance with future market outlook.',
                        ),

                        const SizedBox(height: 10),

                        AiReportGenerationCard(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (_) => ReportGenerationBottomSheet(
                                title: "Generate High Impact \nNews Analysis",
                                timeFrameText: "News analysis Timeframe",
                                timeText: "Next 7 Days",
                                reportInclude: "Analysis will include:",
                                reportList: [
                                  "Upcoming economics events affecting forex markets.",
                                  "Central bank meetings and policy implications.",
                                  "Geopolitical events to monitor",
                                  "Currency-specific news and impacts",
                                  "Trading strategies around these events.",
                                ],
                                onTap: () {
                                  Navigator.pop(context);
                                  AiGenerationSheet.show(
                                    context: context,
                                    imagePath: AppImages.aiSymbol,
                                    title: "is Analyzing ...",
                                    subtitle1:
                                        "Processing your trading data with ForexFactory news to generate personalized insights.",
                                    buttonText: "Generate Now",
                                    onButtonTap: () {},
                                  );
                                },
                              ),
                            );
                          },

                          cColor1: Color(0xFFBD7809).withOpacity(0.5),
                          cColor2: Color(0xFF1B2834).withOpacity(0.5),
                          img: AppImages.newsAnalysis,
                          title: 'High Impact News Analysis',
                          subtitle:
                              'Upcoming market-moving events with trading implications.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.tColor1.withOpacity(0.3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.ranking, width: 24),
                            const SizedBox(width: 10),
                            Text(
                              'Ai Report Generation',
                              style: AppTextStyles.title.copyWith(fontSize: 16),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        AiReportGenerationCard(
                          cColor1: Color(0xFF29452A).withOpacity(0.5),
                          cColor2: Color(0xFF1B2935).withOpacity(0.5),
                          img: AppImages.performanceAnalysis,
                          title: 'Trade performance analysis',
                          subtitle:
                              'Analyze your recent trades for patterns and improvement areas',
                        ),

                        const SizedBox(height: 10),

                        AiReportGenerationCard(
                          cColor1: Color(0xFFCC223E).withOpacity(0.5),
                          cColor2: Color(0xFF1B2834).withOpacity(0.5),
                          img: AppImages.riskManagement,
                          title: 'Risk Management Review',
                          subtitle:
                              'Evaluate your risk management and position sizing.',
                        ),

                        const SizedBox(height: 10),

                        AiReportGenerationCard(
                          cColor1: Color(0xFFC2B41C).withOpacity(0.5),
                          cColor2: Color(0xFF1B2834).withOpacity(0.5),
                          img: AppImages.tradingPsychology,
                          title: 'Trading Psychology',
                          subtitle:
                              'Identify emotional patterns affecting your trades.',
                        ),

                        const SizedBox(height: 10),

                        AiReportGenerationCard(
                          cColor1: Color(0xFF530F7E).withOpacity(0.5),
                          cColor2: Color(0xFF1B2834).withOpacity(0.5),
                          img: AppImages.strategyOptimization,
                          title: 'Strategy Optimization',
                          subtitle:
                              'Optimize your trading strategies based on historical data.',
                        ),

                        const SizedBox(height: 10),

                        AiReportGenerationCard(
                          cColor1: Color(0xFF18C39B).withOpacity(0.5),
                          cColor2: Color(0xFF1B2834).withOpacity(0.5),
                          img: AppImages.insightsForecast,
                          title: 'Market Insights & Forecast',
                          subtitle:
                              'Get AI-powered market analysis and predictions.',
                        ),

                        const SizedBox(height: 10),

                        AiReportGenerationCard(
                          cColor1: Color(0xFFCC22A1).withOpacity(0.5),
                          cColor2: Color(0xFF1B2834).withOpacity(0.5),
                          img: AppImages.problemDetection,
                          title: 'Journal Problem Detection',
                          subtitle:
                              'AI identifies issues from your trading journal entries.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.tColor1.withOpacity(0.3),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.ranking, width: 24),
                            const SizedBox(width: 10),
                            Text(
                              'Ai Report Generation',
                              style: AppTextStyles.title.copyWith(fontSize: 16),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),
                        CustomTextField(
                          hintText: "Ask AI anything about your trading...",
                          maxLine: 5,
                        ),

                        const SizedBox(height: 10),

                        AuthButton(
                          text: 'Get Balgo AI Analysis',
                          onTap: () {},
                          txtColor: AppColors.textAmber,
                          txtSize: 15,
                          color: AppColors.textAmber.withOpacity(0.05),
                          isOutlined: true,
                          outLineColor: AppColors.textAmber,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
