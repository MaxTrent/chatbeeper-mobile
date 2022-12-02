import 'package:chat_beeper/Screens/colllection/message_screen.dart';
import 'package:chat_beeper/Widgets/dm_list.dart';
import 'package:chat_beeper/constants.dart';
import 'package:chat_beeper/model/dm_users_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DirectMessage extends StatefulWidget {
  const DirectMessage({Key? key}) : super(key: key);
  static const String id = 'Dm';

  @override
  State<DirectMessage> createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  List<DmUsers> dmUsers = [
    DmUsers(
        name: 'Amber Lexy',
        username: 'lexy4real2',
        message: 'Hi baby 🥰',
        imageURL: 'images/userdp1.png',
        time: 'Just now'),
    DmUsers(
        name: 'Chi Chi',
        username: 'hotbabechi',
        message:
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing Fermentum arcu...',
        imageURL: 'images/userdp2.png',
        time: '1 hour ago'),
    DmUsers(
        name: 'Lagos babes',
        message:
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing Fermentum arcu...',
        imageURL: 'images/userdp1.png',
        time: '4 hours ago'),
    DmUsers(
        name: 'Obinna Alex',
        username: 'KingObii6',
        message: 'Hi 👋',
        imageURL: 'images/userdp2.png',
        time: '3 hours ago'),
    DmUsers(
        name: 'Blackie Jack',
        username: 'blaqiee_',
        message:
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing Fermentum arcu...',
        imageURL: 'images/userdp1',
        time: '10 hours ago'),
    DmUsers(
        name: 'Tunde Ayomide',
        username: 'Tumide.ox',
        message:
            'Lorem ipsum dolor sit amet, consectetur\nadipiscing Fermentum arcu...',
        imageURL: 'images/userdp2',
        time: '10 hours ago'),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(428.w, 68.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: AppBar(
            // automaticallyImplyLeading: true,
            title: Padding(
              padding: EdgeInsets.only(top: 20.h, right: 9.w),
              child: SizedBox(
                  height: 34.h,
                  // width: 159.w,
                  child: SvgPicture.asset(
                    'images/chatbeeper_blue.svg',
                  )),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: Center(
                child: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20.h,
                  color: darkModeOn ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )),
            actions: [
              Padding(
                padding: EdgeInsets.only(left: 0, right: 17.w, top: 22.h),
                child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      color: bcolor1,
                      'images/sms filled.svg',
                      height: 50.h,
                      width: 50.w,
                      fit: BoxFit.contain,
                    )),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 80.h,
            width: width,
            decoration: const BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey),
            )),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 256.w,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                            borderSide: BorderSide(width: 0.5.w, color: uColor),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                            borderSide:
                                BorderSide(width: 0.5.w, color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                            borderSide:
                                BorderSide(width: 0.5.w, color: Colors.red),
                          ),
                          errorStyle: TextStyle(height: 0, fontSize: 12.sp),
                          hintText: 'Search message',
                          hintStyle: Theme.of(context)
                              .primaryTextTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 20.sp, fontWeight: FontWeight.w400),
                          contentPadding:
                              EdgeInsets.only(top: 10.h, left: 10.w),
                          prefixIcon: Transform.scale(
                              scale: 0.5,
                              child: SvgPicture.asset(
                                'images/search.svg',
                                color: darkModeOn ? Colors.white : Colors.black,
                              )),
                          // hintStyle: Theme.of(context).primaryTextTheme.subtitle1,

                          focusColor: uColor,
                          // focusColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Message requests',
                  style: TextStyle(
                      color: bcolor3,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: height,
              child: ListView.builder(
                itemCount: dmUsers.length,
                itemBuilder: (context, index) => DmList(
                    name: dmUsers[index].name,
                    username: dmUsers[index].username,
                    message: dmUsers[index].message,
                    imageURL: dmUsers[index].imageURL,
                    time: dmUsers[index].time,
                    isMessageOpened: (index == 0 || index == 3) ? true : false),
              ),
            ),
          ),

          // IconButton(onPressed: (){
          //   Navigator.push(context,MaterialPageRoute(builder: (context) => const Messages()));
          // }, icon: Icon(Icons.sms)),
        ],
      ),
    );
  }
}
