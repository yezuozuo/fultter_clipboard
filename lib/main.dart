import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new ClipboardRoute(),
        ),
      ),
    );
  }
}

class ClipboardRoute extends StatefulWidget {
  @override
  _ClipboardRouteState createState() => _ClipboardRouteState();
}

class _ClipboardRouteState extends State<ClipboardRoute> {
  Timer clipboardTriggerTime;
  String _str = '被复制的文字';

  final List<String> names = <String>[];

  void addItemToList(){
    setState(() {
      names.insert(0,this._str);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(_str),
            Builder(
              builder: (context) {
                return RaisedButton(
                  child: Text('获取复制的内容'),
                  onPressed: () async {
                    clipboardTriggerTime = Timer.periodic(
                      const Duration(seconds: 5),
                      (timer) {
                        Clipboard.getData('text/plain').then((clipboarContent) {
                          if (clipboarContent.text != null) {
                            setState(() {
                              this._str = clipboarContent.text;
                              addItemToList();
                            });
                          }
                        });
                      },
                    );
                  },
                );
              },
            ),
//            new Image.network(
//              'https://image.uisdc.com/wp-content/uploads/2018/12/uisdc-banner-20181214-6.jpg',
//            )
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Center(
                            child: Text('${index}.${names[index]}', style: TextStyle(fontSize: 18),)
                        ),
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}