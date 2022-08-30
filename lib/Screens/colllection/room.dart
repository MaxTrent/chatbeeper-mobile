import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/tour_post.dart';
 class Room extends StatefulWidget {
   const Room({Key? key}) : super(key: key);
   static const String id = 'Room';
   @override
   State<Room> createState() => _RoomState();
 }

 class _RoomState extends State<Room> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(

       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
       appBar: PreferredSize(
         preferredSize: Size(428.w,68.h),
         child: Padding(
           padding:  EdgeInsets.only(left: 16.w,right: 18.w, top: 32.h),
           child: AppBar(
             title: Text('Room', style: Theme.of(context).primaryTextTheme.bodyText1,),
             centerTitle: true,
             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
             elevation: 1,
             // leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
             //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Timeline()
             //   ));
             // },)),
             actions: [

               SizedBox(width: 24.w,),
               IconTheme(
                   data: Theme.of(context).iconTheme,
                   child: Icon(Icons.mail_outline,  size: 24.h,))
             ],
           ),
         ),
       ),
       body: ListView.builder(
         itemCount: 10,
         itemBuilder: (BuildContext context, index){
           return Column(
             children: [
               TourCard(),
             ],
           );
         },
       ),
     );

   }

 }

