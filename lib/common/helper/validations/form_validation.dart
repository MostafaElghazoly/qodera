import 'package:easy_localization/easy_localization.dart';
import '../../constants/lang_keys.dart';

class FormValidation {
  static String? getRequiredFieldErrorMessage(String field) {
    if (field.trim().isEmpty) {
      return LangKeys.fieldRequired.tr();
    }
    return null;
  }

  static String? getEmailErrorMessage(String email) {
    final requiredFieldError = getRequiredFieldErrorMessage(email);
    if (requiredFieldError != null) {
      return requiredFieldError;
    }

    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*(\+[\w-]+)?@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (!emailRegExp.hasMatch(email)) {
      return LangKeys.validEmail.tr();
    }

    return null;
  }

  static String? getNameErrorMessage(String name) {
    final requiredFieldError = getRequiredFieldErrorMessage(name);
    if (requiredFieldError != null) {
      return requiredFieldError;
    }

    final nameRegExp = RegExp(r'^[a-zA-Z]+(([,\.\- ][a-zA-Z ])?[a-zA-Z]*)*$');
    if (!nameRegExp.hasMatch(name)) {
      return LangKeys.validName.tr();
    }

    return null;
  }

  static String? getPasswordErrorMessage(String password) {
    final requiredFieldError = getRequiredFieldErrorMessage(password);
    if (requiredFieldError != null) {
      return requiredFieldError;
    }

    if (password.length < 8) {
      return LangKeys.passwordShort.tr();
    }
    return null;
  }

  static String? getPasswordMatchingErrorMessage(String password, String retypedPassword) {
    final requiredFieldError = getRequiredFieldErrorMessage(retypedPassword);
    if (requiredFieldError != null) {
      return requiredFieldError;
    }

    if (retypedPassword != password) {
      return LangKeys.passwordNotMatched.tr();
    }
    return null;
  }
}
