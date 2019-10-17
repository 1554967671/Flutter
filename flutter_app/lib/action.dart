import 'package:flutter/material.dart';
import 'trend.dart';
import 'hotsport.dart';
import 'web.dart';

class ActionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现',style: TextStyle(
            color: Colors.black38
        )),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: ActionBody(),
    );
  }

}

class ActionBody extends StatelessWidget{

  Container _actionItem(String title, IconData icon, Color iconColor,double top, double bottom, GestureTapCallback onTap) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, top, 0, bottom),
      color: Colors.white70,
      child: ListTile(
        leading: Icon(icon,color: iconColor,),
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right,),
        onTap: onTap,
      ),
    );
  }
  //绘制分割线
    Widget _setLine(){
      return Container(
        height: 0.2,
        child: Row(
          children: <Widget>[
            Container(
              width: 70.0,
              color: Colors.white70,
            ),
            Expanded(
              child: Container(
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _actionItem('好友圈', Icons.camera, Colors.blue[700], 0, 0, (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyTrend()));
          }),
          _actionItem('扫一扫', Icons.crop_free, Colors.blue[700], 10.0, 0, (){

          }),
          _setLine(),
          _actionItem('热点资讯', Icons.whatshot, Colors.red, 0, 0, (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HotSport()));
          }),
          _setLine(),
          _actionItem('优客课堂', Icons.local_library, Colors.green, 0, 0, (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewMain()));
          }),
          _actionItem('器件商城', Icons.store, Colors.yellow[900], 10.0, 0, (){

          }),
        ],
      ),
    );
  }

}



























