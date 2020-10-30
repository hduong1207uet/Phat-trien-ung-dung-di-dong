import 'dart:async';
import 'package:firebase_database/firebase_database.dart';


Future<Map> loadCauHoi() async{
           Map answerMap = new Map();
           answerMap = await DuyetCauHoi();
           return answerMap;
}

Future<Map> DuyetCauHoi() {
         final databaseReference = FirebaseDatabase.instance.reference().child("CauHoi/part1/1");

         return Future.delayed(
               Duration(seconds: 1),
             () =>     databaseReference.once().then((DataSnapshot data) {return data.value;}),
         );
}