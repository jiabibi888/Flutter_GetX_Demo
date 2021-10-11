import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: Center(
        child: Column(
          children: [
            Text(
              Get.arguments ?? "无参数传递过来"
            ),
            ElevatedButton(
              onPressed: () {
                //返回不带参数
                Get.back();

                // //返回带参数
                // Get.back(
                //   result: '返回的参数就是我'
                // );
            }, 
            child: Text('返回上一页'))
          ],
          )
        ),
    );
  }
}