import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:test_dubai/core/constants/app_colors.dart';

class CheckOtpScreen extends StatefulWidget {
  const CheckOtpScreen({super.key, required this.contact});
  final String contact;

  @override
  State<CheckOtpScreen> createState() => _CheckOtpScreenState();
}

class _CheckOtpScreenState extends State<CheckOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Login confirmation'), iconTheme: IconThemeData(color: AppColors.blue)),
      body: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                'Authorization code',
                style: textStyle.titleLarge!.copyWith(color: AppColors.greyMainText, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 12.h),
              Text(
                'Enter the code from the sms we sent to ',
                style: textStyle.bodyMedium!.copyWith(color: AppColors.greyMainText.withOpacity(0.6)),
              ),
              Text(
                widget.contact.isEmpty ? '' : widget.contact,
                style: textStyle.bodyMedium!.copyWith(color: AppColors.greyMainText),
              ),
              SizedBox(height: 63.h),
              Center(child: Pinput(length: 5, defaultPinTheme: defaultPinTheme)),
              SizedBox(height: 30.h),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: AppColors.lightBlue,
                      minimumSize: Size(184.w, 65.h),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Back '),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: AppColors.greyButton,
                      minimumSize: Size(184.w, 65.h),
                    ),
                    onPressed: () {
                      //TODO: auth logic
                    },
                    child: Text(
                      'Submit ',
                      style: textStyle.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.greyMainText.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 63.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '02:32',
                    style: textStyle.bodyMedium!.copyWith(
                      color: AppColors.greyMainText.withOpacity(0.6),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'I didn\'t receive any code.',
                        style: textStyle.bodyMedium!.copyWith(color: AppColors.greyMainText),
                      ),
                      TextButton(
                        onPressed: () {
                          //TODO: resend code
                        },
                        child: Text('RESEND'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 65.w,
  height: 87.h,
  textStyle: GoogleFonts.onest(fontSize: 21, color: AppColors.greyMainText, fontWeight: FontWeight.w300),
  decoration: BoxDecoration(border: Border.all(color: AppColors.blue), borderRadius: BorderRadius.circular(20)),
);
