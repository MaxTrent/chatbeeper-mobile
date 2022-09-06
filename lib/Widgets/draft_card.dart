import 'package:chat_beeper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
class Draftcard extends StatelessWidget {
  const Draftcard({Key? key}) : super(key: key);

  final String fullName = 'Jane Doe';
  final String username = 'Janedoe_10';
  final String loremIpsum ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: uColor)
          )
        ),
        child: Column(
          children: [
            SizedBox(height: 25.h,),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: 14.h),
                  child: SizedBox(
                    height: 100.h, width: 275.w,
                    child: ReadMoreText(
                      loremIpsum,
                      textAlign: TextAlign.left,
                      trimLines: 2,
                      trimLength: 160,
                      trimExpandedText: 'see Less',
                      trimCollapsedText: 'see more',
                      colorClickableText: Colors.grey,
                      style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),

                    ),
                  ),
                ),
                const Spacer(),
                Image.asset('images/pic.png', height: 60.h,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
