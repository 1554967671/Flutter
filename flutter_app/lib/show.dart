import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';

class ShowPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ShowPageState();
  }

}

class _ShowPageState extends State<ShowPage>{
  Timer timer;
  int _status = 0;
  int _time = 4;

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  void setTimer(){
    timer = new Timer(const Duration(milliseconds: 1000), () {
      try {
        if(_time == 1){
          _goMain();
        }else{
          setState(() {
            _time = _time - 1;
          });
          setTimer();
        }
      } catch (e) {
        print(e);
      }
    });
  }

  void _goMain(){
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => Homes()
        ), (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          //Offstage 用来控制是否显示
          Offstage(
            offstage: !(_status == 0),
            child: Image.asset(
              "images/youke.jpg",
              width: double.infinity,
              fit: BoxFit.fill,
              height: double.infinity,
            ),
          ),
          Offstage(
            offstage: !(_status == 0),
            child: Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  _goMain();
                },
                child: new Container(
                    padding: EdgeInsets.all(10.0),
                    child: new Text(
                      '跳过 $_time',
                      style: new TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                    decoration: new BoxDecoration(
                        color: Color(0x66000000),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        border: new Border.all(
                            width: 0.33,))),
              ),
            ),
          ),
        ],
      ),
    );

  }

}



