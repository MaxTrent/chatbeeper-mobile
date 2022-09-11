import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/constants.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RebeepResponse extends StatefulWidget {
  const RebeepResponse({Key? key}) : super(key: key);

  @override
  State<RebeepResponse> createState() => _RebeepResponseState();
}

class _RebeepResponseState extends State<RebeepResponse> {
  bool _rebeeped = false;
  @override
  Widget build(BuildContext context) {
    return    StatefulBuilder(
      builder:(context, setState)=> AlertDialog(
        titlePadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        buttonPadding:EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.only(bottom: 9.h),
        alignment:  Alignment(-2.w,0.928.h),
        backgroundColor: Colors.white.withOpacity(0.7),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(
                Radius.circular(100.0.r))),
        actionsAlignment: MainAxisAlignment.center,
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;

            return SizedBox(
              width: 383.w,
              height: 83.h,
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 34.w,),
                    child:    SizedBox(
                      width: 152.w, height: 38.57.h,
                      child:OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: bcolor3),
                          onPressed: ()async{
                            setState((){
                              // Navigator.of(context, rootNavigator: true).pop();
                              _rebeeped  == true ;
                              Navigator.pop(context);
                              print('object');
                            });
                          }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height:23, width: 29,
                              child: SvgPicture.asset('images/rebeep.svg', color: _rebeeped == true ? Colors.red: null,)),
                          SizedBox(width: 8.w,),
                          Text('Rebeep',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Nunito', fontSize: 16.sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ],
                      )),
                    ),//rebeep
                  ),//Rebeep
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    width: 152.w, height: 38.57.h,
                    child:OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: bcolor3),
                        onPressed: (){
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.pop(context);
                        }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                              height:23, width: 27,
                              child: SvgPicture.asset('images/echo.svg')),
                        ),
                    SizedBox(width: 8.w,),
                        Text('Echo Beep',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Nunito', fontSize: 16.sp,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    )),
                  ),//echo
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
