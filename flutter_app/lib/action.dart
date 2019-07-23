import 'package:flutter/material.dart';

class ActionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('发现',style: new TextStyle(
            color: Colors.black
        )),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: new ActionBody(),
    );
  }

}

class ActionBody extends StatelessWidget{

  Container _actionItem(String title, IconData icon,double top, double bottom, GestureTapCallback onTap) {
    return new Container(
      margin: EdgeInsets.fromLTRB(0, top, 0, bottom),
      color: Colors.white70,
      child: new ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right),
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
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          _actionItem('好友圈', Icons.camera, 0, 0, ()=>{}),
          _actionItem('扫一扫', Icons.crop_free, 10.0, 0, ()=>{}),
          _setLine(),
          _actionItem('热点资讯', Icons.whatshot, 0, 0, ()=>{}),
          _setLine(),
          _actionItem('优客课堂', Icons.local_library, 0, 0, ()=>{}),
          _actionItem('器件商城', Icons.store, 10.0, 0, ()=>{}),
        ],
      ),
    );
  }

}



























