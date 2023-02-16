import 'package:flutter/material.dart';

import '../../utils/app_textstyles.dart';
import '../../utils/color.dart';
import '../res/exports.dart';


class CustomField extends StatelessWidget {
  final String? headingText;
  final String? hintText;
  final Color? borderColor;
  final Color? headingTextColor;
  final Color? hintTextColor;
  final FontStyle? headingFontStyle;
  final Color? fieldTextColor;
  final EdgeInsets? headingTextPadding;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsets? margin;
  final bool? obscureText;
  final bool? isHeadingCenter;

  const CustomField({Key? key,
    required this.controller,
    this.headingText = 'Head Text',
    this.hintText = 'Hint Text',
    this.borderColor = AppColors.blackDarkColor,
    this.headingTextColor = AppColors.blackDarkColor,
    this.headingTextPadding,
    this.headingFontStyle,
    this.keyboardType,
    this.margin,
    this.hintTextColor = AppColors.blackTextColor,
    this.fieldTextColor = AppColors.blackTextColor,
    this.obscureText = false,
    this.isHeadingCenter = false,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: margin ?? const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: headingTextPadding ?? const EdgeInsets.all(0.0),
            child: Align(
              alignment: isHeadingCenter == true ? Alignment.center : Alignment.centerLeft,
              child: Text(headingText!,
                style: AppTextStyles.ubuntuRegular.copyWith(
                  color: headingTextColor,
                  fontSize: 12.0,
                  fontStyle: headingFontStyle ?? FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Container(
            height: 48.0,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(
                color: borderColor ?? AppColors.blackDarkColor,
                width: 1.0,
              ),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText!,
              style: AppTextStyles.ubuntuRegular.copyWith(
                color: fieldTextColor,
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
                hintText: hintText,
                hintStyle: AppTextStyles.ubuntuRegular.copyWith(
                  color: hintTextColor,
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
