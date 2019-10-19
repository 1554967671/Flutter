import 'package:flutter/material.dart';
// import 'package:azlistview/azlistview.dart';

class AddressBook extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text('通讯录',style: new TextStyle(
            color: Colors.black
        )),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.person_add,color: Colors.black),
              tooltip: '添加朋友',
              iconSize: 24.0,
              onPressed: (){}
          )
        ],
      ),
      body: AddBookBody(),
      resizeToAvoidBottomInset: false,
    );
  }

}

class AddBookBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _AddBookBodyState();
  }
}

class _AddBookBodyState extends State<AddBookBody>{

  //绘制菜单
  Widget _setMenuItem(String title,IconData icon,Color bgColor,GestureTapCallback onTap){
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        color: Colors.white70,
        child: Row(
          children: <Widget>[
            Container(
              width: 60.0,
              height: 60.0,
              child: Container(
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                width: 40.0,
                height: 40.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Icon(icon,size: 26.0,color: Colors.white,),
              ),

            ),
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),

          ],
        ),
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
            width: 75.0,
            color: Colors.white70,
          ),
          Expanded(
            child: Container(
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                //主列表区域
                Container(
                  child: Column(
                    children: <Widget>[
                      //搜寻区域
                      SearchBox(),
                      //菜单区域
                      _setMenuItem('新的朋友',Icons.person_add,Colors.yellow[800],(){}),
                      _setLine(),
                      _setMenuItem('讨论组',Icons.group,Colors.green[400],(){}),
                      _setLine(),
                      _setMenuItem('标签',Icons.local_offer,Colors.blue[600],(){}),
                      _setLine(),
                      _setMenuItem('企业号',Icons.confirmation_number,Colors.blue[600],(){}),

                    ],
                  ),
                ),

                //联系人
                Container(),

              ],
            ),

            //字母

          ],
        )
    );
  }
}

// 查询区域
class SearchBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56.0,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/1.05,
          height: 32.0,
          child: TextField(
            decoration: InputDecoration(
              hintText: '搜索',
              contentPadding: EdgeInsets.all(0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
      ),
    );
  }

}


//字母
class UserIndex extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return null;
  }
}

//联系人列表
class UserItem extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return null;
  }
}

