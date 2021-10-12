import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
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