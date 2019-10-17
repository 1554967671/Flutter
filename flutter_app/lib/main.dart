import 'package:flutter/material.dart';
import 'my.dart';
import 'addrbook.dart';
import 'home.dart';
import 'action.dart';
import 'show.dart';
import 'package:bottom_tab_bar/bottom_tab_bar.dart';

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

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My App',
    home: ShowPage(),
  ));
}
