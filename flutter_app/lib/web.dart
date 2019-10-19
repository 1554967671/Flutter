import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WebBodyState();
  }
}

class _WebBodyState extends State<WebViewMain>{
  WebViewController _controller;
  String _title = "webview";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("$_title"),
      ),
      child: SafeArea(
          child: WebView(
            initialUrl: "https://www.baidu.com/",
            //js执行模式
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller){
              _controller = controller;
            },
            onPageFinished: (url){
              _controller.evaluateJavascript("document.title").then((result){
                setState(() {
                  _title = result;
                });
              });
            },
          )
      ),

    );
  }

}





















