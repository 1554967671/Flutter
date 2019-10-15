import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'login.dart';

class AuthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("指纹登陆",style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(builder: (context) => Homes()
                ), (route) => route == null);
          },
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

  @override
  void initState(){
    super.initState();
    _authenticate();
  }

  Future<void> _authenticate() async {
    final prefs = await SharedPreferences.getInstance();
    bool authenticated = false;
    try {
      const andStrings = const AndroidAuthMessages(
        cancelButton: '取消',
        goToSettingsButton: '去设置',
        fingerprintNotRecognized: '指纹识别失败',
        goToSettingsDescription: '请设置指纹.',
        fingerprintHint: '指纹',
        fingerprintSuccess: '指纹识别成功',
        signInTitle: '指纹验证',
        fingerprintRequiredTitle: '请先录入指纹!',
      );
      const iosStrings = const IOSAuthMessages(
        cancelButton: '取消',
        goToSettingsButton: '去设置',
        goToSettingsDescription: '请设置指纹.',
      );

      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: '扫描指纹进行身份验证',
          useErrorDialogs: true,
          androidAuthStrings: andStrings,
          iOSAuthStrings: iosStrings,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _authorized = authenticated ? '验证成功' : '验证失败';
    });
    prefs.setString("authorized", _authorized);
    if(_authorized == '验证成功'){
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => Homes()
          ), (route) => route == null);
    }
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
                      backgroundImage: AssetImage("images/alan.jpg"),
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
                            child: Icon(Icons.fingerprint,size: 70.0,color: _highlight ? Color(0xFF345E6E) : Colors.blue,),
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

  Widget setBottomBtn(String text, double fontSize, Color color){
    return Container(
      child: Center(
        child: Text(text,style: TextStyle(
          fontSize: fontSize,
          color: color,
        ),),
      ),
    );
  }

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
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: setBottomBtn("切换登陆方式",16.0,Colors.blue),
                    ),
                ),
                Container(
                  width: 0.2,
                  color: Colors.grey,
                ),
                Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: setBottomBtn("切换账号",16.0,Colors.blue),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

}
















