import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class Searchdelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
   Transform.scale(
        scale: 0.5,
        child: GestureDetector(
            onTap: (){
            },
            child: SvgPicture.asset('images/search.svg', color: darkModeOn? Colors.white: Colors.black,)));
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    // TODO: implement buildResults
    Transform.scale(
        scale: 0.5,
        child: GestureDetector(
            onTap: (){
            },
            child: SvgPicture.asset('images/search.svg', color: darkModeOn? Colors.white: Colors.black,)));
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    Transform.scale(
        scale: 0.5,
        child: GestureDetector(
            onTap: (){
            },
            child: SvgPicture.asset('images/search.svg', color: darkModeOn? Colors.white: Colors.black,)));
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}