
import 'package:chat_beeper/Screens/colllection/settings_page.dart';
import 'package:chat_beeper/Widgets/GradientText.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Widgets/room_post.dart';
import 'dm.dart';
import '../drawer_pages/follower_request.dart';
import '../drawer_pages/request_verification.dart';
import '../drawer_pages/saved_beeps.dart';
import '../drawer_pages/trending.dart';
import '../followers.dart';
import '../following.dart';
import '../profile_page.dart';

 class Room extends StatefulWidget {
   const Room({Key? key}) : super(key: key);
   static const String id = 'Room';
   @override
   State<Room> createState() => _RoomState();
 }

 class _RoomState extends State<Room> {
   @override
   final _key = GlobalKey<ScaffoldState>();
   String fullName = 'Jane Doe';
   String username = 'Janedoe_10';
   @override
   Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;
     var brightness = MediaQuery.of(context).platformBrightness;
     bool darkModeOn = brightness == Brightness.dark;
     ScreenUtil.init(
       context,
       designSize:Size(485,926),
     );
     return Scaffold(
       key: _key,
       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       appBar:  PreferredSize(
         preferredSize: Size(428.w,68.h),
         child: Container(
           decoration: const BoxDecoration(
               border: Border(
                   bottom: BorderSide(
                       color: uColor,
                       style: BorderStyle.solid
                   )
               )
           ),
           child: AppBar(
             automaticallyImplyLeading: true,
             leading: Padding(
               padding:  EdgeInsets.only(top: 29.h),
               child:    SizedBox(
                 height: 32.h,
                 child:  GestureDetector(
                   onTap: (){
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
               padding:  EdgeInsets.only(top: 32.h),
               child:  SizedBox(
                   height: 30.h,
                   child: Image.asset('images/chatb.png',),

               ),
             ),
             centerTitle: true,
             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
             elevation: 0.5,
            actions: [
              SizedBox(width: 12.w,),
              Padding(
                padding:  EdgeInsets.only(top: 32.h, right: 16.w),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const DirectMessage()));
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
              )
            ],
           ),
         ),
       ),
       body: Column(
         children: [
           SizedBox(height: 130.h,
             child: Column(
               children: [
                 Padding(
                   padding:  EdgeInsets.only( left: 16.w, right: 20.w),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Interests', style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Nunito', fontSize: 16.sp, color: bcolor5),),
                       PopupMenuButton<int>(

                         icon: SvgPicture.asset('images/setting-4.svg'),
                         iconSize: 24.h,
                         itemBuilder: (context) => [
                           // popupmenu item 1
                           PopupMenuItem(
                             value: 1,
                             // row has two child icon and text.
                             child: Row(
                               children: [
                                 Text("Change location",style:  TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),)
                               ],
                             ),
                           ),
                           // popupmenu item 2
                           PopupMenuItem(
                             value: 2,
                             // row has two child icon and text.
                             child: Row(
                               children: [
                                 Text("Preferred gender", style:
                                 TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                                 )
                               ],
                             ),
                           ),
                           PopupMenuItem(
                             value: 3,
                             child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 'Lock your room',
                                 style:
                                 TextStyle(fontFamily: 'Nunito', fontSize: 18.sp, fontWeight: FontWeight.w500, color: darkModeOn? Colors.white: Colors.black),
                               ),
                               Transform.scale(
                                 scale: 0.7,
                                 child: CupertinoSwitch(value: false, onChanged: null,
                                 thumbColor: Colors.grey.shade500,
                                 ),
                               )
                             ],
                           ),),

                         ],
                         offset: Offset(0, 40.h),
                         color: Theme.of(context).scaffoldBackgroundColor,
                         elevation: 2,
                       )
                     ],
                   ),
                 ),//interest and settings
                 Padding(
                   padding:  EdgeInsets.only(top: 5.h, left: 16.w, right: 16.w),
                   child: SizedBox(
                     height: 60.h,
                     child: ListView.separated(
                       scrollDirection: Axis.horizontal,
                       itemCount: 20,
                       separatorBuilder:  ((context, index) =>  SizedBox(
                         width: 10.w,
                       )),
                       itemBuilder: (BuildContext context, int index) {
                         return Row(
                           children: [
                             ClipRRect(
                               borderRadius: BorderRadius.circular(100.0.r),
                               child: Image.asset('images/pp_round.png', height: 60.h, width: 60.w,),
                             ),
                           ],
                         );
                       },
                     ),
                   ),
                 ),//row of accounts
               ],
             ),
           ),
           Padding(
             padding:  EdgeInsets.only(left: 16.w,right: 16.w),
             child: const Divider( color:uColor, thickness: 0.5,),
           ),
           SizedBox(
             height: 560.h,
             // width: 368.w,
             child: ListView.builder(
               itemCount: 10,
               itemBuilder: (BuildContext context, index){
                 return Column(
                   children: [
                     RoomCard(),
                   ],
                 );
               },
             ),
           ),//listview
         ],
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
     );

   }
 }

