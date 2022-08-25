import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Text('Some other random content'),
            TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    'Posts',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Fotos',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            TabBarView(
              children: <Widget>[
                Center(
                  child: Text("User"),
                ),
                Center(
                  child: Text("Email"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
