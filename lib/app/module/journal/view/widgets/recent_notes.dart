import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/extentions/custom_painters.dart';
import '../../../../../data/models/strategy_model.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../global_widgets/profile_drawer.dart';
import '../../controller/journal_controller.dart';
import 'analysis_card.dart';

class RecentNotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final JournalController controller = Get.find<JournalController>();

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row(
          //   children: [
          //     Image.asset(AppImages.receiptEdit, width: 24),
          //     const SizedBox(width: 10),
          //     Text(
          //       'Recent Strategy Notes',
          //       style: AppTextStyles.title.copyWith(fontSize: 16),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 25),
          if (controller.notes.isEmpty)
            _buildEmptyState()
          else
            _buildNotesList(controller, context),
          const SizedBox(height: 10),
          _buildTradingProfile(context),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.tColor1.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppImages.receiptEdit, width: 24),
                const SizedBox(width: 10),
                Text(
                  'Recent Strategy Notes',
                  style: AppTextStyles.title.copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Container(
              padding: EdgeInsets.all(10),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.textAmber.withOpacity(0.1),
              ),
              child: Image.asset(AppImages.solarNotes, fit: BoxFit.contain),
            ),
            const SizedBox(height: 20),
            Text(
              'No Strategy notes yet. Click "Add strategy note" to get started!',
              textAlign: TextAlign.center,
              style: AppTextStyles.body,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesList(JournalController controller, BuildContext ctx) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.tColor1.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppImages.receiptEdit, width: 24),
                const SizedBox(width: 10),
                Text(
                  'Recent Strategy Notes',
                  style: AppTextStyles.title.copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.notes.length,
              itemBuilder: (context, index) {
                final note = controller.notes[index];
                return _buildNoteItem(note, controller);
              },
            ),

            const SizedBox(height: 15),

            GestureDetector(
              onTap: () {
                AppDialogs.strategyNoteSheet(context: ctx);
              },
              child: Container(
                alignment: Alignment.center,
                height: 47,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  color: AppColors.textAmber.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: DottedBorder(
                    color: AppColors.textAmber.withOpacity(0.7),
                    strokeWidth: 1.5,
                    dashWidth: 8.0,
                    dashGap: 4.0,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1.5),
                    child: Text(
                      '+ Add Strategy note',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.title.copyWith(
                        fontSize: 14,
                        color: AppColors.textAmber.withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteItem(NoteModel note, JournalController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.formatDateTime(note.createdAt),
                style: AppTextStyles.body.copyWith(
                  fontSize: 10,
                  // color: Colors.grey[400],
                ),
              ),
              GestureDetector(
                onTap: () => controller.deleteNote(note.id),
                child: Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red),
                  ),
                  child: Image.asset(AppImages.dltIcon, fit: BoxFit.contain),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Title
          Text(note.title, style: AppTextStyles.title.copyWith(fontSize: 14)),

          const SizedBox(height: 5),

          // Content/Subtitle
          Text(
            note.content,
            style: AppTextStyles.body.copyWith(fontSize: 12),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildTradingProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.tColor1.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppImages.receiptEdit, width: 24),
                const SizedBox(width: 10),
                Text(
                  'Your Trading Profile',
                  style: AppTextStyles.title.copyWith(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 75) / 2,
                  child: AnalysisCard(
                    title: 'Day Trader',
                    subtitle: 'Trading Style',
                    titleSize: 16,
                    bgColor: Colors.black38,
                    txtColor: AppColors.textAmber,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 75) / 2,
                  child: AnalysisCard(
                    title: 'Moderate',
                    subtitle: 'Risk Tolerance',
                    titleSize: 16,
                    bgColor: Colors.black38,
                    txtColor: AppColors.textAmber,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 75) / 2,
                  child: AnalysisCard(
                    title: '50.0%',
                    subtitle: 'Win Trade',
                    titleSize: 16,
                    bgColor: Colors.black38,
                    txtColor: AppColors.textGreen,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 75) / 2,
                  child: AnalysisCard(
                    title: '2.0:1',
                    subtitle: 'Risk/Reward',
                    titleSize: 16,
                    bgColor: Colors.black38,
                    txtColor: AppColors.textAmber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
