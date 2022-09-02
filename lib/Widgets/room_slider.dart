import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import '../constants.dart';

import 'package:flutter_svg/flutter_svg.dart';
final List<String> imgList = [
  'images/tlimage1.png',
  'images/pic.png',
  'images/pic1.png',
  'images/tlimage1.png',
  'images/tlimage1.png',
];

class RoomSlider extends StatefulWidget {
  const RoomSlider({Key? key}) : super(key: key);

  @override
  State<RoomSlider> createState() => _RoomSliderState();
}

class _RoomSliderState extends State<RoomSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = imgList
      .map((item) => Center(
          child: Image.asset(
            item,
            fit: BoxFit.cover,
            height: 486.h,
          ))).toList();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize:const Size(485,926),
    );
    return Builder(
      builder: (context) {
        final double height = MediaQuery.of(context).size.height;
        return Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                        height: 456.h,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }
                      // autoPlay: false,
                    ),
                    items: imgList
                        .map((item) => Center(
                        child: Padding(
                          padding:  EdgeInsets.only(left: 16.w, right: 16.w),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            height: 456.h,
                          ),
                        )))
                        .toList(),
                  ),
                ),
                Positioned(
                    top: 387.h,
                    left: 309.w,
                    child: Container(
                      height: 52.h,
                  width: 52.w,
                      alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                )),
                Positioned(
                    top: 401.h,
                    left: 320.w,
                    child: LikeButton(
                      size: 26.67.h,
                      circleColor:
                      CircleColor(start: Colors.red.shade200, end: Colors.red),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.red,
                      ),
                      // likeBuilder: (bool isLiked) {
                      //   return Icon(
                      //     isLiked ==false ?   Icons.favorite_border_outlined: Icons.favorite,
                      //     color: isLiked ? Colors.red : Colors.grey,
                      //     size: 24,
                      //   );
                      // },
                      // likeCount: 100,
                      // countBuilder: (int count, bool isLiked, String text) {
                      //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                      //   Widget result;
                      //   if (count == 0) {
                      //     result = Text(
                      //       "love",
                      //       style: TextStyle(color: color),
                      //     );
                      //   } else
                      //     result = Text(
                      //       text,
                      //       style: TextStyle(color: color),
                      //     );
                      //   return result;
                      // },
                      likeBuilder: (bool isLiked) {
                        return SizedBox(child: isLiked?SvgPicture.asset('images/room like.svg'):SvgPicture.asset('images/favorite_blue.svg'));
                      },
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 16.0.w,
                    height: 4.0.h,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? bcolor3
                            : bcolor3)
                            .withOpacity(_current == entry.key ? 0.9 : 0.1)),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
