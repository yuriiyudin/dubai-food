import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_dubai/core/constants/app_assets.dart';
import 'package:test_dubai/core/constants/app_colors.dart';
import 'package:test_dubai/core/router/go_router.dart';
import 'package:test_dubai/features/auth/presentation/widgets/email_or_phone_text_fieild_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(AppAssets.loginBg, fit: BoxFit.cover),
            SafeArea(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    children: [
                      SizedBox(height: 61.h),
                      SvgPicture.asset(AppAssets.brandLogo),
                      SizedBox(height: 20.h),
                      Text('Food & Beverage', style: textStyle.titleMedium!.copyWith(fontWeight: FontWeight.w700)),
                      SizedBox(height: 10.h),
                      Text(
                        'OASIS',
                        style: textStyle.displayMedium!.copyWith(fontWeight: FontWeight.w700, letterSpacing: 3),
                      ),
                      SizedBox(height: 76.h),
                      Align(alignment: Alignment.centerLeft, child: Text('Email or Phone number:')),
                      SizedBox(height: 10.h),
                      // Email phone field
                      EmainOrPhoneNumberTextField(controller: _controller),
                      SizedBox(height: 20.h),
                      // Sign in button
                      ElevatedButton(
                        onPressed: () {
                          // TODO: sign in logic
                          if (_formKey.currentState!.validate()) {
                            context.goNamed(AppRoutes.checkOtp.name, extra: _controller.text);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          textStyle: textStyle.bodyLarge,
                          minimumSize: Size(double.infinity, 65.h),
                        ),
                        child: Text('Login', style: textStyle.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(height: 76.h),
                      // new account, forget password, bio sign in
                      Table(
                        columnWidths: {0: IntrinsicColumnWidth(), 1: FlexColumnWidth()},
                        border: TableBorder.all(
                          width: 0.3.w,
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        children: <TableRow>[
                          TableRow(
                            children: [
                              Padding(padding: EdgeInsets.all(10), child: SvgPicture.asset(AppAssets.icNewAccount)),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: GestureDetector(
                                    child: Text('New account Registration', textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(padding: EdgeInsets.all(10), child: SvgPicture.asset(AppAssets.icForgetPassword)),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: GestureDetector(child: Text('I can\'t log in', textAlign: TextAlign.center)),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(padding: EdgeInsets.all(10), child: SvgPicture.asset(AppAssets.icBio)),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: GestureDetector(child: Text('Biometric Login', textAlign: TextAlign.center)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
