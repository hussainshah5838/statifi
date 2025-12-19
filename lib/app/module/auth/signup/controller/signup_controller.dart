import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final cEmailController = TextEditingController();
  final nameController = TextEditingController();

  final rememberMe = false.obs;
}
