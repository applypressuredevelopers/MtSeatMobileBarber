import 'package:flutter/material.dart';

import '../../../../utils/app_textstyles.dart';
import '../../../../utils/color.dart';

class PostBox extends StatelessWidget {
  final String? imagePath;
  final String? nameText;
  final String? lastSeenText;
  final String? postText;
  final Function()? onTap;
  final String? likeIconPath;

  PostBox({Key? key,
    this.imagePath,
    this.nameText = 'Ray Buttonship',
    this.lastSeenText = '45 minutes ago',
    this.postText = 'Sample post was made here for UI testing.',
    this.likeIconPath,
    this.onTap,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 32.0, right: 32.0, top: 24.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          /// name and image row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage(imagePath!),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(nameText!,
                      style: AppTextStyles.ubuntuBold.copyWith(
                        color: AppColors.blackColor,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(lastSeenText!,
                      style: AppTextStyles.ubuntuRegular.copyWith(
                        color: AppColors.greyColor,
                        fontSize: 9.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// post Text
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: width,
              child: Text(
                postText!,
                style: AppTextStyles.ubuntuBold.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 12.0,
                  height: 1.4,
                ),
              ),
            ),
          ),

          /// like and liked icon
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: GestureDetector(
              onTap: onTap,
              child: Image.asset(likeIconPath!,
                height: 15.0,
                width: 15.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
