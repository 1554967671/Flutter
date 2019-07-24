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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('好友圈',style: TextStyle(
                color: Colors.black
            )),
            leading: InkWell(
              onTap: ()=>{Navigator.pop(context)},
              child: Icon(Icons.arrow_back,color: Colors.black,size: 28.0,),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.camera_alt,color:Colors.black87),
                  iconSize: 26.0,
                  onPressed: (){}
              )
            ],
            backgroundColor: Colors.white12,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',fit: BoxFit.cover,),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',fit: BoxFit.fill,),
                                  )
                              ),
                            ),

                            // 昵称
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
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
                                    Container(
                                      child: Text(
                                        '测试中。。。',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 8.0, 20.0, 0),
                                      child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',fit: BoxFit.contain,),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    )
                  );
                },
                childCount: 1,
              ),
            ),
          ),

//          SliverFixedExtentList(
//            itemExtent: 50.0,
//            delegate: new SliverChildBuilderDelegate(
//                    (BuildContext context, int index) {
//                  //创建列表项
//                  return new Container(
//                    color: Colors.green,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Container(
//                          width: 60.0,
//                          height: 60.0,
//                          color: Colors.yellow,
//                          child: ClipOval(
//                            child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',fit: BoxFit.fill,),
//                          ),
//                        ),
//                      ],
//                    ),
//                  );
//                },
//                childCount: 2 //50个列表项
//            ),
//          ),
        ],
      ),
    );
  }

}



