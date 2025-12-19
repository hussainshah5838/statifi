import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/community/view/screens/sub_widgets/add_post_container.dart';
import 'package:statifi/core/constants/app_colors.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/constants/app_texts.dart';
import 'package:statifi/global_widgets/app_textstyle.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';
import '../../../../../data/models/community_tabs_model.dart';
import '../../controller/community_controller.dart';

class AllPostsView extends GetView<CommunityController> {
  const AllPostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (controller.allPosts.isEmpty) {
          return const Center(
            child: Text('No posts yet', style: TextStyle(color: Colors.white)),
          );
        }

        return Column(
          children: [
            AddPostContainer(),

            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: controller.allPosts.length,
                itemBuilder: (context, index) {
                  final post = controller.allPosts[index];
                  return _buildPostCard(post, index, context);
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildPostCard(AllPosts post, int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF293645).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage(AppImages.mocProfile)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: AppTextStyles.title.copyWith(fontSize: 16),
                    ),
                    Text(
                      '@${post.username} • ${post.timeAgo}',
                      style: AppTextStyles.body.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: () {
                  _showPostOptions(context, index);
                },
                child: Image.asset(AppImages.dots, width: 20),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Only show content if there's NO poll
          if (post.poll == null) ...[
            Text(
              post.content,
              style: AppTextStyles.title.copyWith(fontSize: 14),
            ),
          ],

          if (post.poll != null) ...[
            const SizedBox(height: 16),
            _buildPoll(post.poll!, post.hashtags),
          ] else if (post.hashtags != null && post.hashtags!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              children: post.hashtags!.map((tag) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 4),
                  child: Text(
                    tag,
                    style: AppTextStyles.title.copyWith(
                      color: Colors.blue[400],
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],

          if (post.isPromotional == true) ...[
            const SizedBox(height: 16),
            _buildTradingSignalsOffer(),
          ],

          const SizedBox(height: 15),
          Divider(color: Colors.white10, height: 1),
          const SizedBox(height: 15),

          Row(
            children: [
              _buildEngagementItem(
                AppImages.like2,
                '${controller.formatCount(post.likes.toInt())} Likes',
                () => controller.likePost(index),
              ),
              const SizedBox(width: 16),
              _buildEngagementItem(
                AppImages.messages,
                '${controller.formatCount(post.comments.toInt())} Comments',
                () => controller.addComment(index),
              ),
              const SizedBox(width: 16),
              _buildEngagementItem(
                AppImages.share2,
                '${controller.formatCount(post.shares.toInt())} Shares',
                () => controller.sharePost(index),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPoll(Poll poll, List<String>? hashtags) {
    final tags = hashtags ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(poll.question, style: AppTextStyles.title.copyWith(fontSize: 14)),
        const SizedBox(height: 12),

        // Poll options
        ...List.generate(poll.options.length, (index) {
          final option = poll.options[index];
          final bgColor = option.percentage < 50
              ? Colors.grey[500]
              : Color(0xFF36CFE6).withOpacity(0.5);

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Color(0xFF293645),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    height: 49,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      // color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        FractionallySizedBox(
                          widthFactor: option.percentage / 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),

                        // Centered option text inside bar
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              option.text,
                              style: AppTextStyles.title.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Right-side percentage text OUTSIDE the bar
                const SizedBox(width: 8),
                Text(
                  '${option.percentage}%',
                  style: AppTextStyles.title.copyWith(fontSize: 14),
                ),
              ],
            ),
          );
        }),

        const SizedBox(height: 8),

        // Prompt text
        Text(
          poll.promptText,
          style: AppTextStyles.title.copyWith(fontSize: 14),
        ),

        const SizedBox(height: 6),

        // Hashtags section
        if (tags.isNotEmpty)
          Wrap(
            spacing: 8,
            children: tags.map((tag) {
              return Text(
                tag,
                style: AppTextStyles.title.copyWith(
                  fontSize: 14,
                  color: Colors.blueAccent,
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  Widget _buildTradingSignalsOffer() {
    return GestureDetector(
      onTap: () => _showBuyNowSheet(Get.context!),

      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: Color(0xFF36CFE6).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Buy now for \$50',
            style: AppTextStyles.body.copyWith(
              color: Color(0xFF36CFE6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _showBuyNowSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgColor1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final height = MediaQuery.of(context).size.height * 0.55;

        return Container(
          height: height,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Payment Details\n",
                        style: AppTextStyles.title.copyWith(fontSize: 22),
                      ),
                      WidgetSpan(child: const SizedBox(height: 5)),
                      TextSpan(
                        text:
                            "Please enter the correct information to complete the purchase.",
                        style: AppTextStyles.body.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Card Number
                CustomTextField(hintText: 'card number'),

                const SizedBox(height: 14),

                // Name on Card
                CustomTextField(hintText: 'card holder name'),

                const SizedBox(height: 14),

                // Expiry & CVV row
                Row(
                  children: [
                    Expanded(child: CustomTextField(hintText: 'expiry date')),
                    const SizedBox(width: 12),
                    Expanded(child: CustomTextField(hintText: 'CVV')),
                  ],
                ),
                const SizedBox(height: 14),

                // Billing Address
                CustomTextField(hintText: 'Billing address'),

                const SizedBox(height: 20),

                // Pay Button
                AuthButton(
                  text: 'Confirm Payment',
                  onTap: () {
                    Navigator.pop(context);
                    _showSuccessPaymentSheet(Get.context!);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSuccessPaymentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bgColor1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final height = MediaQuery.of(context).size.height * 0.60;

        return Container(
          height: height,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                Image.asset(AppImages.verifyImg, width: 200, height: 200),
                const SizedBox(height: 20),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Purchase Successfully\n",
                        style: AppTextStyles.title.copyWith(fontSize: 25),
                      ),
                      WidgetSpan(child: const SizedBox(height: 5)),
                      TextSpan(
                        text:
                            "You have successfully purchased a pdf from Christopher henry",
                        style: AppTextStyles.body.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date & Time",
                      style: AppTextStyles.body.copyWith(fontSize: 15),
                    ),
                    Text(
                      "Oct 23, 2025 | 12:00 PM",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),
                Divider(color: Colors.white10),
                const SizedBox(height: 14),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date & Time",
                      style: AppTextStyles.body.copyWith(fontSize: 15),
                    ),
                    Text(
                      "Oct 23, 2025 | 12:00 PM",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Pay Button
                AuthButton(
                  text: 'Download Pdf',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEngagementItem(String image, String count, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(image, width: 20, height: 20),
          const SizedBox(width: 2),
          Text(count, style: AppTextStyles.title.copyWith(fontSize: 12)),
        ],
      ),
    );
  }

  void _showPostOptions(BuildContext context, int index) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF293645).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildPopupOption(
                      text: 'Send Message',
                      onTap: () {
                        Navigator.pop(context);
                        _reportPost(index);
                      },
                    ),
                    _buildPopupOption(
                      text: 'Block User',
                      onTap: () {
                        Navigator.pop(context);
                        _blockUser(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: anim, curve: Curves.easeOutBack),
          child: child,
        );
      },
    );
  }

  Widget _buildPopupOption({
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  void _reportPost(int index) {
    Get.snackbar(
      'Message',
      'Thank you for sending message to this user.',
      backgroundColor: Color(0xFF36CFE6).withOpacity(0.25),
      colorText: Colors.white,
    );
  }

  void _blockUser(int index) {
    Get.snackbar(
      'User Blocked',
      'You have blocked this user.',
      backgroundColor: Colors.red.withOpacity(0.25),
      colorText: Colors.white,
    );
  }
}
