import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statifi/app/module/subscription_plans/view/screens/screen_widget/payment_card.dart';
import 'package:statifi/core/constants/app_images.dart';
import 'package:statifi/core/extentions/media_query_extension.dart';
import 'package:statifi/global_widgets/account_upgrade_sheet.dart';
import 'package:statifi/global_widgets/appbar_header.dart';
import 'package:statifi/global_widgets/auth_button.dart';
import 'package:statifi/global_widgets/custom_bottom_sheet.dart';
import 'package:statifi/global_widgets/custom_textfield.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../global_widgets/app_background.dart';
import '../../../../../global_widgets/app_textstyle.dart';
import '../../../../../routes/app_routes.dart';
import '../../controller/payment_method_controller.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentMethodController());

    final imageList = [
      AppImages.card,
      AppImages.apple,
      AppImages.googlePay,
      AppImages.emericanExpress,
    ];

    final paymentMethods = [
      "Debit/Credit Card",
      "Apple Pay",
      "Google Pay",
      "American Express",
    ];

    void _showPaymentSheet(String method) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.bgColor1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              // top: 20,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: 50,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Text(
                  //   method,
                  //   style: AppTextStyles.title.copyWith(fontSize: 20),
                  // ),
                  Text(
                    'Payment Details',
                    style: AppTextStyles.title.copyWith(fontSize: 20),
                  ),
                  Text(
                    "Please enter the correct information to complete the purchase.",
                    style: AppTextStyles.body,
                  ),

                  const SizedBox(height: 20),

                  // Payment Form Fields
                  CustomTextField(
                    hintText: "card number",
                    containerColor: AppColors.tColor1.withOpacity(0.3),
                  ),

                  const SizedBox(height: 10),

                  CustomTextField(
                    hintText: "card holder name",
                    containerColor: AppColors.tColor1.withOpacity(0.3),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: "expiry date",
                          containerColor: AppColors.tColor1.withOpacity(0.3),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          hintText: "CVV",
                          containerColor: AppColors.tColor1.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  CustomTextField(
                    hintText: "Billing address",
                    containerColor: AppColors.tColor1.withOpacity(0.3),
                  ),

                  const SizedBox(height: 20),

                  AuthButton(
                    text: "Confirm Payment",
                    onTap: () {
                      Navigator.pop(context);
                      AccountUpgradeSheet.show(
                        context: context,
                        imagePath: AppImages.verifyImg,
                        title: "Upgrade Successfully!",
                        subtitle1:
                            "Your account has been successfully updated. Enjoy the best features of the app.",
                        dateTime: "Oct 23, 2025 | 12:00 PM",
                        type: "Basic Monthly",
                        nextPayment: "November 23, 2025",
                        methodUsed: "Master card ***56",
                        buttonText: 'Done',
                        onButtonTap: () {
                          Get.until((route) => route.isFirst);
                          Get.toNamed(AppRoutes.subPlan);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.screeHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: AppBackground.splashGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarHeader(title: 'Payment Method'),

              const SizedBox(height: 20),

              Text(
                'Select Payment',
                style: AppTextStyles.title.copyWith(fontSize: 24),
              ),
              Text(
                'Please select the preferred payment method.',
                style: AppTextStyles.body,
              ),

              const SizedBox(height: 15),

              Obx(
                () => Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(paymentMethods.length, (index) {
                    return PaymentCard(
                      width: (context.screenWidth - 50) / 2,
                      isSelected: controller.selectedMethod.value == index,
                      onTap: () {
                        controller.selectMethod(index);
                        _showPaymentSheet(paymentMethods[index]);
                      },
                      title: paymentMethods[index],
                      img: imageList[index],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
