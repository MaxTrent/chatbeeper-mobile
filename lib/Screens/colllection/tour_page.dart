
import 'package:chat_beeper/Screens/colllection/settings_page.dart';
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
  String loremIpsum ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  String FullName = 'Sarah Madini';
  String username = 'Madini';
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
      designSize:const Size(485,926),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar:  PreferredSize(
        preferredSize: Size(428.w,60.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: uColor,
                      style: BorderStyle.solid
                  )
              )
          ),
          child: SafeArea(
            child: AppBar(
              automaticallyImplyLeading: true,
              leading: Padding(
                padding:  EdgeInsets.only(top: 20.h,),
                child: Transform.scale(
                  scale: 0.5,
                  child: GestureDetector(
                    onTap: (){
                      _key.currentState!.openDrawer();
                    },
                    child: Transform.scale(
                      scale: 2,
                      child: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0.r),
                          child: Image.asset('images/pp_round.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding:  EdgeInsets.only(top: 28.h),
                child:  SizedBox(
                  height: 28.h,
                  child: darkModeOn? SvgPicture.asset('images/chatbeeper_dual.svg',):SvgPicture.asset('images/chatbeeper_blue.svg',),

                ),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.5,
              actions: [
                // SizedBox(width: 12.w,),
                Padding(
                  padding:  EdgeInsets.only(top: 32.h, right: 25.w),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => DirectMessage()));
                    },
                    child:
                    darkModeOn == false ? SvgPicture.asset(
                      color: Colors.black,
                      'images/search.svg',
                    ):
                    SvgPicture.asset(
                      color: Colors.white,
                      'images/search_dark.svg',
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 32.h, right: 16.w),
                  child: SizedBox(
                    height: 28.h, width: 28.h,
                    child: Transform.scale(
                      scale: 1.2,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => DirectMessage()));
                        },
                        child: darkModeOn == false? SvgPicture.asset(
                          color: Colors.black,
                          'images/Dm.svg',
                        ):
                        SvgPicture.asset(
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
            height: 712.h,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: const [
                    TourCard(),
                    SponsoredTourCard()
                  ],
                );
              },
            ),
          ),
        ),
      ),
      drawer: SizedBox(
        width: 372.w,
        child: Drawer(
          backgroundColor:  Theme.of(context).scaffoldBackgroundColor,
          child: SafeArea(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 16.w,top: 32.h),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child:   Image.asset('images/logo1.png',height: 32.h, width: 32.w,),
                  ),
                ),//logo
                SizedBox(height: 39.h,),
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: 20.h, left: 16.w),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.0.r),
                              child: Image.asset('images/pp_round.png', height: 65.h,),
                            ),
                            SizedBox(width: 12.w,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  fullName,
                                  style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp ),
                                ),//full name
                                Text('\  $username', style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w600, color: uColor, fontSize: 16.sp ),),//username
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 16.w, right: 17.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SizedBox(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Following(),
                                    ));
                              },
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Followers(),
                                      ));
                                },
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Followers(),
                                        ));
                                  },
                                  child: Row(
                                    children: [
                                      Text('100K', style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                        fontWeight: FontWeight.w600, fontSize: 16.sp,
                                      ),
                                      ),
                                      SizedBox(width: 3.w,),
                                      Text('Beeps',style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w600, color: uColor, fontSize: 14.sp,), ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),//beeps
                          SizedBox(width: 18.w,),
                          Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: Row(
                              children: [
                                Text('800', style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 16.sp,
                                ),
                                ),
                                SizedBox(width: 5.w,),
                                Text('Followers',style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w700, color: uColor, fontSize: 14.sp,), ),
                              ],
                            ),
                          ),//followers
                          SizedBox(width: 20.w,),
                          SizedBox(
                            child: Row(
                              children: [
                                Text('2k', style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 18.sp,
                                ),
                                ),
                                SizedBox(width: 5.w,),
                                Text('Following',style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w600, color: uColor, fontSize: 16.sp,), ),
                              ],
                            ),
                          ),//following
                        ],
                      ),
                    ),//following followers
                    SizedBox(height: 12.h,),
                    Divider(color:uColor, thickness: 0.5,),
                  ],
                ),//profilepicture and username
                // SizedBox(height: 20.h,),
                // ListTile(
                //   horizontalTitleGap: 0,
                //   leading: Row(children:[
                //     Icon(IconlyLight.profile, size: 20.h,color: darkModeOn ? Colors.white:Colors.black,),
                //     SizedBox(width: 12.w,),
                //     Text('My Profile',
                //         style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600)
                //         ),
                //   ]
                //     ),
                //   title: const Text('Page 2'),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                Align(
                    alignment: Alignment.topLeft,
                    child:TextButton(
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          onSurface: Colors.transparent,

                          // overlayColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const Profile(),));
                        }, child: Row(
                      children: [
                        SizedBox(
                            height: 24.h,  width: 24.w,
                            child: darkModeOn? SvgPicture.asset('images/profile white.svg'):
                            SvgPicture.asset('images/profile.svg')
                        ),
                        SizedBox(width: 12.w,),
                        Text('My Profile',
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight:FontWeight.w600, color: darkModeOn? Colors.white:Colors.black)
                        ),
                      ],
                    ))),//myprofile
                SizedBox(height: 15.h,),
                Align(
                    alignment: Alignment.topLeft,
                    child:TextButton(   style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      onSurface: Colors.transparent,

                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const FollowerRequests(),));
                    },
                        child: Row(
                          children: [
                            SizedBox(
                                height: 24.h,  width: 24.w,
                                child: darkModeOn? SvgPicture.asset('images/profile-2user white.svg'):
                                SvgPicture.asset('images/profile-2user.svg')
                            ),
                            SizedBox(width: 12.w,),
                            Text('Follower Requests',
                                style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight:FontWeight.w600, color: darkModeOn? Colors.white:Colors.black)
                            ),
                          ],
                        ))),//follower request
                SizedBox(height: 15.h,),
                Align(
                    alignment: Alignment.topLeft,
                    child:TextButton(   style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      onSurface: Colors.transparent,

                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const Trending(),));
                    }, child: Row(
                      children: [
                        SizedBox(
                            height: 24.h,  width: 24.w,
                            child: darkModeOn? SvgPicture.asset('images/activity white.svg'):
                            SvgPicture.asset('images/activity.svg')
                        ),
                        SizedBox(width: 12.w,),
                        Text('Trending',
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight:FontWeight.w600, color: darkModeOn? Colors.white:Colors.black)
                        ),
                      ],
                    ))),//Trending
                SizedBox(height: 15.h,),
                Align(
                    alignment: Alignment.topLeft,
                    child:TextButton(   style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      onSurface: Colors.transparent,

                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const SavedBeeps(),));
                    }, child: Row(
                      children: [
                        SizedBox(
                            height: 24.h,  width: 24.w,
                            child: darkModeOn? SvgPicture.asset('images/save-2 white.svg'):
                            SvgPicture.asset('images/save-2.svg')
                        ),
                        SizedBox(width: 12.w,),
                        Text('Saved Beeps',
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight:FontWeight.w600, color: darkModeOn? Colors.white:Colors.black)
                        ),
                      ],
                    ))),//saved
                SizedBox(height: 15.h,),
                Align(
                    alignment: Alignment.topLeft,
                    child:TextButton(   style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      onSurface: Colors.transparent,

                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),onPressed: (){}, child: Row(
                      children: [
                        SizedBox(
                            height: 24.h,  width: 24.w,
                            child: darkModeOn? SvgPicture.asset('images/briefcase white.svg'):
                            SvgPicture.asset('images/briefcase.svg')
                        ),
                        SizedBox(width: 12.w,),
                        Text('Create Business Account',
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight:FontWeight.w600, color: darkModeOn? Colors.white:Colors.black)
                        ),
                      ],
                    ))),//create businessman
                SizedBox(height: 15.h,),
                Align(
                    alignment: Alignment.topLeft,
                    child:TextButton(   style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      onSurface: Colors.transparent,

                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  const SettingsPage(),
                      )
                      );
                    }, child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,  width: 24.w,
                          child:  darkModeOn? SvgPicture.asset('images/setting-2 white.svg'):
                          SvgPicture.asset('images/setting-2.svg'),),
                        SizedBox(width: 12.w,),
                        Text('Settings',
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight:FontWeight.w600, color: darkModeOn? Colors.white:Colors.black)
                        ),
                      ],
                    ))),//settings
                SizedBox(height: 15.h,),
                Align(
                    alignment: Alignment.topLeft,
                    child:TextButton(   style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      onSurface: Colors.transparent,

                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>  const RequestVerification(),));
                        },

                        child: Row(
                          children: [
                            SizedBox(
                                height: 24.h,  width: 24.w,
                                child:   darkModeOn? const Icon(Icons.verified_outlined, color: Colors.white, size: 24,):
                                SvgPicture.asset('images/verify black.svg')),
                            SizedBox(width: 12.w,),
                            Text('Request Verification',
                                style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight:FontWeight.w600, color: darkModeOn? Colors.white:Colors.black)
                            ),
                          ],
                        ))),//request verification
                SizedBox(height: 15.h,),
                Align(
                    alignment: Alignment.topLeft,
                    child:TextButton(   style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      onSurface: Colors.transparent,

                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    ),onPressed: (){}, child: Row(
                      children: [
                        SizedBox(
                          height: 24.h,  width: 24.w,
                          child:  darkModeOn? SvgPicture.asset('images/promotions black.svg', color: Colors.white,):
                          SvgPicture.asset('images/promotions black.svg'),),
                        SizedBox(width: 12.w,),
                        Text('Sponsored Beeps',
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 14.sp, fontWeight:FontWeight.w600, color: darkModeOn? Colors.white:Colors.black)
                        ),
                      ],
                    ))),//promotions

              ],
            ),
          ),
        ),
      ),
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