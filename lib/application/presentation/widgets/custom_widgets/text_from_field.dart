import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:distinct_assignment/core/utils/validators/text_field_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool obscureText;
  final VoidCallback? function;
  final VoidCallback? onTapOutside;
  final int? maxlegth;
  final double? height;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Color? clr;
  final Function(String value)? onChanaged;
  final Function(String? value)? onSubmitted;
  final VoidCallback? onTap;
  final TextEditingController? password;
  final FocusNode? focusNode;
  final bool showUnderline;
  final Validate validate;
  final TextCapitalization textCapitalization;
  final bool enabled;
  final double textSize;
  final double? padding;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  const CustomTextFormField({
    super.key,
    this.padding,
    this.inputFormatters,
    this.enabled = true,
    this.prefix,
    this.onSubmitted,
    this.validate = Validate.none,
    this.password,
    this.showUnderline = false,
    this.clr,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.inputType = TextInputType.name,
    this.obscureText = false,
    this.maxlegth,
    this.height,
    this.maxLines,
    this.function,
    this.onTap,
    this.onChanaged,
    this.focusNode,
    this.hintText,
    this.textSize = 0.033,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onTapOutside,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  // final FocusNode _focusNode = FocusNode();

  bool showEye = false;

  @override
  void initState() {
    super.initState();
    showEye = widget.obscureText;
    // _focusNode.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding ?? 0),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        autofocus: false,
        onTapOutside: (event) {
          if (widget.onTapOutside != null) {
            widget.onTapOutside!();
          }
        },
        enabled: widget.enabled,
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        textCapitalization: widget.textCapitalization,
        maxLines: widget.maxLines ?? 1,
        style: Theme.of(context).textTheme.displaySmall,
        maxLength: widget.maxlegth,
        onChanged: widget.onChanaged,
        autovalidateMode: widget.autovalidateMode,
        onSaved: widget.onSubmitted,
        obscureText: showEye,
        controller: widget.controller,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          suffixIcon:
              widget.obscureText
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        showEye = !showEye;
                      });
                    },
                    icon: Icon(showEye ? Iconsax.eye_slash : Iconsax.eye),
                  )
                  : widget.suffixIcon,
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon,
          filled: true,
          hintText: widget.hintText,
          errorMaxLines: 3,
          hintStyle: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(color: kgrey),
          labelText: widget.hintText != null ? null : widget.labelText,
          labelStyle: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(color: kgrey),
          border:
              widget.showUnderline
                  ? UnderlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(7),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kgrey.withOpacity(0.3)),
                  ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kprimary, width: 1),
          ),
          errorBorder:
              widget.showUnderline
                  ? UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kred, width: 1),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kred, width: 1),
                  ),
          focusedErrorBorder:
              widget.showUnderline
                  ? UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kred, width: 1),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kred, width: 1),
                  ),
          enabledBorder:
              widget.showUnderline
                  ? const UnderlineInputBorder(
                    borderSide: BorderSide(color: kgrey),
                  )
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kgrey.withOpacity(0.3)),
                  ),
        ),
        validator: (value) {
          return ValidationTextField.validateTextField(
            validate: widget.validate,
            labelText: widget.labelText,
            value: value,
            password: widget.password?.text,
          );
        },
      ),
    );
  }
}
