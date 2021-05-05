import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HeroDetail.dart';
import 'dart:math';

class AnimatedContainerSecondPage extends StatefulWidget {
  @override
  _AnimatedContainerSecondPageState createState() => _AnimatedContainerSecondPageState();
}
class _AnimatedContainerSecondPageState extends State<AnimatedContainerSecondPage> {
  var _isOn = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('쿠퍼티노 디자인2'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CupertinoSwitch(value: _isOn,
              onChanged: (bool value) {
                setState(() {
                  _isOn = value;
                });
              },
            ),
            CupertinoButton(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.lightBlue,
              child: Text('쿠퍼티노 AlertDialog'),
              onPressed: () {
                _showCupertinoDialog();
              },
            ),
            CupertinoButton(
              child: Text('쿠퍼티노 Picker'),
              onPressed: () {
                _showCupertinoPicker();
              },
            ),
            CupertinoButton(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.blueAccent,
              child: Text('이전 페이지'),
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/third');
                print(result);
              },
            ),
          ],
        ),
      ),
    );
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('제목'),
          content: Text('내용'),
          actions: <Widget>[
            CupertinoDialogAction(child: Text('Cancel')),
            CupertinoDialogAction(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        )
    );
  }

  _showCupertinoPicker() async {
    //0부터 9까지 숫자 리스트 생성
    final _items = List.generate(10, (i) => i);
    var result = _items[0];

    await showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
          height: 200.0, //피커의 높이
          child: CupertinoPicker(
            children: _items.map((e) => Text('No. $e')).toList(),
            itemExtent: 50.0, //항목 1개의 높이
            onSelectedItemChanged: (int value) {
              result = _items[value];
            },
          ),
        )
    );
    print(result);
  }
}