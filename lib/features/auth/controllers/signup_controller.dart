import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
