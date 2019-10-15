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
        elevation: 0,
        backgroundColor: Color(0xFFB9D3EE),
      ),
      body: LoginHome(),
      bottomNavigationBar: BottomShow(),
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

  //显示密码明文的控制变量
  bool _showPass=false;
  //点击登陆按钮效果的控制变量
  bool _isDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB9D3EE), Color(0xFFE0EEEE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
      )),
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
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          autocorrect: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "用户名",
                            contentPadding: null,
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ],
                    )
                  ),

                  //密码
                  Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextField(
                                  autocorrect: true,
                                  obscureText: !_showPass,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock),
                                    hintText: "密码",
                                    contentPadding: null,
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Switch(
                                materialTapTargetSize: MaterialTapTargetSize.padded,
                                value: _showPass,
                                onChanged: (value) => setShowPass(value)
                            ),
                          )

                        ],
                      )
                  ),

                  //保忘记密码
                  Container(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: (){},
                              child: Text(
                                "免费注册",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            )
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: (){},
                              child: Text(
                                "忘记密码？",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            )
          ),

          //登陆按钮
          Container(
            height: 48.0,
            padding: EdgeInsets.only(left: 40.0,right: 40.0,top: 8.0),
            child: GestureDetector(
              onTapDown: isDown,
              onTapUp: isUp,
              onTapCancel: isCancel,
              child: Container(
                color: _isDown ? Colors.blue[400] : Colors.blue,
                child: Center(
                  child: Text(
                    "登 录",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0
                    ),
                  ),
                )
              ),
            ),
          ),

          //其他登陆方式
          Container(
            height: 150.0,
            padding: EdgeInsets.only(left: 40.0,right: 40.0,top: 40.0),
            child: Container(
              height: 150.0,
              child: Column(
                children: <Widget>[
                  //描述
                  Container(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 0.2,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "第三方账号登陆",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 0.2,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //显示第三方登陆按钮
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){},
                            child: Image.asset(
                              "images/wx_logo.png",
                              width: 48.0,
                              height: 48.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),



        ],
      ),
    );
  }

  void setShowPass(bool value){
    setState(() {
      _showPass = value;
    });
  }

  void isDown(TapDownDetails details){
    setState(() {
      _isDown = true;
    });
  }
  void isUp(TapUpDetails details){
    setState(() {
      _isDown = false;
    });
  }
  void isCancel(){
    setState(() {
      _isDown = false;
    });
  }


}

class BottomShow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE0EEEE),
      height: 30.0,
      child: Center(
        child: Text("Copyright © 2019 All Rights Reserved"),
      ),
    );
  }

}



