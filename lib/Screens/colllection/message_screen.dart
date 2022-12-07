import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:grouped_list/grouped_list.dart';
import '../../constants.dart';
import 'package:intl/intl.dart';

List<Message> messages=[
  Message(text: 'Hi', date: DateTime.now(), isSentByme: true,),
  Message(text: 'hello', date: DateTime.now(), isSentByme: false,),
  Message(text: 'wsup', date: DateTime.now(), isSentByme: true,),
  Message(text: 'you good', date: DateTime.now(), isSentByme: false,),
  Message(text: 'naah', date: DateTime.now(), isSentByme: false,),
].reversed.toList();




class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    return Scaffold(
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
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Expanded(child: GroupedListView<Message, DateTime>(
      //       groupBy: (message)=>DateTime(
      //         message.date.year,
      //         message.date.month,
      //         message.date.day
      //       ),
      //       elements: messages,
      //       groupHeaderBuilder: (Message message)=>Center(
      //         child: SizedBox(
      //           height: 40.h,
      //           child: Card(
      //             color: bcolor3,
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Text(DateFormat.yMMMd().format(message.date),
      //                 style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(color: darkModeOn? Colors.grey:Colors.white,),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       itemBuilder: (context, Message message)=>Row(
      //         children:[
      //         Align(
      //           alignment: message.isSentByme?Alignment.centerRight: Alignment.centerLeft,
      //           child: Card(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(20.r)),
      //             ),
      //             color: message.isSentByme? uColor: Colors.grey.shade200,
      //             elevation: 0,
      //             child: Padding(padding: const EdgeInsets.all(20),
      //                 child: Text(message.text)
      //             ),
      //           ),
      //         ),
      //         ]
      //       ),
      //     )),
      //     Container(
      //       color: Theme.of(context).scaffoldBackgroundColor,
      //       child: TextFormField(
      //         decoration: InputDecoration(
      //           focusedBorder: UnderlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(6.r)),
      //               borderSide:BorderSide(
      //                 width: 2.w,
      //                 // color: _isvalid == true ? bcolor1: Colors.red),
      //                 color: Colors.red,
      //               )
      //           ),
      //           enabledBorder: UnderlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(6.r)),
      //               borderSide:BorderSide(
      //                 width: 2.w,
      //                 // color: _isvalid == true ? bcolor1: Colors.red),
      //                 color: Colors.red,
      //               )
      //           ),
      //           errorBorder: UnderlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(6.r)),
      //               borderSide:BorderSide(
      //                 width: 2.w,
      //                 // color: _isvalid == true ? bcolor1: Colors.red),
      //                 color: Colors.red,
      //               )
      //           ),
      //           focusedErrorBorder: UnderlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(6.r)),
      //               borderSide:BorderSide(
      //                 width: 2.w,
      //                 // color: _isvalid == true ? bcolor1: Colors.red),
      //                 color: Colors.red,
      //               )
      //           ),
      //           hintText: 'Type a message',
      //           hintStyle: TextStyle(color: uColor, fontSize: 19.sp, fontWeight: FontWeight.w400,),
      //           contentPadding: EdgeInsets.only(bottom: 10.h),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}






class Message {
  final String text;
  final DateTime date;
  final bool isSentByme;
  // final String ppic;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByme,
    // required this.ppic
  });

}