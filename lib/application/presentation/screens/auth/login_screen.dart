import 'package:distinct_assignment/application/controller/auth/auth_controller.dart';
import 'package:distinct_assignment/application/presentation/widgets/custom_widgets/event_button.dart';
import 'package:distinct_assignment/application/presentation/widgets/custom_widgets/text_from_field.dart';
import 'package:distinct_assignment/application/presentation/widgets/loading_indecators/loading_animations.dart';
import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:distinct_assignment/core/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ScreenLoginPage extends StatelessWidget {
  const ScreenLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return Form(
                key: controller.formKeyLogin,
                child: Column(
                  children: [
                    adjustHieght(30.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        adjustWidth(30),
                        if (constraints.maxWidth > 800)
                          _imageSection(context, 100),
                        if (constraints.maxWidth > 800) adjustWidth(20),
                        Container(
                          width: 500,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: kBorderRadius10,
                            color: Theme.of(context).colorScheme.onTertiary,
                            boxShadow: [
                              BoxShadow(
                                color:  Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: _loginSection(context, controller),
                        ),
                        adjustWidth(30),
                        // Spacer()
                      ],
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKeyLogin,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      adjustHieght(30.h),
                      _imageSection(context),
                      adjustHieght(20.h),
                      _loginSection(context, controller),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox _imageSection(BuildContext context, [double? width]) {
    return SizedBox(
      width: width ?? 200.w,
      child: Hero(
        tag: appLogo,
        child: Image.asset(
          appLogo,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }

  Column _loginSection(BuildContext context, AuthController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login your account',
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(fontSize: 23),
        ),
        adjustHieght(30.h),
        RichText(
          text: TextSpan(
            text: 'Email Address',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                text: ' *',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: kred,
                ),
              ),
            ],
          ),
        ),
        adjustHieght(3.h),
        CustomTextFormField(
          labelText: '',
          showUnderline: false,
          controller: controller.loginEmailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTapOutside: () => FocusScope.of(context).unfocus(),
          hintText: 'Enter your email',
          validate: Validate.email,
          inputType: TextInputType.emailAddress,
        ),
        adjustHieght(15.h),
        RichText(
          text: TextSpan(
            text: 'Password',
            style: Theme.of(
              context,
            ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                text: ' *',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: kred,
                ),
              ),
            ],
          ),
        ),
        adjustHieght(3.h),
        CustomTextFormField(
          onTapOutside: () => FocusScope.of(context).unfocus(),
          obscureText: true,
          labelText: '',
          controller: controller.loginPasswordController,
          showUnderline: false,
          // validate: Validate.password,
          hintText: 'Enter your password',
          suffixIcon: const Icon(Iconsax.eye_slash),
          inputType: TextInputType.text,
        ),
        adjustHieght(5.h),
        Row(
          children: [
            Obx(
              () => Checkbox(
                checkColor: kwhite,
                side: const BorderSide(width: 1),
                value: controller.saveLoginInfo.value,
                onChanged: (value) {
                  controller.changeRememberMe(value ?? false);
                },
              ),
            ),
            Text(
              'Remember Me',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Text(
                'Forgot Password',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(color: kred),
              ),
            ),
          ],
        ),
        adjustHieght(25.h),
        Obx(
          () =>
              controller.loginLoading.value
                  ? const LoadingAnimation()
                  : CustomEventButton(
                    onTap: controller.login,
                    borderRadius: 10,
                    width: 320.w,
                    textColr: kwhite,
                    color: const LinearGradient(colors: [kprimary, kprimary]),
                    text: 'Login',
                  ),
        ),
        adjustHieght(35.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account?  ',
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(fontSize: 14),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: kprimary,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
