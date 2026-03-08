import 'package:drena_conversa/core/constants/app_strings.dart';

class Validators {
  Validators._();

  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.errorUsernameRequired;
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.errorPasswordRequired;
    }
    return null;
  }
}