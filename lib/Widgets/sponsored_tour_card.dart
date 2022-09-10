import 'package:chat_beeper/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expandable/expandable.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import '../../Widgets/comment.dart';
import '../Screens/colllection/dm.dart';

class SponsoredTourCard extends StatefulWidget {
  const SponsoredTourCard({Key? key}) : super(key: key);

  @override
  State<SponsoredTourCard> createState() => _SponsoredTourCardState();
}

class _SponsoredTourCardState extends State<SponsoredTourCard> {
  late List<TourImage> images;
  late TourImage displayImage;
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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    return  Column(
      children: [
        Stack(
            children: [
              // SizedBox(
              //   height: 486.h,
              //   width: width,
              //   child: CachedNetworkImage(
              //     imageUrl:  'https://images.unsplash.com/photo-1657299141984-dd9196274cde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
              //
              //     key: Key(displayImage.id),
              //     // placeholder: (context, url) => const CircularProgressIndicator(),
              //     errorWidget: (context, url, error) => const Icon(Icons.error),
              //   ),
              // ),
              SizedBox(
                height: 486.h,
                width: width,
                child: Image(
                  key: Key(displayImage.id),
                  image: NetworkImage(
                    displayImage.url,
                  ),
                  fit: BoxFit.cover,
                ),
              ),

              // Positioned(
              //     top: 420,
              //     left: 70,
              //     child: SizedBox(
              //       // color: Colors.pink,
              //       width: 320.w,
              //       height: 48.h,
              //       child: ListView.separated(
              //         scrollDirection: Axis.horizontal,
              //         shrinkWrap: true,
              //         itemBuilder: ((context, index) => InkWell(
              //           onTap: () {
              //             setState(() {
              //               displayImage = images[index];
              //               _itemtapped = true;
              //             });
              //           },
              //           child: Container(
              //             width: 48,
              //             height: 48,
              //             decoration: BoxDecoration(
              //               // color: Colors.black,
              //                 border: displayImage.id == images[index].id
              //                     ? Border.all(
              //                   width: 2,
              //                   color: bcolor5,
              //                 )
              //                     : Border.all(
              //                   width: 2,
              //                   color: Colors.white,
              //                 )),
              //             child: Image.network(
              //               images[index].url,
              //               fit: BoxFit.cover,
              //               key: Key(images[index].id),
              //             ),
              //           ),
              //         )),
              //         separatorBuilder: ((context, index) =>  SizedBox(
              //           width: 10.w,
              //         )),
              //         itemCount: images.length,
              //       ),
              //     )),//small pics
              Positioned(
                  top: 30.h,
                  left: 420.w,
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    alignment: Alignment.center,
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  )),
              Positioned(
                top: 25.h,
                left: 413.w,
                child: PopupMenuButton<int>(
                  icon: const Icon(Icons.more_vert_sharp, color: Colors.white,),
                  iconSize: 24.h,
                  itemBuilder: (context) => [
                    // popupmenu item 1
                    PopupMenuItem(
                      value: 1,
                      // row has two child icon and text.
                      child: Row(
                        children: const [
                          Icon(Icons.star),
                          SizedBox(
                            // sized box with width 10
                            width: 10,
                          ),
                          Text("Get The App")
                        ],
                      ),
                    ),
                    // popupmenu item 2
                    PopupMenuItem(
                      value: 2,
                      // row has two child icon and text
                      child: Row(
                        children: [
                          Icon(Icons.chrome_reader_mode),
                          SizedBox(
                            // sized box with width 10
                            width: 10,
                          ),
                          Text("About")
                        ],
                      ),
                    ),
                  ],
                  // offset: Offset(0, 100),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 2,
                ),),
              Positioned(
                top: 30.h,
                left: 28.w,
                child:  Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  height: 28.h, width: 105.w,
                  child: Center(
                    child: Text('Sponsored', style: TextStyle(
                        color: ( Colors.white),
                        fontSize: 14.sp,
                        fontFamily: 'Nunito', fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ),
              Positioned(
                top: 415.h,
                // left: 10.w,
                child:  Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  height: 74.h, width: width,
                  child: Row(
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 17.h, left: 16.w, right: 32.w),
                            child: Text('The Sarah Antony Foundation', style: TextStyle(
                                color: ( Colors.white),
                                fontSize: 18.sp,
                                fontFamily: 'Nunito', fontWeight: FontWeight.w500
                            ),),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 16.w, bottom: 16.w),
                            child: Text('Help children get the best care across the world.', style: TextStyle(
                                color: ( Colors.white),
                                fontSize: 14.sp,
                                fontFamily: 'Nunito', fontWeight: FontWeight.w400
                            ),),
                          ),
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 50.w, ),
                        child: SizedBox(
                            width: 100.w, height: 36.h,
                            child: TextButton(
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,
                              onSurface: Colors.transparent,
                              backgroundColor: bcolor1
                            ),
                            onPressed: (){}, child: Center(child: Text('Donate', style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700, fontSize: 14.sp,color: Colors.white),)))),
                      ),

                    ],
                  ),
                ),
              ),
            ]),
        Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0.r),
                      child: Image.asset('images/sarah.png'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\ $FullName\ ",
                            style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text('@$username', style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w600, color: Colors.grey  ),),
                          const Icon(Icons.verified_rounded, color: bcolor5,size: 15,),
                        ],
                      ),
                      Text('\ $posttime', style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w500, color: Colors.grey  ),),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_sharp, color: Theme.of(context).colorScheme.secondaryVariant, size: 30,), )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 16.w, right: 27.w,bottom: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ReadMoreText(
                    loremIpsum,
                    trimExpandedText: 'see Less',
                    trimCollapsedText: 'see more',
                    colorClickableText: Colors.grey,
                    style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400, fontSize: 16.sp),

                  ),
                ],
              ),
            ),//readmore text
            Container(
              height: 0.2,
              color: Colors.grey,
            ),//divider
            Padding(
              padding:  EdgeInsets.only(left: 16.w,right: 19.w, top: 20.h, bottom: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LikeButton(
                    size: 24,
                    circleColor:
                    CircleColor(start: Colors.red.shade200, end: Colors.red),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.red,
                    ),
                    likeBuilder: (bool isLiked) {
                      return SvgPicture.asset('images/comment.svg', height: 24,);
                    },
                    likeCount: 100,
                    // countBuilder: (int count, bool isLiked, String text) {
                    //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                    //   Widget result;
                    //   if (count == 0) {
                    //     result = Text(
                    //       "love",
                    //       style: TextStyle(color: color),
                    //     );
                    //   } else
                    //     result = Text(
                    //       text,
                    //       style: TextStyle(color: color),
                    //     );
                    //   return result;
                    // },
                  ),//heart
                  SizedBox(width: 30.w,),
                  // LikeButton(
                  //   size: 24,
                  //   circleColor:
                  //   CircleColor(start: Color(0xff00ddff), end: const Color(0xff0099cc)),
                  //   bubblesColor: const BubblesColor(
                  //     dotPrimaryColor: Color(0xff33b5e5),
                  //     dotSecondaryColor: Color(0xff0099cc),
                  //   ),
                  //   likeBuilder: (bool isLiked) {
                  //     return isLiked == false? SvgPicture.asset(
                  //       'images/rebeep.svg',
                  //     ): SvgPicture.asset('images/rebeep_red.svg');
                  //   },
                  //   likeCount: 100,
                  //   // countBuilder: (int count, bool isLiked, String text) {
                  //   //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                  //   //   Widget result;
                  //   //   if (count == 0) {
                  //   //     result = Text(
                  //   //       "love",
                  //   //       style: TextStyle(color: color),
                  //   //     );
                  //   //   } else
                  //   //     result = Text(
                  //   //       text,
                  //   //       style: TextStyle(color: color),
                  //   //     );
                  //   //   return result;
                  //   // },
                  // ),//infinite
                  // SizedBox(width: 21.w,),
                  LikeButton(
                    size: 24,
                    circleColor:
                    CircleColor(start: Colors.red.shade700, end: Colors.red.shade800),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.red.shade700,
                      dotSecondaryColor: Colors.red.shade800,
                    ),
                    likeBuilder: (bool isLiked) {
                      return isLiked == false? SvgPicture.asset(
                        'images/dislike_blue.svg',
                      ): SvgPicture.asset('images/dislike_red.svg');
                    },
                    likeCount: 100,
                    // countBuilder: (int count, bool isLiked, String text) {
                    //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                    //   Widget result;
                    //   if (count == 0) {
                    //     result = Text(
                    //       "love",
                    //       style: TextStyle(color: color),
                    //     );
                    //   } else
                    //     result = Text(
                    //       text,
                    //       style: TextStyle(color: color),
                    //     );
                    //   return result;
                    // },
                  ),//brokenheart
                  SizedBox(width: 30.w,),
                  LikeButton(
                    size: 24,
                    circleColor:
                    CircleColor(start: Colors.red.shade200, end: Colors.red),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.red,
                    ),
                    likeBuilder: (bool isLiked) {
                      return isLiked == false? SvgPicture.asset(
                        'images/like.svg',
                      ): SvgPicture.asset('images/favorite_red.svg');
                    },
                    likeCount: 100,
                    // countBuilder: (int count, bool isLiked, String text) {
                    //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                    //   Widget result;
                    //   if (count == 0) {
                    //     result = Text(
                    //       "love",
                    //       style: TextStyle(color: color),
                    //     );
                    //   } else
                    //     result = Text(
                    //       text,
                    //       style: TextStyle(color: color),
                    //     );
                    //   return result;
                    // },
                  ),//heart
                  SizedBox(width: 170.w,),
                  GestureDetector(
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 5.h),
                      child: SvgPicture.asset('images/share.svg', height: 26,),
                    ),
                    onTap: (){
                      showModalBottomSheet(
                        useRootNavigator: true,
                        context: context, builder:(context)=>Container(
                        height: 336.h,
                        color: Theme.of(context).scaffoldBackgroundColor,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:   EdgeInsets.only(top: 6.h,),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.all(Radius.circular(100.r),),
                                ),
                                height:5.h,
                                width: 45.w,
                              ),
                            ),//container
                            Padding(
                              padding:  EdgeInsets.only(left: 16.h, top: 6.h,),
                              child: Align(
                                alignment:Alignment.topLeft,
                                child: Text('Share Beep',style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                                  color: bcolor3,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,

                                ),),
                              ),
                            ),//share beep
                            Padding(
                              padding:  EdgeInsets.only(bottom: 0.h, left: 59.w, right: 60.w, top: 37.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: bcolor3
                                            )
                                          // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                          // ),
                                        ),
                                        child: Center(child: GestureDetector(
                                          onTap: (){},
                                          child: SizedBox(
                                              height: 24.h,
                                              width: 18.w,
                                              child: SvgPicture.asset('images/link.svg',)),
                                        ),),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text('Copy Link', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                    ],
                                  ),//copy
                                  SizedBox(width: 35.w,),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: bcolor3
                                            )
                                          // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                          // ),
                                        ),
                                        child: Center(child: GestureDetector(
                                          onTap: (){},
                                          child: SizedBox(
                                              height: 24.h,
                                              width: 18.w,
                                              child: SvgPicture.asset('images/bookmark.svg',)),
                                        ),),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text('Save', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                    ],
                                  ),
                                  SizedBox(width: 35.w,),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: bcolor3
                                            )
                                          // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                          // ),
                                        ),
                                        child: Center(child: GestureDetector(
                                          onTap: (){},
                                          child: Image.asset('images/whatsapp.png', height: 20.h,width: 18.w,),
                                        ),),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text('Whatsapp', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                    ],
                                  ),//whatsappp
                                  SizedBox(width: 35.w,),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: bcolor3
                                            )
                                          // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                          // ),
                                        ),
                                        child: Center(child: GestureDetector(
                                          onTap: (){},
                                          child: Image.asset('images/facebook.png', height: 19.h,width: 20.w,),
                                        ),),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text('Facebook', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                    ],
                                  ),//facebook
                                ],
                              ),
                            ),//icons 1
                            Padding(
                              padding:  EdgeInsets.only(bottom: 0.h, left: 59.w, right: 60.w, top: 37.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: bcolor3
                                            )
                                          // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                          // ),
                                        ),
                                        child: Center(child: GestureDetector(
                                          onTap: (){},
                                          child: SizedBox(
                                              height: 24.h,
                                              width: 18.w,
                                              child: SvgPicture.asset('images/gmail.svg',)),
                                        ),),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text('Gmail', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                    ],
                                  ),//gmail
                                  SizedBox(width: 35.w,),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: bcolor3
                                            )
                                          // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                          // ),
                                        ),
                                        child: Center(child: GestureDetector(
                                          onTap: (){},
                                          child: SizedBox(
                                              height: 24.h,
                                              width: 24.w,
                                              child: SvgPicture.asset('images/slack.svg',)),
                                        ),),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text('Slack', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                    ],
                                  ),
                                  SizedBox(width: 35.w,),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: bcolor3
                                            )
                                          // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                          // ),
                                        ),
                                        child: Center(child: GestureDetector(
                                          onTap: (){},
                                          child: Image.asset('images/telegram.png', height: 24.h,width: 24.w,),
                                        ),),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text('Telegram', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                    ],
                                  ),//telegram
                                  SizedBox(width: 35.w,),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: bcolor3
                                            )
                                          // image: DecorationImage(image: AssetImage('images/pp_round.png',),
                                          // ),
                                        ),
                                        child: Center(child: GestureDetector(
                                          onTap: (){},
                                          child: SizedBox(
                                              height: 24.h,width: 30.w,
                                              child: SvgPicture.asset('images/discord.svg', )),
                                        ),),
                                      ),
                                      SizedBox(height: 8.h,),
                                      Text('Discord', style: TextStyle(color: darkModeOn?Colors.white: Colors.black, fontWeight: FontWeight.w500,fontSize: 14.sp, fontFamily: 'Nunito'),),
                                    ],
                                  ),//discord
                                ],
                              ),
                            ),//icons 2
                          ],
                        ),
                      ),
                      );
                    },
                  ),
                ],),//icons
            ),//icons
          ],
        ),

      ],
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
