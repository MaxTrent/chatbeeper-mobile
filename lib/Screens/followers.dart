import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import 'colllection/home_page.dart';
class Followers extends StatefulWidget {
  const Followers({Key? key}) : super(key: key);

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  final String displayName = 'Mark Peter';
  final String username = 'markpetr';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    bool _isFollowed = false;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(428.w, 68.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: uColor, style: BorderStyle.solid))),
          child: AppBar(
            automaticallyImplyLeading: true,
            leading: Padding(
              padding: EdgeInsets.only(top: 29.h),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: darkModeOn == true ? Colors.white : Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 32.h),
              child: Text(
                'Followers',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.5,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: uColor
                  )
              )
          ),
          child: ListTile(
            dense: true,
            title: Row(
              children: [
                CircleAvatar(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0.r),
                     child: Image.asset('images/sarah.png'))),
                SizedBox(
                  width: 8.0.w,
                ),
                Text(
                  displayName,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  ' @$username',
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
                const Icon(
                  Icons.verified_rounded,
                  color: bcolor5,
                  size: 15,
                ),
              ],
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(left: 56.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'A product design who loves\nsolving real life problems\nwith my superpower 😁',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        _isFollowed = true;
                        print(_isFollowed);
                      });
                    }),
                    child: Padding(
                      padding:  EdgeInsets.only(bottom: 30.h),
                      child: Container(
                        height: 31.h,
                        width: 99.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff386FA4)),
                            borderRadius: BorderRadius.circular(16.0.r)),
                        child: Center(
                          child: _isFollowed == false
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Follow'),
                              Icon(
                                Icons.add,
                                size: 18.sp,
                              )
                            ],
                          )
                              : const Text('Following', style: TextStyle(color: bcolor3),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// class FollowersCard extends StatefulWidget {
//   const FollowersCard({Key? key}) : super(key: key);
//
//   @override
//   State<FollowersCard> createState() => _FollowersCardState();
// }
//
// class _FollowersCardState extends State<FollowersCard> {
//   @override
//   Widget build(BuildContext context) {
//     String loremIpsum ="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
//
//     const String fullName = 'Sarah Madini';
//      const String bio = 'A product design who loves solving real life problems with my superpower 😁';
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     var brightness = MediaQuery.of(context).platformBrightness;
//     const String username = 'Madini';
//     bool darkModeOn = brightness == Brightness.dark;
//     return SizedBox(
//       height: 116.h, width: width,
//       child:  Card(
//         color: Theme.of(context).scaffoldBackgroundColor,
//         shape: const RoundedRectangleBorder(
//         ),
//         child: Container(
//           decoration: const BoxDecoration(
//
//           ),
//           child:Stack(
//             children: <Widget>[
//               Row(
//                 children: [
//
//                   Padding(
//                     padding:  EdgeInsets.only(left: 65.w,top: 10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "\ $fullName\ ",
//                               style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500, fontSize: 17.sp),
//                             ),
//                             Text('@$username', style: TextStyle(fontFamily: 'Nunito',fontWeight:FontWeight.w600, color: Colors.grey  ),),
//                             const Icon(Icons.verified_rounded, color: bcolor5,size: 15,),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child:   Padding(
//                   padding:  EdgeInsets.only(top: 10, left: 16.w),
//                   child: CircleAvatar(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100.0.r),
//                       child: Image.asset('images/sarah.png'),
//                     ),
//                   ),
//                 ),
//               ),//image
//               Padding(
//                 padding:  EdgeInsets.only(left: 70.w,bottom: 13.h),
//                 child: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: SizedBox(
//                     width: 190.w,
//                     height: 60.h,
//                     child: Text(
//                       bio,
//                       style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontWeight: FontWeight.w400, fontSize: 15.sp),
//
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Padding(
//                   padding:  EdgeInsets.only(right: 20.w),
//                   child: SizedBox(
//                     width: 120.2.w, height: 31.13.h,
//                     child:OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                           shape: const StadiumBorder(),
//                           backgroundColor: Colors.white,
//                         splashFactory: NoSplash.splashFactory,
//                         side: BorderSide(
//                           color: bcolor3
//                         )
//                       ),
//                         onPressed: (){
//                           // FocusScope.of(context).unfocus();
//                         }, child: darkModeOn == false? Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Center(
//                             child: Text(
//                               'Follow',
//                               textAlign: TextAlign.center,
//                               style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w600),
//                               // TextStyle(
//                               //     color: Colors.white,
//                               //     fontWeight: FontWeight.w500,
//                               //     fontFamily: 'Nunito',
//                               //     fontSize: 17.sp
//                               //
//                               // ),
//                             ),
//                           ),
//                           SizedBox(width: 2,),
//                           SizedBox(
//                               height: 20.h,
//                               child: darkModeOn? SvgPicture.asset('images/plus.svg', ): SvgPicture.asset('images/plus black.svg', color: Colors.black,)),
//                         ]
//                     ):
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Center(
//                             child: Text(
//                               'Following',
//                               textAlign: TextAlign.center,
//                               style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(fontSize: 15.sp,fontWeight: FontWeight.w600, color: bcolor3),
//                               // TextStyle(
//                               //     color: Colors.white,
//                               //     fontWeight: FontWeight.w500,
//                               //     fontFamily: 'Nunito',
//                               //     fontSize: 17.sp
//                               //
//                               // ),
//                             ),
//                           ),
//                         ]
//                     ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

