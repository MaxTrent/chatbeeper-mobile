import 'package:chat_beeper/Screens/colllection/beep.dart';
import 'package:chat_beeper/Screens/colllection/beep_create.dart';
import 'package:chat_beeper/Screens/colllection/room.dart';
import 'package:chat_beeper/Screens/colllection/tour_page.dart';
import 'package:chat_beeper/Widgets/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_beeper/Screens/colllection/timeline.dart';
import '../../constants.dart';
import 'dm.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'notifications.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  bool _istapped = false;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _pages = <Widget>[
    const Timeline(),
    const TourPage(),
    const WriteBeep(),
    const Notifications(),
    const Room(),
    // const DirectMessage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // _pages[_selectedIndex]
      _istapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          onTap: (index) {
            _selectedIndex = index;
            setState(() {});
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? SvgPicture.asset('images/home fill.svg')
                  : SvgPicture.asset('images/home.svg'),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? SvgPicture.asset('images/global fill.svg')
                  : SvgPicture.asset('images/global.svg'),
              label: 'Tour',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('images/message-add.svg'),
              label: 'Beep',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? SvgPicture.asset('images/notification fill.svg')
                  : SvgPicture.asset('images/notification 2.svg'),
              label: 'Notification',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? SvgPicture.asset(
                      'images/grid-9 fill.svg',
                    )
                  : SvgPicture.asset('images/grid-9.svg'),
              label: 'Room',
              backgroundColor: Colors.white,
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(builder: (context) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (context) {
                    return _pages[0];
                  },
                );
              case 1:
                return CupertinoTabView(
                  builder: (context) {
                    return _pages[1];
                  },
                );
              case 2:
                return CupertinoTabView(
                  builder: (context) {
                    return _pages[2];
                  },
                );
              case 3:
                return CupertinoTabView(
                  builder: (context) {
                    return _pages[3];
                  },
                );
              default:
                return CupertinoTabView(
                  builder: (context) {
                    return _pages[4];
                  },
                );
            }
            // return _pages[index];
          });
        });
    //   Scaffold(
    //   body: _pages[_selectedIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     showSelectedLabels: false,
    //     showUnselectedLabels: false,
    //     unselectedItemColor: Colors.grey,
    //     items:    <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home_filled),
    //         label: 'Home',
    //         backgroundColor: Colors.white,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.globe,size: 28,),
    //         label: 'Tour',
    //         backgroundColor: Colors.white,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.bubble_left,size: 28,),
    //         label: 'Beep',
    //         backgroundColor: Colors.white,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(CupertinoIcons.bell,size: 28,),
    //         label: 'Notification',
    //         backgroundColor: Colors.white,
    //       ),
    //       BottomNavigationBarItem(
    //         icon: _onItemTapped == false ? Icon(CupertinoIcons.square_split_2x1, size: 28,): Icon(CupertinoIcons.square_split_2x1_fill, size: 28,),
    //         label: 'Room',
    //         backgroundColor: Colors.white,
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     selectedItemColor: bcolor3,
    //     onTap: _onItemTapped,
    //   ),
    // );
  }
}
