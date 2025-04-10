import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_dubai/core/constants/app_colors.dart';

class EmainOrPhoneNumberTextField extends StatelessWidget {
  const EmainOrPhoneNumberTextField({super.key, required TextEditingController controller}) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   if (_controller.text.isEmpty) {
      //     return '';
      //   } else {
      //     return null;
      //   }
      // },
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.greyMainText),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: _controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 18.h),
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
