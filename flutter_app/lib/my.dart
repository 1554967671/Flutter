import 'package:flutter/material.dart';

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.camera_alt,color:Colors.black87),
              iconSize: 26.0,
              onPressed: (){}
          )
        ],
      ),
      body: Main(),
    );
  }

}


class Main extends StatelessWidget{

  Container _menuItem(String title,IconData icon,Color iconColor,double top, double bottom,GestureTapCallback onTap){
    return Container(
      margin: EdgeInsets.fromLTRB(0, top, 0, bottom),
      color: Colors.white70,
      child: ListTile(
        leading: Icon(icon,color: iconColor,),
        title: Text(title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
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
            width: 70.0,
            color: Colors.white70,
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white70,
            height: 100.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg'),
                radius: 28.0,
              ),
              title: Text('Alan'),
              subtitle: Text('优客号：007'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Column(
            children: <Widget>[
              _menuItem('支付',Icons.payment, Colors.green,10.0,10.0,()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context) => _Pay()))
              }),
              _menuItem('收藏',Icons.layers,Colors.blue[700],0,0,()=>{}),
              _setLine(),
              _menuItem('数据',Icons.trending_up,Colors.blue[700],0,0,()=>{}),
              _setLine(),
              _menuItem('提醒',Icons.access_alarm,Colors.blue,0,0,()=>{}),
              _menuItem('设置',Icons.settings,Colors.black38,10.0,0,()=>{}),
            ],
          )


        ],
      ),
    );
  }

}

class _Pay extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('支付',style: TextStyle(
          color: Colors.black
        )),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: InkWell(
          onTap: ()=>{Navigator.pop(context)},
          child: Icon(Icons.arrow_back,color: Colors.black,size: 28.0,),
        ),

      ),
      body: PayMain(),
    );
  }

}

// 付款和钱包区域
class PayMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            // 头部
            Container(
              padding: EdgeInsets.all(12.0),
              height: 146.0,
              //背景
              child: Container(
                //均分两个区域
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      // 添加点击效果并自定义样式
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(8.0),right: Radius.zero)
                        ),
                        child: InkWell(
                          onTap: (){},
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(8.0),right: Radius.zero),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 28.0, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Image.asset("images/scan.png",width: 40.0,height: 40.0,),
                                Text('收付款',style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),),
                              ],
                            ),
                          )
                        )
                      ),
                    ),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.horizontal(left: Radius.zero,right: Radius.circular(8.0))
                          ),
                          child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.horizontal(left: Radius.zero,right: Radius.circular(8.0)),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 28.0, 0, 0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset("images/qianbao.png",width: 40.0,height: 40.0,),
                                    Text('钱包',style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),),
                                    Text('￥2000.00',style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white70,
                                    ),),
                                  ],
                                ),
                              )
                          )
                      ),

                    ),
                  ],
                ),
              ),
            ),

            // 优客服务标题
            Container(
              padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
              //背景
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(8.0))
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                              child: Text(
                                '优客服务',
                                style: TextStyle(fontSize: 16.0,color: Colors.black),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _SetLine(),
            // 服务列表第一行
            Container(
              padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                              color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/xinyongka.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('信用卡还款',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/shoujichongzhi.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('手机充值',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/licaitong.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('理财通',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),


                  ],
                ),
              ),
            ),
            _SetLine(),

            // 服务列表第二行
            Container(
              padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/shenghuojiaofei.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('生活缴费',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/you.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('优币充值',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/chengshi.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('城市服务',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _SetLine(),

            // 服务列表第三行
            Container(
              padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/gongyi.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('优客公益',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/baoxian.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('保险服务',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              child: Container(
                                height: 110.0,
                              )
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 第三方服务标题
            Container(
              padding: EdgeInsets.fromLTRB(12.0,12.0,12.0,0),
              //背景
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(8.0))
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                child: Text(
                                  '第三方服务',
                                  style: TextStyle(fontSize: 16.0,color: Colors.black),
                                ),
                              )
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _SetLine(),
            // 第三方列表第一行
            Container(
              padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/jiudian.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('酒店',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/didi.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('滴滴出行',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/jingdong.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('京东购物',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),


                  ],
                ),
              ),
            ),
            _SetLine(),

            // 第三方列表第二行
            Container(
              padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/meituan.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('美团外卖',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/maoyan.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('电影演出赛事',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/dazhongdianping.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('吃喝玩乐',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _SetLine(),

            // 第三方列表第三行
            Container(
              padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/pdd.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('拼多多',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/mogujie.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('蘑菇街女装',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                    _WidthLine(),
                    Expanded(
                      child: Ink(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Container(
                                height: 110.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset("images/elem.png",width: 30.0,height: 30.0,),
                                    Container(
                                      height: 6.0,
                                    ),
                                    Text('饿了么外卖',style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black,
                                    ),)
                                  ],
                                ),
                              )
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              height: 20.0,
            ),

          ],
        ),
      ),
    );
  }

}

class _SetLine extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0,0,12.0,0),
      height: 0.2,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _WidthLine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.2,
      height: 110.0,
      color: Colors.grey,
    );
  }

}




