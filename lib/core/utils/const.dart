import 'package:flutter/widgets.dart';

const errorMessage = 'something went wrong, please try again';

const appLogo = 'assets/images/logo/dis_logo.png';

// Error Images
const pageNotFoundImg = 'assets/images/page_not_found.png';
const noInternetConnection = 'assets/images/no_internet_connection_img.png';
const emptyImage = 'assets/images/Empty_img.png';
const messageTemplate = 'assets/images/error/message_template.png';
const emptyNotifications = 'assets/images/empty_notifications.png';

enum Validate { phone, email, password, none, notNull }

adjustWidth(double width) {
  return SizedBox(width: width);
}

adjustHieght(double height) {
  return SizedBox(height: height);
}

BorderRadius kBorderRadius6 = BorderRadius.circular(6);
BorderRadius kBorderRadius5 = BorderRadius.circular(5);
BorderRadius kBorderRadius8 = BorderRadius.circular(8);
BorderRadius kBorderRadius12 = BorderRadius.circular(12);
BorderRadius kBorderRadius16 = BorderRadius.circular(16);
BorderRadius kBorderRadius20 = BorderRadius.circular(20);
BorderRadius kBorderRadius10 = BorderRadius.circular(10);

double khieght = 850;
double kwidth = 400;

Duration animationDuration = const Duration(milliseconds: 300);
