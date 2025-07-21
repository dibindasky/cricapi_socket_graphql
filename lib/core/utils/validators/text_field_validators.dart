import 'package:distinct_assignment/core/utils/const.dart';
import 'package:distinct_assignment/core/utils/validators/validation_functions.dart';

class ValidationTextField {
  static String? validateTextField({
    required Validate validate,
    required String labelText,
    required String? value,
    String? password,
  }) {
    switch (validate) {
      case Validate.none:
        return null;

      case Validate.notNull:
        if (value == null || value.isEmpty) {
          if (value == 'Content' && value!.length < 20) {
            return 'Content must be at least 20 characters';
          } else if (labelText == '') {
            return 'Enter $labelText';
          }
          return 'ⓘ Please enter $labelText';
        }
        break;

      case Validate.phone:
        if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
          return 'ⓘ Enter valid phone number (numeric characters only)';
        } else if (value.length != 10) {
          return 'ⓘ Phone number should have exactly 10 digits';
        }
        break;
      case Validate.email:
        if (!isValidEmail(value!)) {
          return 'ⓘ Please enter a valid email address';
        }
        break;

      default:
        if (value == 'Content' && value!.length < 20) {
          return 'ⓘ Content must be at least 20 characters';
        }
    }
    return null;
  }
}
