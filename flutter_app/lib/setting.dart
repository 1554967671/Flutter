import 'package:flutter/material.dart';
import 'device.dart';
import 'auth.dart';

class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back,color: Colors.black,size: 28.0,),
        ),
        title: Text('设置',style: TextStyle(
            color: Colors.black
        )),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: _SettingBody(),
    );
  }

}

class _SettingBody extends StatelessWidget{

  Container _actionItem(String title, double top, double bottom, GestureTapCallback onTap) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, top, 0, bottom),
      color: Colors.white70,
      child: ListTile(
        title: Text(title,style: TextStyle(
          fontSize: 18.0,
        ),),
        trailing: Icon(Icons.keyboard_arrow_right,),
        onTap: onTap,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          _actionItem("账号与安全",0,0,(){}),
          _actionItem("新消息通知",10.0,0,(){}),
          _SetLine(),
          _actionItem("隐私",0,0,(){}),
          _SetLine(),
          _actionItem("通用",0,0,(){}),
          _actionItem("帮助与反馈",10.0,0,(){}),
          _SetLine(),
          _actionItem("关于设备",0,0,(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Device()));
          }),
          _actionItem("切换账号",10.0,0,(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage()));
          }),
          _actionItem("退出登陆",10.0,0,(){
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("提示"),
                content: Text("你确定要退出吗？"),
                actions: <Widget>[
                  new FlatButton(onPressed: (){ Navigator.of(context).pop();}, child: new Text("取消")),
                  new FlatButton(onPressed: (){}, child: new Text("确定")),
                ],
              )
            );
          }),
        ],
      ),
    );
  }

}

class _SetLine extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
      height: 0.1,
      color: Colors.black,
    );
  }
}

