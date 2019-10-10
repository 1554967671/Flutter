import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

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
      bottomNavigationBar: BottomSet(),
    );
  }
}

class AuthPageHome extends StatefulWidget{
  AuthPageHome({Key key,this.active: false}):super(key:key);

  //存放手指点击状态
  final bool active;

  @override
  State<StatefulWidget> createState() {
    return _AuthPageHomeState();
  }
}

class _AuthPageHomeState extends State<AuthPageHome>{

  bool _highlight = false;
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = '验证失败';

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _authorized = authenticated ? '验证成功' : '验证失败';
    });
  }
  void _handleTapDown(TapDownDetails details) {
    //定义点击函数
    setState(() {
      _highlight = true; //手指按下时将_highlight设置为true
    });
  }

  void _handleTapUp(TapUpDetails details) {
    //定义点击函数
    setState(() {
      _highlight = false; //手指拿起来时将_highlight设置为false
    });
    _authenticate();
  }

  void _handleTapCancel() {
    //定义点击函数
    setState(() {
      _highlight = false; //手指拿起来时将_highlight设置为false
    });
  }

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 80.0,
                    width: 80.0,
                    padding: const EdgeInsets.fromLTRB(10.0, 18.0, 10.0, 2.0),
                    child: new CircleAvatar(
                      backgroundImage: new NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg'),
                      radius: 0,
                    )
                  ),
                  Container(
                    height: 30.0,
                    child: Center(
                      child: Text("Alan",style: TextStyle(
                        fontSize: 16.0
                      ),),
                    ),
                  ),
                ],
              ),
            )
          ),

          //指纹图标和描述
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        height: 80.0,
                        width: 80.0,
                        child: Center(
                          child: GestureDetector(
                            onTapDown: _handleTapDown,
                            onTapUp: _handleTapUp,
                            onTapCancel: _handleTapCancel,
                            child: Icon(Icons.fingerprint,size: 70.0,color: _highlight ? Color(0xFF346E6E) : Colors.blue,),
                          )
                        ),
                    ),
                    Container(
                      height: 20.0,
                      child: Center(
                        child: Text("点击登陆",style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.blue
                        ),),
                      ),
                    ),
                  ],
                ),
              )
          )

        ],
      ),
    );
  }

}

class BottomSet extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _BottomSetState();
  }

}

class _BottomSetState extends State<BottomSet>{



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.2,
      child: Column(
        children: <Widget>[
          Container(
            height: 0.2,
            color: Colors.grey,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Container(
                      child: Center(
                        child: Text("切换登陆方式",style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),),
                      ),
                    )
                ),
                Container(
                  width: 0.2,
                  color: Colors.grey,
                ),
                Expanded(
                    child: Container(
                      child: Center(
                        child: Text("切换账号",style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),),
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

}
















