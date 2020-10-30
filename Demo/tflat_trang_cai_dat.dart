import 'package:flutter/material.dart';
import 'tflat_trang_chu.dart';

class  tflat_trang_cai_dat extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed:(){
              Navigator.push(context ,
                  MaterialPageRoute(builder: (context)=> tflat_trang_chu())
              );
            }
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Cài đặt",
            ),
          ],
        ),
      ),
      body:

      Center(
        child: Text("Phiên bản 1.27 \n\nTính năng mới\n"
            "*Khắc phục lỗi dữ liệu Offline\n"
            "*Cập nhật các thư mục từ của bạn\n"
            "*Cập nhập game học từ vựng\n"
            "*Cho phép tạo thư mục cho từ vựng\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
            "*Thông báo nhắc nhở học tập"
          ,
          style: TextStyle(fontSize: 18),
        ),

      ),



      floatingActionButton: FloatingActionButton(
        tooltip: "Thông báo",
        child: Icon(Icons.alarm_on),
        onPressed: null,
      ),
    );
  }
}