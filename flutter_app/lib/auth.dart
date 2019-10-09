import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("欢迎登陆",style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.close,color: Colors.black,size: 28.0,),
        ),
      ),
      body: AuthPageHome(),
      bottomNavigationBar: Container(
        height: 50.0,
        color: Colors.blue,
      ),
    );
  }
}

class AuthPageHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AuthPageHomeState();
  }
}

class _AuthPageHomeState extends State<AuthPageHome>{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      child: Column(
        children: <Widget>[
          //头像和账号
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160.0,
            color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 80.0,
                    color: Colors.deepPurpleAccent,
                  ),
                  Expanded(
                    child: Text("888"),
                  )
                ],
              ),
            )
          ),

          //指纹图标和描述
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160.0,
            color: Colors.green,
          )

        ],
      ),
    );
  }

}



















