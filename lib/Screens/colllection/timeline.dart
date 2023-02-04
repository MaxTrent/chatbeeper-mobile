import 'dart:convert';
import 'package:chat_beeper/provider/getBeep.dart';
import 'package:chat_beeper/utility/app_ui_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:chat_beeper/Screens/colllection/dm.dart';
import 'package:chat_beeper/Widgets/app_drawer.dart';
import 'package:chat_beeper/Widgets/post_imageless.dart';
import 'package:chat_beeper/model/get_beep_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Widgets/Post.dart';
import '../../constants.dart';
import '../../data/api_services.dart';
import '../../data/secure_storage.dart';

import '../drawer_pages/request_verification.dart';
import '../sponsor_duration.dart';


class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "@dhhdh",
    "@cjdvjvfj",
    "djjvj",
    "Pear",
    "Watdcjvjermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    )
    ;
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);
  static const String id = 'Timeline';

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  GetBeepController getBeepController = Get.put(GetBeepController());
  final _key = GlobalKey<ScaffoldState>();
  String fullName = 'Jane Doe';
  String username = 'Janedoe_10';
  bool _isLoading = false;
  bool _isSearching = false;
  List<GetBeepModel> futureBeep = [];
  var fetchProfile;
  @override
  void initState() {
    super.initState();
    getBeepCall();
  }

  void getBeepCall() async {
    futureBeep = await getBeepController.getBeep();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (futureBeep.isNotEmpty) {
        print('The beep contains ${futureBeep.length} items');
        setState(() {
          _isLoading = true;
        });
      }
    });
  }
  Future<void> fetchProfileCall() async {
    fetchProfile = await getProfile();
    print('This is the profile response $fetchProfile');
  }
  @override
  Widget build(BuildContext context) {

   // getBeepCall();

    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    var brightness = MediaQuery
        .of(context)
        .platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;

    ScreenUtil.init(
      context,
      designSize: const Size(485, 926),
    );
    print('this is the feedBeep');
    print(futureBeep);

    // return FutureBuilder<List<GetBeepModel>>(
    //     future: futureBeep,
    //     builder: (context, AsyncSnapshot snapshot) {
    //       if (snapshot.hasData) {
    //         return Text(snapshot.data[1].text);
    //       } else if (snapshot.hasError) {
    //         return Text('${snapshot.error}');
    //       }

    //       // By default, show a loading spinner.
    //       return const CircularProgressIndicator(
    //         strokeWidth: 5,
    //       );
    //     }
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size(428.w, 62.h),
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: uColor, style: BorderStyle.solid))),
          child: SafeArea(
            child: _isSearching ==false ? AppBar(
              leading: Padding(
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  height: 28.h,
                  child: GestureDetector(
                    onTap: () {
                     getBeepController.getBeep();
                      _key.currentState!.openDrawer();
                    },
                    child: CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0.r),
                        child: Image.asset('images/pp_round.png'),
                      ),
                    ),
                  ),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: SizedBox(
                    height: 34.h,
                    // width: 159.w,
                    child: SvgPicture.asset(
                      'images/chatbeeper_blue.svg',
                    )),
              ),
              centerTitle: true,
              backgroundColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
              elevation: 0.5,
              actions: [
                // SizedBox(width: 12.w,),
                Padding(
                  padding: EdgeInsets.only(top: 28.h, right: 20.w, bottom: 5.h),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Trending(),
                          ));
                      // showSearch(
                      //     context: context,
                      //     // delegate to customize the search bar
                      //     delegate: CustomSearchDelegate()
                      // );
                    },
                    child: darkModeOn == false
                        ? SvgPicture.asset(
                      color: Colors.black,
                      'images/search.svg',
                    )
                        : SvgPicture.asset(
                      color: Colors.white,
                      'images/search_dark.svg',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.h, right: 18.w, bottom: 5.h),
                  child: SizedBox(
                    height: 28.h,
                    width: 28.h,
                    child: Transform.scale(
                      scale: 1.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DirectMessage()));
                        },
                        child: darkModeOn == false
                            ? Stack(
                          children: [
                            SvgPicture.asset(
                              color: Colors.black,
                              'images/Dm.svg',
                            ),
                            Positioned(
                              left: 16.w,
                              child: Container(
                                height: 15.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.circular(100.r)),
                              ),
                            ),
                          ],
                        )
                            : Stack(
                          children: [
                            SvgPicture.asset(
                              color: Colors.white,
                              'images/sms.svg',
                            ),
                            Positioned(
                              left: 16.w,
                              child: Container(
                                height: 15.h,
                                width: 15.w,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.circular(100.r)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ): CupertinoSearchTextField(),
          ),
        ),
      ),
      body: (getBeepController.isLoading.value)?Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
              CircularProgressIndicator(),
              customText1('Loading...', Colors.black, 18.sp)
            ],
          ),
        ),
      ):ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                PostCard(),
                PostBeep(),
              ],
            );
          }),
      drawer: const AppDrawer(),
    );
  }

}

