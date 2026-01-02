import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final promoController = TextEditingController();

  final isPasswordError = false.obs;
  final isEmailError = false.obs;
  final rememberMe = false.obs;
  final isPromoCodeLink = false.obs;

  void validatePassword() {
    if (passwordController.text.trim() != '123') {
      isPasswordError.value = true;
    } else {
      isPasswordError.value = false;
    }
  }

  void validateEmail() {
    if (emailController.text.trim() != "ukdev1@gmail.com") {
      isEmailError.value = true;
    } else {
      isEmailError.value = false;
    }
  }

  void validatePromo() {
    if (promoController.text.trim() != "123456") {
      isPromoCodeLink.value = true;
    } else {
      isPromoCodeLink.value = false;
    }
  }

  bool validateAll() {
    validateEmail();
    validatePassword();
    return !isEmailError.value && !isPasswordError.value;
  }

  bool validPromoCodeLink() {
    validatePromo();
    return !isPromoCodeLink.value;
  }
}
