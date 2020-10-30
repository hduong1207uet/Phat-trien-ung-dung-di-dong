
import 'package:flutter/material.dart';
import 'package:flutter_toeic_test_tflat/tflat_trang_chu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class tflat_part2 extends StatefulWidget {
  @override
  _tflat_part2State createState() => _tflat_part2State();
}

class _tflat_part2State extends State<tflat_part2> {

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
          ),

    );
  }
}
