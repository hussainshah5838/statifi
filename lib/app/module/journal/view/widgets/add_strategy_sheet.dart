import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';

import '../../../../../global_widgets/app_textstyle.dart';
import '../../controller/journal_controller.dart';

class AddStrategySheet extends StatefulWidget {
  final String title;
  final String subtitle;
  const AddStrategySheet({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  State<AddStrategySheet> createState() => _AddStrategySheetState();
}

class _AddStrategySheetState extends State<AddStrategySheet> {
  final JournalController _controller = Get.find<JournalController>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: bottomInsets > 0 ? screenHeight * 0.8 : screenHeight * 0.55,
      padding: EdgeInsets.all(15),
      decoration: const BoxDecoration(color: Color(0xFF0C121A)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 43,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              widget.title,
              textAlign: TextAlign.start,
              style: AppTextStyles.title.copyWith(fontSize: 20),
            ),

            const SizedBox(height: 7),

            Text(
              widget.subtitle,
              textAlign: TextAlign.start,
              style: AppTextStyles.body,
            ),

            const SizedBox(height: 15),

            Text('Title', style: AppTextStyles.body),
            const SizedBox(height: 5),
            CustomTextField(
              controller: _titleController,
              hintText: 'notes title here...',
              containerColor: AppColors.tColor1.withOpacity(0.4),
            ),

            const SizedBox(height: 10),

            Text('Notes', style: AppTextStyles.body),
            const SizedBox(height: 5),
            CustomTextField(
              controller: _notesController,
              hintText: 'strategy notes here...',
              containerColor: AppColors.tColor1.withOpacity(0.4),
              maxLine: 5,
            ),

            const SizedBox(height: 15),

            AuthButton(
              text: 'Save note',
              onTap: () {
                if (_titleController.text.trim().isNotEmpty &&
                    _notesController.text.trim().isNotEmpty) {
                  _controller.addNote(
                    _titleController.text.trim(),
                    _notesController.text.trim(),
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
