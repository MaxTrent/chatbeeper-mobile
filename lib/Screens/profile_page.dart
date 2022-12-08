import 'dart:convert';

import 'package:chat_beeper/Widgets/image_slider.dart';
import 'package:chat_beeper/Widgets/profile_tab.dart';
import 'package:chat_beeper/Widgets/user_post_card.dart';
import 'package:chat_beeper/data/secure_storage.dart';
import 'package:chat_beeper/model/profile_model.dart';
import 'package:chat_beeper/provider/profile_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../Widgets/Post.dart';
import '../Widgets/post_imageless.dart';
import '../Widgets/user_post_imageless.dart';
import '../constants.dart';
import 'package:http/http.dart' as http;

import '../data/api_services.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height); //point 1
    path.quadraticBezierTo(
        size.width * 0.5, //2
        size.height - 50, //3
        size.width,
        size.height //4
        );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String id = 'profile';
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  String fullName = 'Jane Doe';
  String username = 'Janedoe_10';

  String location = 'Lagos, Nigeria';
  String biollink = 'https://behance.net/janedoe';
  String bio =
      'Hi there, I’m a product design who loves solving real life problems with my superpower 😁';
  var bgPictureUrl = 'images/tlimage1.png';
  var profilePictureUrl = 'images/pp_round.png';
  bool _onTap = false;
  int _selectedButton = 0;
  final formKey = GlobalKey<FormState>();
  late TabController _tabcontroller;

  String? text;
  var fetchProfile;


  @override
  void initState() {
    super.initState();
    fetchProfileCall();
  }

 Future<void> fetchProfileCall() async {
    fetchProfile = await getProfile();
    print('This is the profile response $fetchProfile');
  }

  @override
  Widget build(BuildContext context) {
    _tabcontroller = TabController(length: 3, vsync: this);
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    return SafeArea(
        child: Form(
            key: formKey,
            child: Scaffold(
                appBar: null,
                // appBar: AppBar(
                //    title: Text('Anything'),
                //    shape: const RoundedRectangleBorder(
                //      borderRadius: BorderRadius.horizontal(
                //        left: Radius.circular(30),
                //      ),
                //    ),
                //  ),
                body: FutureBuilder<GetProfileModel?>(
                  future: getProfile(),
                  builder: (context, snapshot) => Center(
                    child: CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          //leading: null,
                          floating: true,
                          automaticallyImplyLeading: false,
                          expandedHeight: 590.h,
                          pinned: false,
                          flexibleSpace: FlexibleSpaceBar(
                            titlePadding: EdgeInsets.zero,
                            title: Container(
                              child: Wrap(
                                children: [
                                  Column(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 95.h,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(30.r),
                                                      bottomRight:
                                                          Radius.circular(30.r),
                                                      topRight:
                                                          Radius.circular(-10.r)),
                                                  image: DecorationImage(
                                                    image:
                                                        AssetImage(bgPictureUrl),
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                          ), //background
                                          Positioned(
                                            top: 45.h,
                                            left: 1.w,
                                            right: 0.w,
                                            child: Center(
                                              child: Container(
                                                height: 80.h,
                                                width: 75.w,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                                  // ),
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: Theme.of(
                                                          context)
                                                      .scaffoldBackgroundColor,
                                                  child: Image.asset(
                                                    profilePictureUrl,
                                                    width: 68.w,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ), //image
                                          Align(
                                            alignment: Alignment(1, -1),
                                            child: PopupMenuButton<int>(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.r))),
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              icon: Icon(
                                                Icons.more_horiz_sharp,
                                                size: 30.h,
                                                color: Colors.white,
                                              ),
                                              iconSize: 24.h,
                                              itemBuilder: (context) => [
                                                PopupMenuItem(padding: EdgeInsets.only(left: 10.w),
                                                  value: 1,
                                                  // row has two child icon and text.
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                          height: 24.h,
                                                          width: 24.w,
                                                          child: darkModeOn ==
                                                                  false
                                                              ? SvgPicture.asset(
                                                                  'images/info.svg')
                                                              : SvgPicture
                                                                  .asset(
                                                                  'images/info.svg',
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                      SizedBox(width: 10.w,),
                                                      Text(
                                                        "About",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 22.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: darkModeOn
                                                                ? Colors.white
                                                                : Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                ), //about
                                                PopupMenuItem(
                                                  value: 2,
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  // row has two child icon and text.
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                          height: 24.h,
                                                          width: 24.w,
                                                          child: darkModeOn ==
                                                                  false
                                                              ? SvgPicture.asset(
                                                                  'images/block.svg')
                                                              : SvgPicture
                                                                  .asset(
                                                                  'images/block.svg',
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        "Block User",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 22.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: darkModeOn
                                                                ? Colors.white
                                                                : Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                ), //block
                                                PopupMenuItem(
                                                  value: 3,
                                                  padding: EdgeInsets.only(
                                                      left: 10.w),
                                                  // row has two child icon and text.
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      darkModeOn == false
                                                          ? SvgPicture.asset(
                                                              'images/report profile.svg')
                                                          : SvgPicture.asset(
                                                              'images/report profile.svg',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      SizedBox(
                                                        width: 10.w,
                                                      ),
                                                      Text(
                                                        "Report Account",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Nunito',
                                                            fontSize: 22.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: darkModeOn
                                                                ? Colors.white
                                                                : Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                ), //report
                                              ],
                                              offset: Offset(-4.w, 30.h),
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              elevation: 2,
                                            ),
                                          ), //menu
                                          Align(
                                                alignment: Alignment(-1, -0.8),
                                              child: IconButton(onPressed: (){
                                                Navigator.of(context).pop();
                                              }, icon:Icon(
                                                Icons.arrow_back_ios_new,
                                                size: 19.h,
                                                color: Colors.white,)),
                                              ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 40.h,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.hasData
                                                    ? '${snapshot.data!.firstname!} ${snapshot.data!.lastname!}'
                                                    : '${snapshot.error}',
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: bcolor3,
                                                        fontSize: 16.sp),
                                              ), //full name
                                              SizedBox(height: 2.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    snapshot.hasData
                                                        ? snapshot
                                                            .data!.username!
                                                        : '${snapshot.error}',
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: fColor2,
                                                        fontSize: 15.sp),
                                                  ),
                                                  Icon(
                                                    Icons.verified_rounded,
                                                    color: bcolor5,
                                                    size: 15.h,
                                                  ),
                                                ],
                                              ), //username
                                              SizedBox(height: 2.h),
                                              Container(
                                                height: 20.h,
                                                width: 80.w,
                                                color: Colors.grey.shade300,
                                                child: Center(
                                                    child: Text(
                                                 'Follows you',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.black,
                                                    fontFamily: 'Nunito',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                              ),//follows you
                                              SizedBox(height: 10.h,),
                                              Padding(
                                                padding:  EdgeInsets.only(left: 52.w, right: 52.w, bottom: 14.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 324.w,
                                                      child: RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text: TextSpan(
                                                            text: '',
                                                            children: [
                                                              TextSpan(
                                                                text: bio,
                                                                style: Theme.of(
                                                                        context)
                                                                    .primaryTextTheme
                                                                    .bodyText1!
                                                                    .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          13.sp,
                                                                    ),
                                                              ),
                                                            ]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //bio
                                              Container(
                                                height: 0.5.h,
                                                width: 500.w,
                                                color: fColor2,
                                              ), //divider
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              SizedBox(
                                                height: 50.h, width: 255.w,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.center,
                                                  // crossAxisAlignment:
                                                  //     CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:  EdgeInsets.only(top: 8.h),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            '800',
                                                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                                                  fontWeight: FontWeight.w600, fontSize: 14.sp,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Following',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              color: fColor2,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ), //following
                                                    Container(
                                                      height: 30.h,
                                                      color: fColor2,
                                                      width: 1,
                                                    ),
                                                    Padding(
                                                      padding:  EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            '800',
                                                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                                              fontWeight: FontWeight.w600, fontSize: 14.sp,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Followers',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Nunito',
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color: fColor2,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ), //followers
                                                    Container(
                                                      height: 30.h,
                                                      color: fColor2,
                                                     width: 1.w,
                                                    ),
                                                    Padding(
                                                      padding:  EdgeInsets.only(top: 7.h, left: 3.w),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                              height: 18.h,
                                                              width: 18.w,
                                                              child:
                                                                  SvgPicture.asset(
                                                                'images/location.svg',
                                                                color: darkModeOn
                                                                    ? Colors.white
                                                                    : Colors.black,
                                                              )),
                                                          Text(
                                                            location,
                                                            style: TextStyle(
                                                              fontFamily: 'Nunito',
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              color: fColor2,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ), //location
                                                  ],
                                                ),
                                              ), //following followers location
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      height: 18.h,
                                                      width: 18.h,
                                                      child: SvgPicture.asset(
                                                          'images/link-2.svg')),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: '',
                                                        children: [
                                                          TextSpan(
                                                            text: biollink,
                                                            style: TextStyle(
                                                                color: bcolor3,
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Nunito'),
                                                            recognizer:
                                                                TapGestureRecognizer()
                                                                  ..onTap = () =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .push(
                                                                        MaterialPageRoute(
                                                                          builder:
                                                                              (context) =>
                                                                                  const Profile(),
                                                                        ),
                                                                      ),
                                                          ),
                                                        ]),
                                                  ),
                                                ],
                                              ), //bio link
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 30.h,
                                                    width: 120.w,
                                                    child: TextButton(
                                                      style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all(Colors.transparent),

                                                          // elevation: ,
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r),
                                                                side: const BorderSide(color: bcolor3),))),
                                                      onPressed: () {
                                                        Navigator.pushReplacement(context, MaterialPageRoute(
                                                            builder: (context) => const ProfileTab()));
                                                      },
                                                      child: darkModeOn == false
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Edit profile',
                                                                  textAlign: TextAlign.center,
                                                                  style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                                                      fontSize: 12.sp, fontWeight: FontWeight.w600),
                                                                ),
                                                                SizedBox(width: 4.w,),
                                                                SizedBox(
                                                                    height: 18.h,
                                                                    width: 18.w,
                                                                    child: darkModeOn
                                                                        ? SvgPicture.asset(
                                                                            'images/edit.svg')
                                                                        : SvgPicture.asset(
                                                                            'images/edit black.svg'))
                                                              ],
                                                            ) :
                                                       Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                  Center(
                                                                    child: Text(
                                                                      'Follow',
                                                                      textAlign:
                                                                      TextAlign.center,
                                                                      style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                                                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 2.w,),
                                                                  SizedBox(
                                                                      height: 13.h,
                                                                      child: darkModeOn
                                                                          ? SvgPicture.asset('images/plus.svg')
                                                                          : SvgPicture.asset('images/plus black.svg')),
                                                                ]),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  Center(child: darkModeOn ? Container(
                                                            height: 40.h,
                                                            width: 40.w,
                                                            decoration: BoxDecoration(
                                                                color: Colors.transparent,
                                                                shape: BoxShape.circle,
                                                                border: Border.all(color: bcolor3)
                                                                // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                                                // ),
                                                                ),
                                                            child: Center(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {},
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'images/sms blue.svg'),
                                                              ),
                                                            ),
                                                          ) : null,
                                                  ),
                                                ],
                                              ), //edit profile and dm
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverFillRemaining(
                            child: Wrap(
                          children: [
                            Column(children: [
                              Padding(
                                padding: EdgeInsets.only(right: 15.h, top: 7.h),
                                child: SizedBox(
                                  width: 344.w,
                                  child: TabBar(
                                    splashFactory: NoSplash.splashFactory,
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                    indicatorColor: Colors.transparent,
                                    labelColor: fColor,
                                    labelPadding: EdgeInsets.zero,
                                    unselectedLabelColor: fColor2,
                                    labelStyle: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 25.sp,
                                            fontWeight: FontWeight.w400,
                                            color: fColor),
                                    unselectedLabelStyle: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w400,
                                            color: fColor2),
                                    controller: _tabcontroller,
                                    tabs: [
                                      Container(
                                        height: 36.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(color: fColor2),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.r)),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Beeps',
                                        )),
                                      ),
                                      Container(
                                          height: 36.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border.all(color: fColor2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.r)),
                                          ),
                                          child: const Center(
                                              child: Text('Pictures'))),
                                      Container(
                                          height: 36.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            border: Border.all(color: fColor2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100.r)),
                                          ),
                                          child: const Center(
                                              child: Text('Videos'))),
                                    ],
                                  ),
                                ),
                              ), //tapbar
                              SizedBox(
                                height: 16.h,
                              ),
                              Divider(
                                color: darkModeOn == false
                                    ? Color(0xff8E8E8E)
                                    : bcolor1,
                                height: 1.h,
                              ),
                              SizedBox(
                                height: height,
                                width: width,
                                child: TabBarView(
                                  controller: _tabcontroller,
                                  children: [
                                    SizedBox(
                                      height: 500.h,
                                      child: ListView.builder(
                                        itemCount: 10,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return UserPostBeep();
                                        },
                                      ),
                                    ), //beeps
                                    SizedBox(
                                      height: height,
                                      child: ListView.builder(
                                        itemCount: 10,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return UserPost();
                                        },
                                      ),
                                    ), //images
                                    SizedBox(
                                      height: height,
                                      child: ListView.builder(
                                        itemCount: 10,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return UserPost();
                                        },
                                      ),
                                    ), //videos
                                  ],
                                ),
                              ), //tabview],
                            ]),
                          ],
                        ))//bottom
                      ],
                    ),
                  ),

                ),
            ),
        ),
    );
  }
}
