import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 28.0,),
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: LoginHome(),
    );
  }

}

class LoginHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginHomeState();
  }

}

class _LoginHomeState extends State<LoginHome>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //Logo
          Container(
            height: 120.0,
            child: Center(
              child: Image.asset(
                "images/ykblogo.png",
                height: 70.0,
              ),
            ),
          ),
          //登陆框区域
          Container(
            height: 140.0,
            padding: EdgeInsets.only(left: 40.0,right: 40.0),
            child: Container(
              height: 106.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //用户名
                  Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            width: 0.2,
                            color: Colors.black,
                          )
                        )
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "请输入用户名",
                        contentPadding: EdgeInsets.all(0),
                        border: null,
                        //prefixIcon: Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                  ),

                  //密码
                  Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                              width: 0.2,
                              color: Colors.black,
                            )
                        )
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "请输入密码",
                        contentPadding: EdgeInsets.all(0),
                        border: null,
                        //prefixIcon: Icon(Icons.search),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                  ),

                ],
              ),
            )
          ),
        ],
      ),
    );
  }

}





