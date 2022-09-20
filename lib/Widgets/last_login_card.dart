import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastLoginCard extends StatelessWidget {
  const LastLoginCard({Key? key}) : super(key: key);
  final String device = 'iPhone 13';
  final String location = 'Lagos, Nigeria';
  final String lastSeen = 'Active now';

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    Completer<GoogleMapController> _controller = Completer();

    Future<void> _mapDialog(BuildContext context) {
      {
        return showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: Text('Login Activity'),
            children: [
              SingleChildScrollView(
                  child: GoogleMap(initialCameraPosition: _kGooglePlex)),
              /*title: Text("Show Alert Dialog Box"),
          content: Text("You have raised a Alert Dialog Box"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],*/
            ],
          ),
        );
      }
    }

    return ListTile(
      trailing: Icon(
        Icons.more_vert_sharp,
        size: 24,
        color: Theme.of(context).colorScheme.secondaryVariant,
      ),
      onTap: () => _mapDialog(context),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'images/location2.svg',
                width: 20.w,
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0.w),
                child: Text(location,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyText1!
                        .copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 32.0.w),
            child: Text(
              device,
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyText1!
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(left: 32.0.w),
        child: Text(
          'Active now',
          style: Theme.of(context)
              .primaryTextTheme
              .bodyText1!
              .copyWith(fontSize: 12.sp, color: Color(0xff11CDF3)),
        ),
      ),
    );
  }
}
