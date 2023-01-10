import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Xylophone"),
      ),
      body: SafeArea(
        child: Xylo() ,
      ),
    ),
  ));
}

class Xylo extends StatefulWidget {
  const Xylo({Key? key}) : super(key: key);

  @override
  State<Xylo> createState() => _XyloState();
}

class _XyloState extends State<Xylo> {
  var sound_name = 1;

  @override
  Widget build(BuildContext context) {
    List<Widget> mywidgets = [];
    var color_arr = [0,0xFF3949AB,0xFF00897B,0xFF5C6BC0,0xFFFFEB3B,0xFFD81B60,0xFF212121,0xFFFF1744];
    for(int x = 1; x<=7;x++){
      var col = color_arr[x];
      Color finalcol = new Color(col);
      mywidgets.add(
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0)
            ),
            child: Container(
              width: double.infinity,
              height: 100,
              color: finalcol,
            ),
            onPressed: ()async{
              final player = AudioPlayer();
              await player.play(AssetSource('sounds/assets_note$x.wav'));
            },
          )
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: mywidgets,
      ),
    );
  }
}

