import 'package:flutter/material.dart';

import '../res/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final String? btnText;
  final Color? btnColor;
  final Color? btnFontColor;
  final VoidCallback? onTap;
  final EdgeInsets? btnPadding;

  const CustomButton({Key? key,
    this.width,
    this.height = 48.0,
    this.radius = 9.0,
    this.fontSize = 12.0,
    this.btnText = '',
    this.btnColor = AppColors.blackDarkColor,
    this.btnFontColor = AppColors.whiteColor,
    this.btnPadding,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: btnPadding ?? const EdgeInsets.symmetric(horizontal: 32.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width ?? MediaQuery.of(context).size.width, height!),
          primary: btnColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
        ),
        onPressed: onTap,
        child: Text(btnText!,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: btnFontColor,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}