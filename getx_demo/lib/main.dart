import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/my_view.dart';

import 'home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   title: 'GetX',
    //   home: ObxCountExample(),
    // );

    //命名式路由导航
    return GetMaterialApp(
      title: 'GetX',
      initialRoute: "/",
      defaultTransition: Transition.rightToLeft,
      getPages: [
        GetPage(name: "/", page: () => ObxCountExample()),
        GetPage(name: "/home", page: () => HomeView()),
        GetPage(name: "/my", page: () => MyView(), transition: Transition.zoom)
      ],
      // home: ObxCountExample(),
    );
  }
}

// ignore: must_be_immutable
class ObxCountExample extends StatelessWidget {
  var count = 0.obs;

  ObxCountExample({Key? key}) : super(key: key);

  void incremet() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Obx---计数器'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text('count = $count')),
            SizedBox(height: 20),
            Obx(() => ElevatedButton(
                  child: Text('点我+$count'),
                  onPressed: () {
                    incremet();
                  },
                )),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    '标题', 
                    '使用SnackBar',
                    colorText: Colors.red, 
                    duration: Duration(seconds: 5)
                  );
                },
                child: Text("显示 Snackbar")
            ),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: '标题',
                    middleText: '内容',
                    textConfirm: '确定',
                    textCancel: '取消',
                    onConfirm: () {
                      debugPrint('确定');
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      debugPrint('取消');
                    }
                  );
                },
                child: Text("显示 Dialog")
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.wb_sunny_outlined),
                          title: Text('白天模式'),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.wb_sunny),
                          title: Text('黑夜模式'),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        )
                      ],
                    ),
                );
              }, 
              child: Text("Bottom Sheet")
            ),
            ElevatedButton(
              onPressed: () async {
                // //路由跳转
                // Get.to(Home());

                // //基本使用
                // Get.to(
                //   Home(),
                //   fullscreenDialog: true,
                //   transition: Transition.rightToLeft,
                //   duration: Duration(milliseconds: 2000),
                //   curve: Curves.easeInOut
                // );

                // //传递参数给下一个页面
                // Get.to(
                //   Home(),
                //   arguments: 'Hello GetX'
                // );

                // //接收上一个页面的数据
                // var data = await Get.to(
                //   Home(),
                //   arguments: 'Hello GetX'
                // );
                // print('我刚刚接受到了数据 $data');

                //命名路由跳转
                Get.toNamed("/home");
              }, 
              child: Text('跳转页面'))
          ],
        ),
      ),
    );
  }
}