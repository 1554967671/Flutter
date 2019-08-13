import 'package:flutter/material.dart';

class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>{Navigator.pop(context)},
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
  @override
  Widget build(BuildContext context) {
    return new Container(

    );
  }

}



