import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:chat_beeper/Widgets/app_drawer.dart';
import 'package:chat_beeper/Widgets/tour_card.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dm.dart';
import '../drawer_pages/follower_request.dart';
import '../drawer_pages/request_verification.dart';
import '../drawer_pages/saved_beeps.dart';
import '../drawer_pages/trending.dart';
import '../followers.dart';
import '../following.dart';
import '../profile_page.dart';

import '../../Widgets/comment.dart';
import '../../Widgets/sponsored_tour_card.dart';
import 'dm.dart';

class TourPage extends StatefulWidget {
  const TourPage({Key? key}) : super(key: key);
  static const String id = 'Tour-page';

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  late List<TourImage> images;
  late TourImage displayImage;
  String fullName = 'Jane Doe';
  bool _itemtapped = false;
  @override
  void initState() {
    images = [
      TourImage(
          url:
              'https://images.unsplash.com/photo-1657299141984-dd9196274cde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
          id: 'i001'),
      TourImage(
          url:
              'https://images.unsplash.com/photo-1659536540455-161b929e650c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
          id: 'i002'),
      TourImage(
          url:
              'https://images.unsplash.com/photo-1657299170111-371dabe2e60d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
          id: 'i003'),
      TourImage(
          url:
              'https://images.unsplash.com/photo-1657299170111-371dabe2e60d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
          id: 'i004'),
      TourImage(
          url:
              'https://images.unsplash.com/photo-1659536540455-161b929e650c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
          id: 'i005'),
    ];
    displayImage = images[0];
    super.initState();
  }

  String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String FullName = 'Sarah Madini';
  String username = 'Janedoe_10';
  String posttime = '1 hour ago';
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(428.w, 62.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: uColor, style: BorderStyle.solid))),
          child: SafeArea(
            child: AppBar(
              leading: Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  height: 28.h,
                  child: GestureDetector(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0.r),
                        child: Image.asset('images/pp_round.png'),
                      ),
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 7),
                child: SizedBox(
                    height: 34.h,
                    // width: 159.w,
                    child: SvgPicture.asset(
                      'images/chatbeeper_blue.svg',
                    )),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.5,
              actions: [
                // SizedBox(width: 12.w,),
                Padding(
                  padding: EdgeInsets.only(top: 28.h, right: 20.w, bottom: 5.h),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => DirectMessage()));
                    },
                    child: darkModeOn == false
                        ? SvgPicture.asset(
                            color: Colors.black,
                            'images/search.svg',
                          )
                        : SvgPicture.asset(
                            color: Colors.white,
                            'images/search_dark.svg',
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.h, right: 14.w, bottom: 5.h),
                  child: SizedBox(
                    height: 28.h,
                    width: 28.h,
                    child: Transform.scale(
                      scale: 1.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DirectMessage()));
                        },
                        child: darkModeOn == false
                            ? SvgPicture.asset(
                                color: Colors.black,
                                'images/Dm.svg',
                              )
                            : SvgPicture.asset(
                                color: Colors.white,
                                'images/sms.svg',
                              ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 800.h,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: const [TourCard(), SponsoredTourCard()],
                );
              },
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      key: _key,
    );
  }
}

class TourImage {
  String id, url;
  TourImage({
    required this.url,
    required this.id,
  });
}
