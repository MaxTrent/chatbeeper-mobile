import 'package:chat_beeper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class TourPage extends StatefulWidget {
  const TourPage({Key? key}) : super(key: key);
  static const String id = 'Tour-page';

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ScreenUtil.init(
      context,
      designSize:Size(485,926),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size(width,70.h),
          child: AppBar(
            leading: Icon(Icons.arrow_back_ios,color: bcolor1,),
            centerTitle: true,
            title: Image.asset('images/logo1.png',height: 50.h , width: 50.h,),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            actions: [
              Padding(
                padding:  EdgeInsets.only(right: 3.r),
                child: Container(
                    height: 48.h, width: 50.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.r))
                    ),
                    child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search,color: Colors.grey,


                    ))),
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: 10,
          itemBuilder: (BuildContext context, index){
              return SizedBox(
                width: width,
                child: Card(
                  color: bcolor1,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20.r),
                  ),
                  child: Wrap(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r), bottomRight:Radius.circular(20.r), ),
                              color: bcolor1
                          ),
                          width: width,
                          height: 650.h,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 410.h, width: 40.w,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(top: 50.h,bottom: 2.h),
                                          child: Container(
                                              height: 31.h,width: 31.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), topLeft: Radius.circular(10), topRight:  Radius.circular(10),  ),
                                                  color: Colors.white
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.cover,
                                                child:Image.asset('images/logo.png'),
                                              )
                                          ),
                                        ),//first
                                        Padding(
                                          padding:  EdgeInsets.only(top: 20.h,bottom: 2.h),
                                          child: Container(
                                              height: 31.h,width: 31.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), topLeft: Radius.circular(10), topRight:  Radius.circular(10),  ),
                                                  color: Colors.white
                                              ),
                                              child: FittedBox(
                                                fit: BoxFit.cover,
                                                child:Image.asset('images/logo.png'),
                                              )
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(top: 20.h,bottom: 2.h),
                                              child: Container(
                                                  height: 31.h,width: 31.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), topLeft: Radius.circular(10), topRight:  Radius.circular(10),  ),
                                                      color: Colors.white
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child:Image.asset('images/logo.png'),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(top: 33.h,bottom: 2.h),
                                              child: Container(
                                                  height: 31.h,width: 31.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), topLeft: Radius.circular(10.r), topRight:  Radius.circular(10.r),  ),
                                                      color: Colors.white
                                                  ),
                                                  child:FittedBox(
                                                    fit: BoxFit.cover,
                                                    child:Image.asset('images/logo.png'),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),

                                        Column(
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.only(top: 33.h,bottom: 2.h),
                                              child: Container(
                                                  height: 31.h,width: 31.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r), bottomRight:Radius.circular(10.r), topLeft: Radius.circular(10.r), topRight:  Radius.circular(10.r),  ),
                                                      color: Colors.white
                                                  ),
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child:Image.asset('images/logo.png',),
                                                  )
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],

                                    ),

                                  ),//image accounts
                                  Container(

                                    // height: 380,

                                      margin: EdgeInsets.only(bottom: 10),

                                      child: Container(

                                        color: Colors.black,

                                        height: 410,
                                        width: 340,

                                        child: Image.asset('images/pic1.png',

                                            fit: BoxFit.cover),

                                      )),//image
                                  Container(
                                    height: 410, width: 40,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 50,bottom: 2),
                                          child: Container(
                                              height: 31,width: 31,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), topLeft: Radius.circular(10), topRight:  Radius.circular(10),  ),
                                                  color: Colors.white
                                              ),
                                              child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.share_up,color: bcolor2,size: 30,),))
                                          ),
                                        ),//first
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20,bottom: 2),
                                          child: Container(
                                              height: 31,width: 31,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), topLeft: Radius.circular(10), topRight:  Radius.circular(10),  ),
                                                  color: Colors.white
                                              ),
                                              child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.bookmark,color: bcolor2,size: 30,),))
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20,bottom: 2),
                                              child: Container(
                                                  height: 31,width: 31,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), topLeft: Radius.circular(10), topRight:  Radius.circular(10),  ),
                                                      color: Colors.white
                                                  ),
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: IconButton(onPressed: (){}, icon: const Icon(Icons.heart_broken_outlined,color: bcolor2,size: 30,),))
                                              ),
                                            ),
                                            Text('100', style: TextStyle(color: Colors.white),),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20,bottom: 2),
                                              child: Container(
                                                  height: 31,width: 31,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), topLeft: Radius.circular(10), topRight:  Radius.circular(10),  ),
                                                      color: Colors.white
                                                  ),
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.heart,color: bcolor2,size: 30,),))
                                              ),
                                            ),
                                            Text('100', style: TextStyle(color: Colors.white),),
                                          ],
                                        ),

                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 20,bottom: 2),
                                              child: Container(
                                                  height: 31,width: 31,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), topLeft: Radius.circular(10), topRight:  Radius.circular(10),  ),
                                                      color: Colors.white
                                                  ),
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.chat_bubble,color: bcolor2,size: 30,),))
                                              ),
                                            ),
                                            Text('100', style: TextStyle(color: Colors.white),),
                                          ],
                                        ),

                                      ],

                                    ),

                                  ),//icons
                                ],
                              ),//IMAGES,POST AND ICONS
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight:Radius.circular(10), ),
                                ),
                                height: 50,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    SizedBox(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset('images/Pp.png', height: 50, width: 50,),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Positioned(
                                        left: 55,
                                        bottom: 25,
                                        child: Text('Mark Peter', style: Theme.of(context).primaryTextTheme.headline6,)),//user name
                                    Positioned(
                                        left: 155,
                                        bottom: 30,
                                        child: Icon(Icons.verified_sharp, color: bcolor5,size: 18,)),//verified
                                    Positioned(
                                        left: 55,
                                        bottom: 6,
                                        child: Text('@markpetr', style: Theme.of(context).primaryTextTheme.headline2,)),//username@
                                  ],
                                ),
                              ),//mark caption
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Wrap(
                                  children: [
                                    ReadMoreText(
                                      'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase. aadsjfdjdfhgshghrghergehirgrhigehighigehirgrehi',
                                      trimLines: 1,
                                      style: Theme.of(context).primaryTextTheme.bodyText1,
                                      colorClickableText: uColor,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Read more',
                                      trimExpandedText: 'Read less',
                                      trimLength: 300,
                                      moreStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                                        lessStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text('10 minutes ago',
                                          style: Theme.of(context).primaryTextTheme.bodyText1,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          )//,
                      ),
                    ],
                  ),
                ),
              );
          },
        )
    );
  }
}
