import 'package:chat_beeper/Widgets/image_slider.dart';
import 'package:chat_beeper/Widgets/profile_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widgets/Post.dart';
import '../Widgets/post_imageless.dart';
import '../constants.dart';

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
  final _formKey = GlobalKey<FormState>();
  late TabController _tabcontroller;
  // @override
  // void initState(){
  //   super.initState();
  //   _tabcontroller = new TabController(length: 3, vsync: this);
  // }
  //
  // @override
  // void dispose(){
  //   super.initState();
  //   _tabcontroller.dispose();
  //   super.dispose();
  // }
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
        key: _formKey,
        child: Scaffold(
          // appBar: AppBar(
          //    title: Text('Anything'),
          //    shape: const RoundedRectangleBorder(
          //      borderRadius: BorderRadius.horizontal(
          //        left: Radius.circular(30),
          //      ),
          //    ),
          //  ),
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child:
                          // ClipPath(
                          //   clipper: CustomClipPath(),
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 92.h,
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage(bgPictureUrl),
                          //         fit: BoxFit.cover,
                          //       )
                          //     ),
                          //   ),
                          // )
                          Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30.r),
                                bottomRight: Radius.circular(30.r),
                                topRight: Radius.circular(-10.r)),
                            image: DecorationImage(
                              image: AssetImage(bgPictureUrl),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ), //background
                    Positioned(
                      top: 45.h,
                      left: 10.w,
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
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              profilePictureUrl,
                              width: 68.w,
                            ),
                          ),
                        ),
                      ),
                    ), //image
                    Positioned(
                      top: 20.h,
                      left: 0.w,
                      right: 410.w,
                      bottom: 50.h,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 19.h,
                          color: Colors.white,
                        ),
                      ),
                    ), //backbutton
                    SizedBox(
                      height: 20.h,
                    ),
                    ),//backbutton
                 Positioned(
                      top: 15.h,
                      left: 410.w,
                      right: 0.w,
                      bottom: 50.h,
                      child: darkModeOn? PopupMenuButton<int>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.r))
                        ),
                        icon: Icon(Icons.more_horiz_sharp, size: 30.h,color: Theme.of(context).colorScheme.secondaryVariant,),
                        iconSize: 24.h,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            // row has two child icon and text.
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 24.h, width: 24.w,
                                    child: darkModeOn == false? SvgPicture.asset('images/info.svg'):SvgPicture.asset('images/info.svg', color: Colors.white,)),
                                SizedBox(width: 10.w,),
                                Text("About",style:  TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),)
                              ],
                            ),
                          ),//about
                          PopupMenuItem(
                            value: 2,
                            // row has two child icon and text.
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 24.h, width: 24.w,
                                    child:darkModeOn == false? SvgPicture.asset('images/block.svg'):SvgPicture.asset('images/block.svg', color: Colors.white,)),
                                SizedBox(width: 10.w,),
                                Text("Block User", style:
                                TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                                )
                              ],
                            ),
                          ),//block
                          PopupMenuItem(
                            value: 3,
                            // row has two child icon and text.
                            child: Row(
                              children: [
                                SizedBox(
                                    height: 24.h, width: 24.w,
                                    child:darkModeOn == false? SvgPicture.asset('images/report profile.svg'):SvgPicture.asset('images/report profile.svg', color: Colors.white,)),
                                SizedBox(width: 10.w,),
                                Text("Report Account", style:
                                TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                                )
                              ],
                            ),
                          ),//report
                        ],
                        offset: Offset(-28.w, 30.h),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        elevation: 2,
                      )
                          :
                      GestureDetector(),
                    ),//backbutton
                    SizedBox(height: 20.h,),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      children: [
                        Text(
                          "\  $fullName\ ",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: bcolor3,
                                  fontSize: 22.sp),
                        ), //full name
                    SizedBox(height: 20.h,),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            "\  $fullName\ ",
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w600, color:bcolor3, fontSize: 22.sp ),
                          ),
                        ),//full name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '@$username',
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                  fontSize: 14.sp),
                            ),
                            Icon(
                              Icons.verified_rounded,
                              color: bcolor5,
                              size: 15.h,
                            ),
                          ],
                        ), //username
                        // SizedBox(height: 5.h,),
                        ),//username
                        Container(
                          height: 15.h, width: 64.w,
                          color: Colors.grey.shade300,
                          child: Center(child: Text('Follows you', style: TextStyle(fontSize: 10.sp, color: Colors.black, fontFamily: 'Nunito', fontWeight: FontWeight.bold,),)),
                        ),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 52.w, right: 52.w, bottom: 14.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 324.w,
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(text: '', children: [
                                    TextSpan(
                                      text: bio,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15.sp,
                                          ),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ), //bio
                        Container(
                          height: 0.5.h,
                          color: Colors.grey,
                        ), //divider
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          height: 40.h,
                          width: 276.w,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '800',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                        ),
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w600,
                                      color: uColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ), //following
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 14.w, bottom: 8.h),
                                child: Container(
                                  height: 30.h,
                                  color: uColor,
                                  width: 1,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 5, left: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      '800',
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.sp,
                                          ),
                                    ),
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                        color: uColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ), //followers
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 14.w, bottom: 13.h),
                                child: Container(
                                  height: 30.h,
                                  color: uColor,
                                  width: 1,
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                      height: 20.h,
                                      width: 20.w,
                                      child: darkModeOn
                                          ? SvgPicture.asset(
                                              'images/location white.svg')
                                          : SvgPicture.asset(
                                              'images/location.svg')),
                                  Text(
                                    location,
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                      color: uColor,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ), //location
                            ],
                          ),
                        ), //following followers location
                        // SizedBox(height:1.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 18.h,
                                width: 18.h,
                                child: SvgPicture.asset('images/link-2.svg')),
                            RichText(
                              text: TextSpan(text: '', children: [
                                TextSpan(
                                  text: biollink,
                                  style: TextStyle(
                                      color: bcolor3,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Nunito'),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Profile(),
                                          ),
                                        ),
                                ),
                              ]),
                            ),
                          ],
                        ), //bio link
                        // SizedBox(height:2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(50.w, 8.h, 8.w, 8.h),
                              child: SizedBox(
                                height: 40.h,
                                width: 130.w,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),

                                      // elevation: ,
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        side: const BorderSide(color: bcolor3),
                                      ))),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProfileTab()));
                                  },
                                  child: darkModeOn == false
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Edit profile',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                              // TextStyle(
                                              //     color: Colors.white,
                                              //     fontWeight: FontWeight.w500,
                                              //     fontFamily: 'Nunito',
                                              //     fontSize: 16.sp
                                              //
                                              // ),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            SizedBox(
                                                height: 18.h,
                                                width: 18.w,
                                                child: darkModeOn
                                                    ? SvgPicture.asset(
                                                        'images/edit.svg')
                                                    : SvgPicture.asset(
                                                        'images/edit black.svg'))
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                              Text(
                                                'Follow',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .primaryTextTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                // TextStyle(
                                                //     color: Colors.white,
                                                //     fontWeight: FontWeight.w500,
                                                //     fontFamily: 'Nunito',
                                                //     fontSize: 16.sp
                                                //
                                                // ),
                                              ),
                                              SizedBox(
                                                width: 8.w,
                                              ),
                                              darkModeOn
                                                  ? SvgPicture.asset(
                                                      'images/plus.svg')
                                                  : SvgPicture.asset(
                                                      'images/plus black.svg'),
                                            ]),
                                  child: darkModeOn == false ?  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Edit profile',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w600),
                                        // TextStyle(
                                        //     color: Colors.white,
                                        //     fontWeight: FontWeight.w500,
                                        //     fontFamily: 'Nunito',
                                        //     fontSize: 16.sp
                                        //
                                        // ),
                                      ),
                                      SizedBox(width: 4.w,),
                                      SizedBox(
                                          height: 18.h,  width: 18.w,
                                          child: darkModeOn? SvgPicture.asset('images/edit.svg'):
                                          SvgPicture.asset('images/edit black.svg')
                                      )
                                    ],
                                  ):
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                        'Follow',
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w600),
                                        // TextStyle(
                                        //     color: Colors.white,
                                        //     fontWeight: FontWeight.w500,
                                        //     fontFamily: 'Nunito',
                                        //     fontSize: 16.sp
                                        //
                                        // ),
                                    ),
                                      ),
                                      SizedBox(width: 2,),
                                      SizedBox(
                                          height: 13.h,
                                          child: darkModeOn? SvgPicture.asset('images/plus.svg'): SvgPicture.asset('images/plus black.svg')),
                                    ]
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Center(
                              child: darkModeOn
                                  ? Container(
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
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                              'images/sms blue.svg'),
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                          ],
                        ), //edit profile and dm
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 344.w,
                          child: TabBar(
                            splashFactory: NoSplash.splashFactory,
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            indicatorColor: Colors.transparent,
                            labelColor: bcolor1,
                            unselectedLabelColor: Colors.grey,
                            unselectedLabelStyle: Theme.of(context)
                                .primaryTextTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                            controller: _tabcontroller,
                            tabs: [
                              Container(
                                height: 36.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: bcolor1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.r)),
                                ),
                                child: const Center(
                                    child: Text(
                                  'Beeps',
                                )),
                              ),
                              Container(
                                  height: 36.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: bcolor1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.r)),
                                  ),
                                  child: const Center(child: Text('Pictures'))),
                              Container(
                                  height: 36.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: bcolor1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.r)),
                                  ),
                                  child: Center(child: Text('Videos'))),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Divider(
                          color: darkModeOn == false ? uColor : bcolor1,
                          height: 1.h,
                        ),//edit profile and dm
                        SizedBox(height: 5.h,),
                        Padding(
                          padding:  EdgeInsets.only(right:20 ),
                          child: SizedBox(
                            width: 344.w,
                            child: TabBar(
                              splashFactory: NoSplash.splashFactory,
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                              indicatorColor: Colors.transparent,
                              labelColor: bcolor1,
                              unselectedLabelColor: Colors.grey,
                              unselectedLabelStyle: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
                              controller: _tabcontroller,
                              tabs:  [
                                Container(
                                    height: 36.h, width: 90.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: bcolor1),
                                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                                ),
                                    child: const Center(child: Text('Beeps',)),
                                ),
                                Container(
                                    height: 36.h, width: 90.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(color: bcolor1),
                                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                                    ),
                                    child: const Center(child: Text('Pictures'))),
                                Container(
                                    height: 36.h, width: 90.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(color: bcolor1),
                                      borderRadius: BorderRadius.all(Radius.circular(100.r)),
                                    ),
                                    child: Center(child: const Text('Videos'))),
                            ],),
                          ),
                        ),//tapbar
                        SizedBox(height: 16.h,),
                        Divider(
                          color: darkModeOn == false ?Color(0xff8E8E8E): bcolor1, height: 1.h,
                        ),
                        SizedBox(
                          height: 500.h,
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
                                    return PostBeep();
                                  },
                                ),
                              ), //beeps
                              SizedBox(
                                height: 500.h,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return PostCard();
                                  },
                                ),
                              ), //images
                              SizedBox(
                                height: 500.h,
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return PostCard();
                                  },
                                ),
                              ), //videos
                            ],
                          ),
                        ),//tabview
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
