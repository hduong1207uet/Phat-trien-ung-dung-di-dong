import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_toeic_test_tflat/tflat_part1.dart';
import 'package:flutter_toeic_test_tflat/tflat_part2.dart';
import 'package:flutter_toeic_test_tflat/tflat_part3.dart';
import 'tflat_trang_cai_dat.dart';

class tflat_trang_chu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(

        title: Center(
            child: Text("TOEIC Test TFLAT" ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child:Column(
          children: <Widget>[
            InkWell(
              onTap: (){
            },
            child : new Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)
              ),
              margin: EdgeInsets.symmetric(vertical: 5),
              color: Colors.white,
              elevation: 7,
              child: ListTile(
                // leading: const Icon(Icons.radio),
                leading: Image.asset("assets/images/tu-vung.png" ,height: 40 ,width: 40,),
                title: Text("Từ vựng TOEIC",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.lightBlue[800],
                  ),
                ),
              ),
            ), //Card tu vung
            ),

            InkWell(
            onTap: (){
              Navigator.push(context ,
                  MaterialPageRoute(builder: (context)=> tflat_part1())
              );
            },
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                // leading: const Icon(Icons.radio),
                leading: Image.asset("assets/images/part-1.png" ,height: 40 ,width: 40,),
                title: Text("TOEIC Test - part I",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.lightBlue[800]
                  ),
                ),
                subtitle: Text("Photographs"),

              ),
            ),// Card Part - 1
            ),

            InkWell(
            onTap: (){
              Navigator.push(context ,
                  MaterialPageRoute(builder: (context)=> tflat_part2())
              );
            },
            child : new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                // leading: const Icon(Icons.radio),
                leading: Image.asset("assets/images/part-2.png" ,height: 40 ,width: 40,),
                title: Text("TOEIC Test - part II",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.lightBlue[800]
                  ),
                ),
                subtitle: Text("Question & Response"),

              ),
            ),//Part 2-
            ),

            InkWell(
            onTap: (){
              Navigator.push(context ,
                  MaterialPageRoute(builder: (context)=> tflat_part3())
              );
            },
            child : new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                // leading: const Icon(Icons.radio),
                leading: Image.asset("assets/images/part-3.png" ,height: 40 ,width: 40,),
                title: Text("TOEIC Test - part III",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.lightBlue[800]
                  ),
                ),
                subtitle: Text("Short Conversation"),

              ),
            ),
            ),

            InkWell(
            onTap: (){
            //createRecord();
            },
            child : new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                // leading: const Icon(Icons.radio),
                leading: Image.asset("assets/images/part-4.png" ,height: 40 ,width: 40,),
                title: Text("TOEIC Test - part IV",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.lightBlue[800]
                  ),
                ),
                subtitle: Text("Short Talks"),

              ),
            ),
            ),

            InkWell(
            onTap: (){
            //createRecord();
            },
            child: new Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              color: Colors.white,
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                // leading: const Icon(Icons.radio),
                leading: Image.asset("assets/images/ngu-phap.png" ,height: 40 ,width: 40,),
                title: Text("Ngữ pháp TOEIC",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.lightBlue[800]
                  ),
                ),

              ),
            ),
            ),

            InkWell(
              onTap: (){
                   //createRecord();
              },
             child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                color: Colors.white,
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 7),
                child: ListTile(
                  // leading: const Icon(Icons.radio),
                  leading: Image.asset("assets/images/tu-vung-danh-dau.png" ,height: 40 ,width: 40),
                  title: Text("Từ vựng TOEIC đã đánh dấu",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.lightBlue[800]
                    ),
                  ),

                ),

              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context ,
                    MaterialPageRoute(builder: (context)=> tflat_trang_cai_dat())
                );
              },
              child: new Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                color: Colors.white,
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 7),
                child: ListTile(
                  // leading: const Icon(Icons.radio),
                  leading: Image.asset("assets/images/setting.png" ,height: 40 ,width: 40,),
                  title: Text("Cài đặt",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.lightBlue[800]
                    ),
                  ),
                ),

              ),
            )



          ],
        ),
      ),

    );
  }//end build Widget
} //class tflat_home

