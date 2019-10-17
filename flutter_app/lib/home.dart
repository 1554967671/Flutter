import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('讯息',style: TextStyle(
          color: Colors.black
        )),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add,color: Colors.black),
              tooltip: '新增',
              iconSize: 28.0,
              onPressed: (){

              })
        ],
      ),
      body: HomeBody(),
    );
  }

}

class HomeBody extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          MsgItem(),
          MsgItem(),
          MsgItem(),
          MsgItem(),
          MsgItem(),
        ],
      ),
    );
  }

}


class MsgItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        color: Colors.white70,
        height: 86.2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //头像区域
            Container(
                width: 80.0,
                height: 80.0,
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/alan.jpg"),
                  radius: 0,
                )
            ),
            //数据信息
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //上部信息（标题和信息数）
                    Container(
                      height: 60.0,
                      child: Row(
                        children: <Widget>[
                          //标题
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    height: 28.0,
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '测试',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    height: 18.0,
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '这是最后一笔信息',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black54,
                                      ),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],

                              )
                          ),

                          //信息数量
                          Container(
                            width: 40.0,
                            height: 60.0,
                            child: Center(
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                    //下部信息（日期）
                    Container(
                      height: 26.0,
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "09:20",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

}