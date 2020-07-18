import 'package:flutter/material.dart';
import 'package:extended_dialog/extended_dialog.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SettingMenu()
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton SettingMenu() {
    var SettingMenu1 =  PopupMenuButton(
        color: Colors.white,
        icon:Icon(Icons.build),
        tooltip: 'Goto setting from here',
        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          PopupMenuItemExtended(
             child: Row(children: <Widget>[
            Expanded(flex: 5, child: Text("Settings",style: TextStyle (color:Color(0xFFA86E52) ),),)],),),
          PopupMenuDividerExtended(height: 10),
          PopupMenuItemExtended(
            child: Row(children: <Widget>[
              Expanded(flex: 5, child: Text("Settings",style: TextStyle (color:Color(0xFFA86E52) ),),)],),),
          PopupMenuDividerExtended(height: 10),
          PopupMenuItemExtended(
            child: Row(children: <Widget>[
              Expanded(flex: 5, child: Text("Settings",style: TextStyle (color:Color(0xFFA86E52) ),),)],),),
          PopupMenuDividerExtended(height: 10),
          PopupMenuItemExtended(
            child: Row(children: <Widget>[
              Expanded(flex: 5, child: Text("Settings",style: TextStyle (color:Color(0xFFA86E52) ),),)],),),
        ]);
    return SettingMenu1;

  }
}
