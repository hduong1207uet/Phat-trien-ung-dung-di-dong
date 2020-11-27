
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toeic_test_tflat/tflat_trang_chu.dart';
import 'package:path_provider/path_provider.dart';


//Widget
class tflat_part1 extends StatefulWidget{
     @override
     _tflat_part1 createState() => _tflat_part1();
}

//State of Widget
class _tflat_part1 extends State<tflat_part1> {

//Dinh nghia cac bien
    int _groupValue = -1;
    var map1 = new Map();
    var dapAn = "";
    var numberOfSentence = 1;
    int numberOfImage = 1;

    AudioPlayer audioPlayer = new AudioPlayer();
    Duration duration = new Duration();
    Duration position = new Duration();
    bool playing  =  false;

//Thanh chay Audio
    Widget slider(){
      return Slider.adaptive(
          min : 0.0,
          value: position.inSeconds.toDouble(),
          max : duration.inSeconds.toDouble(),
          onChanged: (double value){
                  setState(() {
                        audioPlayer.seek(new Duration(seconds: value.toInt()));
                  });
          }
      );
    }

//Ham chay Local Audio
    Future<ByteData> loadAsset() async {
      return await rootBundle.load('assets/audio/part1-${numberOfSentence}.m4a');
    }
    void playLocal() async{
      final file = new File('${(await getTemporaryDirectory()).path}/part1-{$numberOfSentence}.m4a');
      await file.writeAsBytes((await loadAsset()).buffer.asUint8List());
      if(!playing){
        await audioPlayer.pause();
      }
      else {
        await audioPlayer.play(file.path, isLocal: true);
      }
      audioPlayer.onDurationChanged.listen((Duration dur) {
          setState(() {
            duration =  dur;
          });
      });
      audioPlayer.onAudioPositionChanged.listen((Duration dur) {
        setState(() {
            position = dur;
        });
      });
    }


//Khuon mau Radio Button
   Widget _myRadioButton({String title, int value, Function onChanged}) {
     return RadioListTile(
       value: value,
       groupValue: _groupValue,
       onChanged: onChanged,
       title: Text(title),

     );
   }

//Ham kiem tra dap an
   void KiemTraDapAn(int valueCheck) async{
     map1.clear();
     DatabaseReference databaseReference = await FirebaseDatabase.instance.reference().child("CauHoi/part1/${numberOfSentence}");
     databaseReference.once().then((DataSnapshot dataSnapshot) {
       setState(() {
         map1.addAll(dataSnapshot.value);
       });
     });
   }

  @override
  void initState(){
     super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => tflat_trang_chu())
              );
            },
          ),
          title: Text("Part 1 (${numberOfSentence}/198)"),
        ),

        body:Column(
          children: <Widget>[

            new Image.asset(
              'assets/images/part1/1-${numberOfImage}.png',
              width: 300,
              fit: BoxFit.cover,
            ),

            _myRadioButton(
              title: map1["cauD"] == null ? "A." : map1["cauA"].toString(),
              value: 1,
              onChanged: (newValue){
                setState(() {
                  _groupValue = newValue;
                  print(_groupValue);
                });
              },
            ),

            _myRadioButton(
              title: map1["cauD"] == null ? "B." : map1["cauB"].toString(),
              value: 2,
              onChanged: (newValue){
                setState(() {
                  _groupValue = newValue;
                  print(_groupValue);
                });
              },
            ),

            _myRadioButton(
              title: map1["cauD"] == null ? "C." : map1["cauC"].toString(),
              value: 3,
              onChanged: (newValue){
                setState(() {
                  _groupValue = newValue;
                  print(_groupValue);
                });
              },
            ),

            _myRadioButton(
              title: map1["cauD"] == null ? "D." : map1["cauD"].toString() ,
              value: 4,
              onChanged: (newValue){
                setState(() {
                  _groupValue = newValue;
                  print(_groupValue);
                });
              },
            ),

            Text(
              map1["dapAn"] == null ? "" : "Đáp án : ${map1["dapAn"].toString()}" , style: TextStyle(color: Colors.green ,fontSize: 18),
            ),

          ],
        ),

        //Bottom part - tu thanh chay Audio tro xuong
        bottomNavigationBar:
        Stack(
            children: [
              Container(
                height: 100,
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      color: Colors.white,
                      child: Center(child: slider(),),
                    ),
                    Container(
                      height: 70,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[

                          Container(
                            width: 205,
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              textDirection: TextDirection.ltr,
                              children: [
                                InkWell(
                                     child: Icon(
                                          playing == false
                                               ? Icons.play_circle_outline
                                               : Icons.pause_circle_outline,size: 44,
                                     ),
                                    onTap: (){
                                         playLocal();
                                         setState(() {
                                             playing = !playing;
                                         });
                                    },
                                ),
                                FlatButton(
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(10.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                           KiemTraDapAn(_groupValue);
                                  },
                                  child: Text(
                                    "Trả lời",
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                )

                              ],
                            ),
                          ),

                          Container(
                            width: 206,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [

                                  IconButton(
                                    onPressed: (){
                                      setState(() {
                                        map1.clear();
                                        numberOfSentence ++;
                                        numberOfImage++ ;
                                        dapAn = "";
                                        print(numberOfSentence);
                                      });

                                    },
                                    color: Colors.blue,
                                    icon: Icon(Icons.skip_next,size: 30,),
                                  ),
                                  IconButton(
                                    onPressed: (){
                                      setState(() {
                                        map1.clear();
                                        if(numberOfSentence > 1){
                                          numberOfSentence--;
                                          numberOfImage--;
                                          dapAn = "";
                                        }
                                        else{
                                        }
                                        print(numberOfSentence);
                                      });

                                    },
                                    color: Colors.blue,
                                    icon: Icon(Icons.skip_previous,size: 30,),
                                  ),
                                ],
                              ),
                            ),

                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]
        )

    );
  }


}



