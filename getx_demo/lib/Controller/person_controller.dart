import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/model/person_model.dart';

class PersonController extends GetxController {
  //第一种
  var person = Person();

  void convertTpUpperCase() {
    person.name.value = person.name.value.toUpperCase();
  }

  var count = 0.obs;

  void increment() {
    count++;
  }

//监听事件
  @override
  void onInit() {
    //监听count的值，当它发生改变的时候调用
    ever(count, (callback) => debugPrint("ever------$count"));

    //监听多个值，当它们发生改变的时候调用
    everAll([count, person.name], (callback) => debugPrint("everAll-----$count----${person.name}"));

    //count值改变时调用，只执行一次
    once(count, (callback) => debugPrint("once------$count"));

    //当用户停止打字是1秒后调用，主要防止DDos
    debounce(count, (callback) => debugPrint("debounce------$count"));

    //忽略3秒内的所有变动
    interval(count, (callback) => debugPrint("interval------$count"));

    super.onInit();
  }

  @override
  void onReady() {
    debugPrint("加载完成");
    super.onReady();
  }

  @override
  void onClose() {
    debugPrint("控制器被释放");
    super.onClose();
  }
}