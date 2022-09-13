import 'package:chat_beeper/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<String> imgList = [
  'images/tlimage1.png',
  'images/tlimage1.png',
  'images/tlimage1.png',
  'images/tlimage1.png',
  'images/tlimage1.png',
];

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImageSliderState();
  }
}

class _ImageSliderState extends State<ImageSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
    child: Center(
        child: Image.asset(
          item,
          fit: BoxFit.cover,
          height: 333.h,
        )),
  ))
      .toList();


  @override
  Widget build(BuildContext context) {
    var  width = MediaQuery.of(context).size.width;
    ScreenUtil.init(
      context,
      designSize:const Size(485,926),
    );
    return Container(
      child: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return Column(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: width,
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
                    .map((item) => Container(
                  child: Center(
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        height: height,
                      )),
                ))
                    .toList(),
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
                              .withOpacity(_current == entry.key ? 0.9 : 0.2)),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}