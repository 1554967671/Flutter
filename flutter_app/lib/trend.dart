import 'package:flutter/material.dart';

class MyTrend extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyTrendState();
  }

}

class _MyTrendState extends State<MyTrend>{

  List<Map<String,dynamic>> dataList = [
    {
      'userId':'U20180240',
      'headImg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
      'title':'测试标题1',
      'bodyImg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
      'chatList':[
        {
          'chatUserId':'U20180240',
          'chatUserName':'Alan',
          'chatUserImg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
          'chatDasc':'这是第一个评论',
          'chatTime':'2019-07-24',
        },
      ],
    },
    {
      'userId':'U20180240',
      'headImg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
      'title':'测试标题1',
      'bodyImg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
      'chatList':[
        {
          'chatUserId':'U20180240',
          'chatUserName':'Alan',
          'chatUserImg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
          'chatDasc':'这是第一个评论',
          'chatTime':'2019-07-24',
        },
      ],
    },
  ];

  Widget setHead(){
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context){
                          return new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new ListTile(
                                leading: new Icon(Icons.photo_camera),
                                title: new Text("拍一张"),
                                onTap: () async {

                                },
                              ),
                              new ListTile(
                                leading: new Icon(Icons.photo_library),
                                title: new Text("从手机相册中选择"),
                                onTap: () async {

                                },
                              ),
                            ],
                          );
                        }
                    );

                  },
                  child: Container(
                      height: 190.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg'),
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 170.0,
            right: 75.0,
            child: Text('Alan',style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),),
          ),
          Positioned(
            top: 150.0,
            right: 10.0,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                    image: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            brightness: Brightness.light,
            title: Text('好友圈',style: TextStyle(
                color: Colors.black
            )),
            leading: InkWell(
              onTap: (){Navigator.pop(context);},
              child: Icon(Icons.arrow_back,color: Colors.black,size: 28.0,),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.camera_alt,color:Colors.black87),
                  iconSize: 26.0,
                  onPressed: (){}
              )
            ],
            backgroundColor: Color(0xFFFCFCFC),
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: setHead(),
            ),
            pinned: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList( //List
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,//水平
                          children: <Widget>[
                            // 头像
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: 60.0,
                                  height: 60.0,
                                  child:  ClipOval(
                                    child: Image.asset('images/alan.jpg'),
                                  )
                              ),
                            ),

                            // 内容
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,//水平
                                  children: <Widget>[
                                    // 名称
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                                      height: 30.0,
                                      child: Text(
                                        'Alan',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          decoration: TextDecoration.none,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                    ),

                                    // 文字描述
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                      child: Text(
                                        '测试中123456789123456789456135498765456464354FFF。。。',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    // 图片
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 8.0, 20.0, 0),
                                      child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',fit: BoxFit.contain,),
                                    ),

                                    // 日期和操作按钮
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 2.0, 10.0, 0),
                                      height: 28.0,
                                      child: Row(
                                        children: <Widget>[
                                          //显示时间
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text('1小时前',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  decoration: TextDecoration.none,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            ),
                                          ),

                                          //操作按钮
                                          Container(
                                            child: Material(
                                              child: Container(
                                                width: 28.0,
                                                height: 16.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius: BorderRadius.circular(4.0),
                                                ),
                                                child: PopupMenuButton<String>(
                                                    onSelected: (String value){

                                                    },
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                          backgroundColor: Color(0xFF651FFF),
                                                          radius: 2.0,
                                                        ),
                                                        CircleAvatar(
                                                          backgroundColor: Color(0xFF651FFF),
                                                          radius: 2.0,
                                                        ),
                                                      ],
                                                    ),
                                                    padding: EdgeInsets.zero,
                                                    itemBuilder: (BuildContext context) =><PopupMenuItem<String>>[
                                                      PopupMenuItem(
                                                          value:"赞",
                                                          child: ListTile(
                                                            leading: Icon(Icons.favorite_border),
                                                            title: Text('赞'),
                                                          )
                                                      ),
                                                      PopupMenuItem(
                                                          value: "评论",
                                                          child: ListTile(
                                                            leading: Icon(Icons.chat_bubble_outline),
                                                            title: Text('评论'),
                                                          )
                                                      )
                                                    ]
                                                ),
                                              ),
                                            )
                                          )
                                        ],
                                      ),
                                    ),

                                    // 三角
                                    Container(
                                      padding: EdgeInsets.only(left: 8.0),
                                      height: 14.0,
                                      child: Image.asset('images/icon-up.png'),
                                    ),

                                    // 点赞区域
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                      child: Container(
                                        color: Color(0xFFF5F5F5),
                                        padding: EdgeInsets.all(2.0),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Wrap(//自动换行
                                                spacing: 4.0,
                                                crossAxisAlignment: WrapCrossAlignment.center,
                                                children: <Widget>[
                                                  Icon(Icons.favorite_border,size: 20.0,color: Colors.indigo,),
                                                  Text(
                                                    'Alan',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.none,
                                                      color: Colors.indigo,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    ',',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.none,
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Jack',
                                                    style: TextStyle(
                                                      decoration: TextDecoration.none,
                                                      color: Colors.indigo,
                                                      fontSize: 16.0,
                                                    ),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),


                                    //评论区域
//                                    Container(
//                                      padding: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
//                                      child: Container(
//                                        child: Column(
//                                          children: <Widget>[
//                                            Container(
//                                              height: 0.6,
//                                              color: Colors.white70,
//                                            ),
//                                            Container(
//                                              height: 40.0,
//                                              color: Color(0xFFF5F5F5),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                        //底线
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 15.0, 0, 10.0),
                          height: 0.4,
                          color: Colors.grey,
                      ),

                      ],
                    )
                  );
                },
                childCount: 3,
              ),
            ),
          ),




        ],
      ),
    );
  }

  void showInSnackBar(String value){
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('你选择的是$value')));
  }

}



