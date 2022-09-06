import 'package:chat_beeper/constants.dart';
import 'package:flutter/material.dart'; import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class DirectMessage extends StatefulWidget {
  const DirectMessage({Key? key}) : super(key: key);
  static const String id = 'Dm';

  @override
  State<DirectMessage> createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar:PreferredSize(
        preferredSize: Size(428.w,68.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey)
              )
          ),
          child: AppBar(
            // automaticallyImplyLeading: true,
            title: Padding(
              padding:  EdgeInsets.only(top: 32.h),
              child:  SizedBox(
                height: 30.h,
                child: Image.asset('images/chatb.png',),

              ),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: Center(child: Padding(
              padding:  EdgeInsets.only(top: 25.h),
              child: IconButton(icon:  Icon(Icons.arrow_back_ios_new, size:20.h,color: darkModeOn? Colors.white: Colors.black,), onPressed: () {
                Navigator.pop(context);
              },),
            )),
            actions: [
              Padding(
                padding:  EdgeInsets.only(left: 0, right: 17.w, top: 22.h),
                child: GestureDetector(
                  onTap: (){
                  },
                  child: SvgPicture.asset(
                    color: bcolor1,
                    'images/sms filled.svg',
                  )
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          Container(
            height: 80.h,
            width: width,
            decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                )
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                  },
                  child:     SizedBox(
                    width: 256.w,
                    child: Padding(
                      padding:  EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          floatingLabelBehavior:
                          FloatingLabelBehavior.auto,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30.r)),
                              borderSide: BorderSide(
                                width: 0.5.w,
                                // color: _isvalid == true ? bcolor1: Colors.red),
                                color: bcolor1,
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.r)),
                            borderSide:
                            BorderSide(width: 0.5.w, color: uColor),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.r)),
                            borderSide: BorderSide(
                                width: 0.5.w, color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.r)),
                            borderSide: BorderSide(
                                width: 0.5.w, color: Colors.red),
                          ),
                          errorStyle:
                          TextStyle(height: 0, fontSize: 10.sp),
                          hintText: 'Search message',
                          hintStyle: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2,
                          contentPadding:
                          EdgeInsets.only(top: 10.h, left: 10.w),
                          prefixIcon: Transform.scale(
                              scale: 0.5,
                              child: SvgPicture.asset('images/search.svg', color: darkModeOn? Colors.white: Colors.black,)),
                          // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                          focusColor: uColor,
                          // focusColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width*0.2,),
                Text('Message requests', style: TextStyle(color: bcolor3,fontWeight: FontWeight.w500, fontSize: 14.sp),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
