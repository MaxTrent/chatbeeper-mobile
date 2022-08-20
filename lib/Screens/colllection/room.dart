import 'package:flutter/material.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';
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

       backgroundColor: Colors.grey,

       body: Container(

         height: double.infinity,

         width: double.infinity,

         child: Column(children: [

           Divider(),

           Expanded(

             child: Container(

               child: ListView.builder(

                   itemCount: 4,

                   itemBuilder: (context, index) {

                     return Container(

                       // height: 380,

                       margin: EdgeInsets.only(bottom: 10),

                       child: Column(

                         children: [

                           Container(

                             height: 50,

                             child: Row(

                               mainAxisAlignment: MainAxisAlignment.spaceBetween,

                               children: [

                                 Container(

                                   width: 200,

                                   child: Row(

                                     children: [

                                       Container(

                                         margin: EdgeInsets.symmetric(horizontal: 5),

                                         padding: EdgeInsets.all(2.5),

                                         decoration: BoxDecoration(

                                             borderRadius:

                                             BorderRadius.circular(50),

                                             color: Colors.grey.shade800),

                                         child: Container(

                                           padding: EdgeInsets.all(1),

                                           decoration: BoxDecoration(

                                               borderRadius:

                                               BorderRadius.circular(50),

                                               color: Colors.black),

                                           child: Container(

                                             height: 40,

                                             width: 40,

                                             decoration: BoxDecoration(

                                                 borderRadius:

                                                 BorderRadius.circular(50),

                                                 image: DecorationImage(

                                                     fit: BoxFit.cover,

                                                     image: AssetImage(

                                                         'images/authfailed.png'))),

                                           ),//profile Picture

                                         ),

                                       ),

                                       SizedBox(

                                         height: 5,

                                       ),

                                       Text('imgNames[index]',

                                           style: TextStyle(

                                               color: Colors.white,

                                               fontSize: 13,

                                               fontWeight: FontWeight.w800))//name of user

                                     ],

                                   ),

                                 ),

                                 Container(

                                     width: 50,

                                     child: Icon(Icons.more_vert_outlined,

                                         size: 18, color: Colors.white))//more icon

                               ],

                             ),

                           ),

                           Container(

                             color: Colors.black,

                             height: 210,

                             width: MediaQuery.of(context).size.width,

                             child: Image.asset('images/logo1.png',

                                 fit: BoxFit.cover),

                           ),//postt image

                           SizedBox(height: 5),

                           Container(

                             height: 30,

                             child: Row(

                               mainAxisAlignment: MainAxisAlignment.spaceBetween,

                               children: [

                                 Container(

                                   width: 200,

                                   child: Row(

                                     children: [

                                       SizedBox(width: 10),

                                       Icon(

                                         Icons.favorite_border_outlined,

                                         size: 22,

                                         color: Colors.white,

                                       ),

                                       SizedBox(width: 6),

                                       Icon(Icons.comment_outlined,

                                           size: 20, color: Colors.white),

                                       SizedBox(width: 6),

                                       Icon(Icons.send_outlined,

                                           size: 21, color: Colors.white)

                                     ],

                                   ),

                                 ),//favorite,message and dm

                                 Container(

                                     width: 50,

                                     child: Icon(Icons.bookmark_border_outlined,

                                         size: 22, color: Colors.white))//bookmark end

                               ],

                             ),

                           ),

                           Align(

                               alignment: Alignment.centerLeft,

                               child: Padding(

                                 padding: const EdgeInsets.only(left: 10),

                                 child: Text('198,459 likes',

                                     style: TextStyle(

                                         fontSize: 11,

                                         color: Colors.white,

                                         fontWeight: FontWeight.w600)),

                               )),

                           SizedBox(height: 3),

                           Align(

                               alignment: Alignment.centerLeft,

                               child: Padding(

                                 padding: const EdgeInsets.only(left: 10),

                                 child: Row(

                                   children: [

                                     Text('imgNames[index]',

                                         style: TextStyle(

                                             fontSize: 13,

                                             color: Colors.white,

                                             fontWeight: FontWeight.w800)),//user name under

                                     SizedBox(width: 8),

                                     Text('captions[index]',

                                         style: TextStyle(

                                             fontSize: 11,

                                             fontWeight: FontWeight.w400,

                                             color: Colors.white)),//caption

                                   ],

                                 ),

                               )),//user name and caption

                           SizedBox(height: 5),

                           Align(

                               alignment: Alignment.centerLeft,

                               child: Padding(

                                 padding: const EdgeInsets.only(left: 10),

                                 child: Text('View all 5980 comments',

                                     style: TextStyle(

                                         fontSize: 12,

                                         fontWeight: FontWeight.w500,

                                         color: Colors.white)),

                               ))//view comments

                         ],

                       ),

                     );

                   }),

             ),

           )

         ]),

       ),

     );

   }

 }

