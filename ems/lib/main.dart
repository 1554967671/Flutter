import 'package:flutter/material.dart';
import 'package:bottom_tab_bar/bottom_tab_bar.dart';
import 'home/home.dart';
import 'my/my.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'i10n/localization_intl.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'EMS',
    home: MainPage(),
    localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      AppLocalizationsDelegate(), //设置多语言
    ],
//    locale: const Locale('en', 'TW'),
    supportedLocales: [
      Locale('zh', 'CN'),
      Locale('zh', 'TW'),
      Locale('en', 'US'),
      // ... other locales the app supports
    ],

  ));
}

class MainPage extends StatefulWidget {

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  //定义展示页面的下标
  int _currentIndex = 0;
  //定义展示的页面列表
  final List<Widget> _children = [HomePage(),MyPage()];
  //定义底部导航列表
  List<BottomTabBarItem> getBottomList(BuildContext context){
    return [
      BottomTabBarItem(
          icon: Icon(Icons.home),
          title: Text(AppLocalizations.of(context).Home)
      ),
      BottomTabBarItem(
          icon: Icon(Icons.account_circle),
          title: Text(AppLocalizations.of(context).My)
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return getMainPage();
  }

  Widget getMainPage(){
    return Scaffold(
      body: Center(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomTabBar(
        type: BottomTabBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: getBottomList(context),
      ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

}
