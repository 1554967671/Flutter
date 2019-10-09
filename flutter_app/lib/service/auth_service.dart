import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class AuthService{
  //加载本地认证框架对象
  final _auth = LocalAuthentication();
  //定义认证结果
  bool isAuthenticated = false;
  //开始认证
  Future<bool> authenticate() async {
    try{
      isAuthenticated = await _auth.authenticateWithBiometrics(
        localizedReason: 'authenticate to access',
        useErrorDialogs: true,
        stickyAuth: true
      );
    } on PlatformException catch (e) {
      print(e);
    }
    return isAuthenticated;
  }

}
