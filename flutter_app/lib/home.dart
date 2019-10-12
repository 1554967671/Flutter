import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('讯息',style: new TextStyle(
          color: Colors.black
        )),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add,color: Colors.black),
              tooltip: '新增',
              iconSize: 28.0,
              onPressed: (){

              })
        ],
      ),
      body: new HomeBody(),
    );
  }

}

class HomeBody extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new MsgItem(),
        ],
      ),
    );
  }

}

//class ShowSwiper extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    return _ShowSwiperState();
//  }
//}

//class _ShowSwiperState extends State<ShowSwiper>{
//  //声名一个list存放image Widget
//  List<Widget> imageList = List();
//
//  @override
//  void initState(){
//    imageList
//      ..add(Image.network(
//        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
//        fit: BoxFit.fill,
//      ))
//      ..add(Image.network(
//        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
//        fit: BoxFit.fill,
//      ))
//      ..add(Image.network(
//        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
//        fit: BoxFit.fill,
//      ))
//      ..add(Image.network(
//        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=190488632,3936347730&fm=26&gp=0.jpg',
//        fit: BoxFit.fill,
//      ));
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      width: MediaQuery.of(context).size.width,
//      height: 200.0,
//      child: Swiper(
//        itemCount: 4,
//        itemBuilder: _swiperBuilder,
//        pagination: SwiperPagination(
//          alignment: Alignment.bottomCenter,
//          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//          builder: DotSwiperPaginationBuilder(
//              color: Colors.black54,
//              activeColor: Colors.redAccent,
//              space: 6,
//          )
//        ),
//        controller: SwiperController(),
//        scrollDirection: Axis.horizontal,
//        autoplay: true,
//        control: SwiperControl(),
//        onTap: (index) => debugPrint('点击了第$index个'),
//      ),
//    );
//  }
//
//  Widget _swiperBuilder(BuildContext context,int index){
//    return (imageList[index]);
//  }
//}

class MsgItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new Container(
      color: Colors.white,
      width: size.width,
      height: 80.1,
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                  width: 80.0,
                  height: 80.0,
                  child: new Container(
                      padding: const EdgeInsets.all(10.0),
                      width:60.0,
                      child: new CircleAvatar(
                        backgroundImage: AssetImage("images/alan.jpg"),
                        radius: 0,
                      )
                  )
              ),
              new Expanded(
                  child: new Column(
                      children: <Widget>[
                        new Container(
                          height: 56.0,
                          color: Colors.yellow,
                          child: new Row(
                            children: <Widget>[
                              new Expanded(
                                  child: new ListTile(
                                    title: new Text(
                                      '测试',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                              ),
                              new Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 10.0, 0),
                                width: 20.0,
                                height: 20.0,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                        new Container(
                          height: 24.0,
                          color: Colors.green,
                        )
                      ],
                  )
              )
            ],
          ),
          new Container(
            height: 0.1,
            color: Colors.black,
          )
        ],
      )
    );
  }

}