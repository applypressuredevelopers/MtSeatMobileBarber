import 'package:barber_app/src/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_textstyles.dart';
import '../../../utils/color.dart';
import '../../../utils/images.dart';
import '../../widgets/backgroud_image.dart';
import '../../widgets/bottom_sheet.dart';
import 'components/big_image_screen.dart';
import 'components/post_box.dart';
import 'controller/my_post_controller.dart';

class MyPostScreen extends StatelessWidget {
  MyPostScreen({Key? key}) : super(key: key);

  final MyPostController postController = Get.put(MyPostController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BackgroundImage(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: const CustomBottomSheet(),
        backgroundColor: Colors.transparent,
        /// app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Appnavigation().pop(context);
            },
            icon: Image.asset(AppImages.backArrow),
          ),
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            'My Posts',
            style: AppTextStyles.ubuntuRegular.copyWith(
              color: AppColors.whiteColor,
              fontSize: 20.0,
            ),
          ),
        ),
        /// body
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                height: 50.0,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.0),
                  border: Border.all(
                    color: AppColors.orangeMainColor,
                    width: 1.0,
                  ),
                ),
                child: TextFormField(
                  style: AppTextStyles.ubuntuRegular.copyWith(
                    color: AppColors.whiteColor,
                    fontSize: 12.0,
                  ),
                  controller: postController.writeMsgController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 16.0),
                    border: InputBorder.none,
                    hintText: 'Write Something.....',
                    hintStyle: AppTextStyles.ubuntuRegular.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),

            /// post button
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4.0),
                  child: Ink(
                    width: 70.0,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppColors.orangeMainColor,
                    ),
                    child: Center(
                      child: Text(
                        'Post',
                        style: AppTextStyles.ubuntuRegular.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// add image button
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(4.0),
                  child: Ink(
                    width: 70.0,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppColors.orangeMainColor,
                    ),
                    child: Center(
                      child: Text(
                        'Add Image',
                        style: AppTextStyles.ubuntuRegular.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8.0),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  children: [
                    Obx(
                      () => PostBox(
                        imagePath: AppImages.userImage,
                        nameText: 'Ray Buttonship',
                        lastSeenText: '45 Minutes Ago',
                        postText: 'Sample post was made here for UI testing.',
                        onTap: postController.isLikedFun,
                        likeIconPath: postController.isLiked.value
                            ? AppImages.likedIcon
                            : AppImages.likeIcon,
                      ),
                    ),
                    Obx(
                      () => PostBox(
                        imagePath: AppImages.userImage,
                        nameText: 'Gal Gadot',
                        lastSeenText: '',
                        postText: 'Sample post was made here for UI design.',
                        onTap: postController.isLikedOneFun,
                        likeIconPath: postController.isLikedOne.value
                            ? AppImages.likedIcon
                            : AppImages.likeIcon,
                      ),
                    ),
                    const SizedBox(height: 14.0),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 52.0,
                            width: 52.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(AppImages.userImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(width: 9.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                /// name text
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Henry Namegoeshere',
                                    style: AppTextStyles.ubuntuRegular.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),

                                /// time text
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    '45 Minutes Ago',
                                    style: AppTextStyles.ubuntuRegular.copyWith(
                                      color: AppColors.greyLightColor,
                                      fontSize: 6.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),

                                /// scope text
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Hair Specialist',
                                    style: AppTextStyles.ubuntuRegular.copyWith(
                                      color:
                                          AppColors.whiteColor.withOpacity(0.8),
                                      fontSize: 9.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),

                                /// minutes text
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    '47 Minutes Ago',
                                    style: AppTextStyles.ubuntuRegular.copyWith(
                                      color: AppColors.orangeMainColor,
                                      fontSize: 9.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.more_horiz,
                                      color: AppColors.greyLightColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// post images big
                    SizedBox(
                      height: height * 0.3,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  //Get.to(const BigImageScreen());
                                  Appnavigation().push(const BigImageScreen(), context);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Hero(
                                    tag: 'bigImage',
                                    child: Image.asset(
                                      AppImages.girlBigImageOne,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        //Get.to(const BigImageOneScreen());
                                        Appnavigation().push(const BigImageOneScreen(), context);
                                      },
                                      child: SizedBox(
                                        width: width,
                                        child: Hero(
                                          tag: 'bigImageOne',
                                          child: Image.asset(
                                            AppImages.girlBigImageTwo,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        //Get.to(const BigImageTwoScreen());
                                        Appnavigation().push(const BigImageTwoScreen(), context);
                                      },
                                      child: SizedBox(
                                        width: width,
                                        child: Hero(
                                          tag: 'bigImageTwo',
                                          child: Image.asset(
                                            AppImages.girlBigImageThree,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
