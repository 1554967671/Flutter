import 'package:flutter/material.dart';

class HotSport extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back,color: Colors.black,size: 28.0,),
        ),
        title: Text('热点资讯',style: TextStyle(
            color: Colors.black
        )),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: HotSportBody(),
    );
  }

}

class HotSportBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HotSportBodyState();
  }

}

class HotSportBodyState extends State<HotSportBody>{

  List<String> picList = ['https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg'];

  Widget _infoListItem (String title,List<String> picList,String editor){
    
    List<Widget> imgList = new List();

    for(var i=0;i<picList.length;i++){
      imgList
        ..add(Image.network(picList[i]));
    }

    //最外层背景区域
    return Container(
      height: 100.0,
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      color: Colors.white70,
      //居中
      child: Container(
        child: Row(
          children: <Widget>[

            //图片区域
            Container(
              width: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(picList[0]),
                    fit: BoxFit.fill,
                  )
              ),
            ),

            //文字描述区域
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        title,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      editor,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          //搜寻区域
          SearchBox(),
          //资讯列表区域
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
          _SetLine(),
          _infoListItem('这是一条最新的测试新闻信息而已测试新闻信息而已测试新闻信息而已',picList,'优客新闻'),
        ],
      ),
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

class _SetLine extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      height: 0.3,
      color: Colors.grey,
    );
  }
}







