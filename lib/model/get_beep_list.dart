import 'package:chat_beeper/model/get_beep_model.dart';

class BeepList {
  final List<GetBeepModel> beepList;

  BeepList({
    required this.beepList,
  });

  factory BeepList.fromJson(List<dynamic> json) {
    List<GetBeepModel> beepList = <GetBeepModel>[];
    beepList = json.map((i) => GetBeepModel.fromJson(i)).toList();

    return BeepList(
      beepList: beepList,
    );
  }
}
