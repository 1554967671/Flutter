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
    var data = [
      new ClicksPerYear('2016', 6, Colors.red),
      new ClicksPerYear('2017', 22, Colors.amber),
      new ClicksPerYear('2018', 468, Colors.green),
    ];

    var series = [
      new charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];
    var chart = new charts.PieChart(
        series,
        animate: true,
        behaviors: [
          new charts.InitialSelection(
            selectedDataConfig: [
              new charts.SeriesDatumConfig('Clicks', 0),
            ],
          ),
          new charts.DatumLegend(
            //设置位置
            position: charts.BehaviorPosition.end,
            horizontalFirst: false,
            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
            showMeasures: true,
            legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
            outsideJustification: charts.OutsideJustification.endDrawArea,
            measureFormatter: (num value) {
              return value == null ? '-' : '${value}';
            },
          ),
        ],
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 40),
    );
    var chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          chartWidget,
        ],
      ),
    );
  }

}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

