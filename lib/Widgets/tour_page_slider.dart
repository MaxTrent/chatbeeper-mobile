import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';


final List<String> imgList = [
  'images/tlimage1.png',
  'images/pic.png',
  'images/pic1.png',
  'images/tlimage1.png',
  'images/tlimage1.png',
];

class TourSlider extends StatefulWidget {
  const TourSlider({Key? key}) : super(key: key);

  @override
  State<TourSlider> createState() => _TourSliderState();
}

class _TourSliderState extends State<TourSlider> {
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
    var  width = MediaQuery.of(context).size.width;
    return Builder(
      builder: (context) {
        final double height = MediaQuery.of(context).size.height;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(child:  CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                  height: 486.h,
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
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                        height: height,
                      )))
                  .toList(),
            ),),
            Positioned(
              top: 400.h,
              left: 85.w,
              // bottom: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 48.0.w,
                      height: 48.0.h,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration:  BoxDecoration(
                          shape: BoxShape.rectangle,

                          color: (Theme.of(context).brightness == Brightness.dark
                              ? bcolor3
                              : bcolor3)
                              .withOpacity(_current == entry.key ? 0.9 : 0.2)

                      ),
                      // child: ,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
