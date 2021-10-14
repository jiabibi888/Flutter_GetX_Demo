import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/Controller/person_controller.dart';
import 'package:getx_demo/model/person_model.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  var person = Person();

  // final person = Person(name: "Jabir", age: 18).obs;

  PersonController myController = Get.put(PersonController());

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: Center(
          child: Column(
        children: [
          Text(Get.arguments ?? "无参数传递过来"),
          ElevatedButton(
              onPressed: () {
                //返回不带参数
                Get.back();

                // //返回带参数
                // Get.back(
                //   result: '返回的参数就是我'
                // );
              },
              child: Text('返回上一页')),
          ElevatedButton(
              onPressed: () {
                // person.name.value = person.name.value.toUpperCase();

                // person.update((val) {
                //   person.value.name = person.value.name.toString().toUpperCase();
                // });

                //controller的形式
                myController.convertTpUpperCase();
                //测试controller监听
                myController.increment();

              },
              child: Text("转换为大写")),
          // Obx(() => Text(person.name.value))
          // Obx(() => Text(person.value.name))
          Obx(() => Text(myController.person.name.toString()))
        ],
      )),
    );
  }
}
