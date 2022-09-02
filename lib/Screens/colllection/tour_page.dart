
import 'package:chat_beeper/Widgets/tour_card.dart';
import 'package:chat_beeper/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
          preferredSize: Size(428.w,68.h),
          child: Padding(
            padding:  EdgeInsets.only(left: 16.w,right: 18.w, top: 32.h),
            child: AppBar(
              // automaticallyImplyLeading: true,
              title: Text('Tour', style: Theme.of(context).primaryTextTheme.bodyText1,),
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              // leading: Center(child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:23.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
              //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  Timeline()
              //   ));
              // },)),
              actions: [
                SizedBox(
                  height: 24.h, width: 24.w,
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
                      color: Colors.black,
                      'images/search_dark.svg',
                    ),
                  ),
                ),
                SizedBox(width: 24.w,),
                SizedBox(
                  height: 24.h,
                  width: 24.w,
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
                      color: Colors.black,
                      'images/sms.svg',
                    ),
                  ),
                )
              ],
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