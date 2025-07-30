import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEventButton extends StatelessWidget {
  const CustomEventButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.hieght,
    this.textColr,
    this.textStyle,
    this.color,
    this.borderRadius,
    this.showGradiant = true,
    this.outlineBorder = false,
    this.outlineBorderClr,
    this.padding,
    this.margin,
    this.clr,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? hieght;
  final Color? textColr;
  final Gradient? color;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool showGradiant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? outlineBorderClr;
  final bool outlineBorder;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        width: width ?? 150,
        height: hieght ?? 45,
        decoration: BoxDecoration(
          border:
              outlineBorder
                  ? Border.all(color: outlineBorderClr ?? kblack)
                  : null,
          gradient: showGradiant ? (color) : null,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 25)),
          color: clr ?? Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Center(
          child: Text(
            text,
            style:
                textStyle ??
                Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: textColr ?? kblack,
                  fontSize: 14,
                ),
          ),
        ),
      ),
    );
  }
}
