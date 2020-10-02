import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
     title: "Home TFLAT",
     home: Tflat_Home(),
));

class Tflat_Home extends StatelessWidget{
     @override
     Widget build(BuildContext context)
     {
          return Scaffold(
               appBar: AppBar(
                    leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: null),
                    title: Center(
                         child: Text("Cài đặt"),
                    ),
               ),
               body: Center(
                    child: Text("Phiên bản 1.27 \nTính năng mới\n"
                               "*Khắc phục lỗi dữ liệu Offline\n"
                               "*Cập nhật các thư mục từ của bạn\n"
                               "*Cập nhập game học từ vựng\n"
                               "*Cho phép tạo thư mục cho từ vựng" ,
                     style: TextStyle(fontSize: 18),
                     ),
               ),
               floatingActionButton: FloatingActionButton(
                    tooltip: "Thêm câu",
                    child: Icon(Icons.add),
                    onPressed: null,
               ),
          );
     }

}