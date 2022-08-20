import 'package:chat_beeper/constants.dart';
import 'package:flutter/material.dart'; import 'package:flutter_screenutil/flutter_screenutil.dart';

class DirectMessage extends StatefulWidget {
  const DirectMessage({Key? key}) : super(key: key);
  static const String id = 'Dm';

  @override
  State<DirectMessage> createState() => _DirectMessageState();
}

class _DirectMessageState extends State<DirectMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bcolor1,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Image.asset('images/logo1', height: 50, width: 50,),
      //   // title: Text(
      //   //   'Zeesta',
      //   //   style: TextStyle(
      //   //       fontSize: 22,
      //   //       fontWeight: FontWeight.bold,
      //   //       fontStyle: FontStyle.italic,
      //   //       color: Colors.white),
      //   // ),
      //   actions: [
      //     Icon(Icons.message_outlined, color: Colors.white, size: 18),
      //     SizedBox(
      //       width: 8,
      //     ),
      //     Icon(Icons.settings, color: Colors.white, size: 19),
      //     SizedBox(
      //       width: 15,
      //     )
      //   ],
      // ),
      body: Container(
        child: Column(
          children: [
            ListView.builder(  itemCount: 5,
                itemBuilder: (BuildContext context, int index,){
              return Column(
                children: [
                  Center(child: Text('data')),
                ],
              );
                }
      ),
          ],
        ),
      ),
    );
  }
}
