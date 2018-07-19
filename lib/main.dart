import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var list;
  var random;
  var refreshKey=GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    random=Random();
    //list=List.generate(random.nextInt(10), (i)=>"Item $i");
      refreshList();
  }

  Future<Null> refreshList() async{
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      list=List.generate(random.nextInt(10), (i)=>"Item $i");
    });

    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Pull to refresh"),
      ),
      body: RefreshIndicator(
           key: refreshKey,
          child: ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context,i)=>ListTile(
                title: Text(list[i]),
              ),

          ),

          onRefresh: refreshList
      ),
    );
  }
}
