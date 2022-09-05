
import 'package:chat_beeper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Widgets/room_post.dart';
import 'dm.dart';
 class Room extends StatefulWidget {
   const Room({Key? key}) : super(key: key);
   static const String id = 'Room';
   @override
   State<Room> createState() => _RoomState();
 }

 class _RoomState extends State<Room> {
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

       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       appBar: PreferredSize(
         preferredSize: Size(428.w,74.h),
         child: Container(
           decoration: const BoxDecoration(
             border: Border(
               bottom: BorderSide( color: Colors.grey)
             )
           ),
           child: AppBar(
             title: Padding(
               padding:  EdgeInsets.only(top: 45.w,),
               child: Text('Room', style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),),
             ),
             centerTitle: true,
             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
             elevation: 0,
             // leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
             //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Timeline()
             //   ));
             // },)),
             actions: [
               SizedBox(width: 24.w,),
               Padding(
                 padding:  EdgeInsets.only(top: 39.w,right: 18.w,),
                 child: SizedBox(
                   height: 24.h,
                   width: 24.w,
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) => DirectMessage()));
                     },
                     child: darkModeOn == false? SizedBox(
                       height: 20.h,
                       child: SvgPicture.asset(
                         color: Colors.black,
                         'images/Dm.svg',
                       ),
                     ):
                     SizedBox(
                       height: 20.h, width: 17.w,
                       child: SvgPicture.asset(
                         // color: Colors.black,
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
       body: Column(
         children: [
           SizedBox(height: 130.h,
             child: Column(
               children: [
                 Padding(
                   padding:  EdgeInsets.only(top: 17.h, left: 16.w, right: 20.w),
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
                       separatorBuilder:  ((context, index) => const SizedBox(
                         width: 24,
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
             child: const Divider(color: Colors.grey, thickness: 0.5,),
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
     );

   }
 }

