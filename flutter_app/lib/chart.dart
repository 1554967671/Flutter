import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据',style: TextStyle(
            color: Colors.black
        )),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.arrow_back,color: Colors.black,size: 28.0,),
        ),
      ),
      body: ChartInfo(),
    );
  }

}

class ChartInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChartInfoState();
  }
}

class _ChartInfoState extends State<ChartInfo>{

  @override
  Widget build(BuildContext context) {

    //获取饼状图
    Widget getPieChart(){
      //定义数据
      var data = [
        new ClicksPerYear('失败', 6, Colors.red),
        new ClicksPerYear('警告', 22, Colors.amber),
        new ClicksPerYear('通过', 468, Colors.green),
      ];
      //定义数据显示属性
      var series = [
        new charts.Series(
          domainFn: (ClicksPerYear clickData, _) => clickData.year,
          measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
          colorFn: (ClicksPerYear clickData, _) => clickData.color,
          id: 'Clicks',
          data: data,
        ),
      ];
      //获取饼状图
      var chart = new charts.PieChart(
        //数据源
        series,
        //是否显示动画
        animate: true,
        //图形设置
        behaviors: [
          //初始选择
          new charts.InitialSelection(
            selectedDataConfig: [
              new charts.SeriesDatumConfig('Clicks', 0),
            ],
          ),
          new charts.DatumLegend(
            //设置位置
            position: charts.BehaviorPosition.end,
            horizontalFirst: false,
            //单元的间隔
            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
            //是否显示测量值
            showMeasures: true,
            legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
            //设置位置
            outsideJustification: charts.OutsideJustification.endDrawArea,
            //定义数据描述
            measureFormatter: (num value) {
              return value == null ? '-' : '${value}';
            },
          ),
        ],
        //饼状图的显示环状的大小
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 40),
      );

      return chart;
    }

    //获取折线图
    Widget getLineChart(){
      //定义数据
      var lineDate = [
        new LineChart(new DateTime(2019, 10, 1), 23),
        new LineChart(new DateTime(2019, 10, 2), 45),
        new LineChart(new DateTime(2019, 10, 3), 58),
        new LineChart(new DateTime(2019, 10, 4), 52),
        new LineChart(new DateTime(2019, 10, 5), 69),
        new LineChart(new DateTime(2019, 10, 6), 65),
        new LineChart(new DateTime(2019, 10, 7), 78),
        new LineChart(new DateTime(2019, 10, 8), 96),
        new LineChart(new DateTime(2019, 10, 9), 91),
        new LineChart(new DateTime(2019, 10, 10), 95),
      ];
      var lineSeries = [
        new charts.Series(
            id: "Line",
            data: lineDate,
            domainFn: (LineChart lineDate,_)=>lineDate.day,
            measureFn: (LineChart lineDate,_)=>lineDate.count,
        )
      ];
      //获取上述数据的折线图
      var _lineChart = charts.TimeSeriesChart(lineSeries);

      return _lineChart;
    }

    Widget getBarChart(){
      //定义数据
      var barDate = [
        new BarChart("1", 5660),
        new BarChart("2", 7854),
        new BarChart("3", 9566),
        new BarChart("4", 5238),
        new BarChart("5", 7882),
        new BarChart("6", 6330),
        new BarChart("7", 9662),
      ];
      var barSeries = [
        new charts.Series(
            id: "Bar",
            data: barDate,
            domainFn: (BarChart barDate,_) => barDate.month,
            measureFn: (BarChart barDate,_) => barDate.count,
        ),
      ];
      //获取上述数据的柱状图
      var _barChar = charts.BarChart(barSeries);

      return _barChar;
    }


    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              height: 160.0,
              child: getPieChart(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              height: 300.0,
              child: getLineChart(),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              height: 300.0,
              child: getBarChart(),
            ),
          ],
        ),
      ],
    );
  }

}

//饼状图的数据对象
class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
//折线图的数据对象
class LineChart{
  final DateTime day;
  final int count;

  LineChart(this.day,this.count);
}
//柱状图的数据对象
class BarChart{
  final String month;
  final int count;

  BarChart(this.month,this.count);
}











