import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';

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

  List<AddrInfo> _addrInfoList = List();
  int _susHeight = 40;
  int _itemHeight = 60;
  String _susTag = "";

  //绘制菜单
  Widget setMenuItem(String title,IconData icon,Color bgColor,GestureTapCallback onTap){
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
  Widget setLine(){
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

  //初始化数据
  @override
  void initState() {
    super.initState();
    loadDate();
  }

  //
  void loadDate() async {
    //加载通讯录列表
    rootBundle.loadString('assets/data/friends.json').then((value){
      Map itemMap = json.decode(value);
      List list = itemMap['friends'];
      list.forEach((value){
        _addrInfoList.add(AddrInfo(name: value['name']));
      });
      _handleList(_addrInfoList);
      setState(() {
        _susTag = _addrInfoList[0].getSuspensionTag();
      });
    });
  }

  //对数据进行处理
  void _handleList(List<AddrInfo> list){
    if(null == list || list.isEmpty) return;
    for(int i = 0, length = list.length; i < length; i++){
      //通过拼音插件将文字转换为拼音，若不能转换用#代替
      String pinyin = PinyinHelper.getPinyinE(list[i].name, separator: "", defPinyin: '#', format: PinyinFormat.WITHOUT_TONE);
      //获取第一个字的首字母
      String tag = pinyin.substring(0, 1).toUpperCase();
      //设置拼音
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {//设置标签
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    SuspensionUtil.sortListBySuspensionTag(list);
  }

  //改变标签函数
  void _onSusTagChange(String tag){
    setState(() {
     _susTag =  tag;
    });
  }

  //构建悬停Widget
  Widget _buildSusWidget(String susTag){
    return Container(
      height: _susHeight.toDouble(),
      padding: const EdgeInsets.only(left: 15.0),
      color: Colors.grey[200],
      alignment: Alignment.centerLeft,
      child: Text(
        '$susTag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }

  ///构建列表 item Widget.
  Widget _buildListItem(AddrInfo model) {
    return Column(
      children: <Widget>[
        Offstage(
          offstage: !(model.isShowSuspension == true),
          child: _buildSusWidget(model.getSuspensionTag()),
        ),
        SizedBox(
          height: _itemHeight.toDouble(),
          child: setMenuItem(model.name,Icons.person,Colors.blue[300],(){}),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: AzListView(
            header: AzListViewHeader(
                tag: "★",
                height: 300,
                builder: (context){
                  return Container(
                    child: Column(
                      children: <Widget>[
                        //搜寻区域
                        SearchBox(),
                        //菜单区域
                        setMenuItem('新的朋友',Icons.person_add,Colors.yellow[800],(){}),
                        setLine(),
                        setMenuItem('讨论组',Icons.group,Colors.green[400],(){}),
                        setLine(),
                        setMenuItem('标签',Icons.local_offer,Colors.blue[600],(){}),
                        setLine(),
                        setMenuItem('企业号',Icons.confirmation_number,Colors.blue[600],(){}),
                      ],
                    ),
                  );
                }
            ),
            data: _addrInfoList,
            itemBuilder: (context, model) => _buildListItem(model),
            suspensionWidget: _buildSusWidget(_susTag),
            isUseRealIndex: true,
            itemHeight: _itemHeight,
            suspensionHeight: _susHeight,
            onSusTagChanged: _onSusTagChange,
          ),
        )
      ],
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

//联系人的对象
class AddrInfo extends ISuspensionBean {

  String name;
  String tagIndex;
  String namePinyin;

  AddrInfo({
    this.name,
    this.tagIndex,
    this.namePinyin,
  });

  AddrInfo.fromJson(Map<String, dynamic> json) 
    : name = json['name'] == null ? "" : json['name'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'tagIndex': tagIndex,
    'namePinyin': namePinyin,
    'isShowSuspension': isShowSuspension
  };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => "AddrInfoBean {" + " \"name\":\"" + name + "\"" + '}';

}



