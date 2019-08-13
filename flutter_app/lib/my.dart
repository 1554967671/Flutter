import 'package:flutter/material.dart';
import 'pay.dart';
import 'setting.dart';

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.camera_alt,color:Colors.black87),
              iconSize: 26.0,
              onPressed: (){}
          )
        ],
      ),
      body: Main(),
    );
  }

}


class Main extends StatelessWidget{

  Container _menuItem(String title,IconData icon,Color iconColor,double top, double bottom,GestureTapCallback onTap){
    return Container(
      margin: EdgeInsets.fromLTRB(0, top, 0, bottom),
      color: Colors.white70,
      child: ListTile(
        leading: Icon(icon,color: iconColor,),
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
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white70,
            height: 100.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg'),
                radius: 28.0,
              ),
              title: Text('Alan'),
              subtitle: Text('优客号：007'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Column(
            children: <Widget>[
              _menuItem('支付',Icons.payment, Colors.green,10.0,10.0,()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context) => Pay()))
              }),
              _menuItem('收藏',Icons.layers,Colors.blue[700],0,0,()=>{}),
              _setLine(),
              _menuItem('数据',Icons.trending_up,Colors.blue[700],0,0,()=>{}),
              _setLine(),
              _menuItem('提醒',Icons.access_alarm,Colors.blue,0,0,()=>{}),
              _menuItem('设置',Icons.settings,Colors.black38,10.0,0,()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()))
              }),
            ],
          )


        ],
      ),
    );
  }

}






