import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'my.dart';
import 'addrbook.dart';
import 'home.dart';
import 'action.dart';
import 'show.dart';
import 'pay.dart';
import 'package:bottom_tab_bar/bottom_tab_bar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Homes extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomesState();
  }
}

class _HomesState extends State<Homes>{
  int _currentIndex = 0;
  final List<Widget> _children = [HomePage(),AddressBook(),ActionPage(),MyPage()];
  final List<BottomTabBarItem> _list = <BottomTabBarItem>[
    BottomTabBarItem(
      icon: Icon(Icons.chat),
      title: Text('讯息'),
      badge: Container(
        width: 20,
        padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          '18',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    ),
    BottomTabBarItem(
        icon: Icon(Icons.assignment_ind),
        title: Text('通讯录')
    ),
    BottomTabBarItem(
        icon: Icon(Icons.explore),
        title: Text('发现')
    ),
    BottomTabBarItem(
        icon: Icon(Icons.account_circle),
        title: Text('我的')
    ),
  ];

  @override
  void initState() {
    super.initState();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid = AndroidInitializationSettings('defaultIcon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    new Timer(const Duration(milliseconds: 2000), () {
      _showNotification();
    });

  }

  //IOS
  Future<void> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Pay(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    //payload 可作为通知的一个标记，区分点击的通知。
    if(payload != null && payload == "complete") {
      await Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => Pay()),
      );
    }
  }

  Future _showNotification() async {
    //安卓的通知配置，必填参数是渠道id, 名称, 和描述, 可选填通知的图标，重要度等等。
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'default_notification', 'Default', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    //IOS的通知配置
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    //显示通知，其中 0 代表通知的 id，用于区分通知。
    await flutterLocalNotificationsPlugin.show(
        0, 'test', '测试', platformChannelSpecifics,
        payload: 'complete');
  }


  @override
  Widget build(BuildContext context) {
    return getHomePage();
  }

  Widget getHomePage(){
    return new Scaffold(
      body: new Center(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomTabBar(
        type: BottomTabBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: _list,
      ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main(){
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My App',
    home: ShowPage(),
  ));
}




