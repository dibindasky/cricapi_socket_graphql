import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<bool?> showExitDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          elevation: 0,
          surfaceTintColor: kblack,
          backgroundColor: kwhite,
          titleTextStyle: Theme.of(context).textTheme.displayMedium,
          contentTextStyle: Theme.of(context).textTheme.displaySmall,
          shadowColor: kblack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Exit From New Mika',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontSize: 16),
          ),
          content: Text(
            'Are you sure you want to exit the app ?',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(),
          ),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 20),
                elevation: 0,
                backgroundColor: kwhite,
                foregroundColor: knill,
                surfaceTintColor: knill,
                side: const BorderSide(color: kprimary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
              ),
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: kprimary,
                  fontSize: 13.sp,
                ),
              ),
            ),
            // adjustWidth(10.w),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                SystemNavigator.pop(); // Exit app
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 20),
                elevation: 0,
                backgroundColor: kprimary,
                foregroundColor: knill,
                surfaceTintColor: knill,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
              ),
              child: Text(
                'Exit',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 13.sp),
              ),
            ),
          ],
        ),
  );
}

class CustomConfirmationDialog extends StatelessWidget {
  final String message;
  final String cancelText;
  final String confirmText;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const CustomConfirmationDialog({
    super.key,
    required this.message,
    required this.cancelText,
    required this.confirmText,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.14)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontSize: 15.sp),
            ),
            adjustHieght(23.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kwhite,
                      foregroundColor: knill,
                      surfaceTintColor: knill,
                      side: const BorderSide(color: kprimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: kprimary,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ),
                adjustWidth(10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kprimary,
                      foregroundColor: knill,
                      surfaceTintColor: knill,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: Text(
                      confirmText,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontSize: 13.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
