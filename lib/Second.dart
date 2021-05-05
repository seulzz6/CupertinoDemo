import 'package:flutter/material.dart';
enum Gender {MAN, WOMEN}
Gender _gender = Gender.MAN;
var _isChecked = false;
final _valueList = ['첫 번째', '두 번째', '세 번째'];
var _selectedValue = '첫 번째';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('Second'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState (() {
                      _isChecked = value;
                    });
                  },
              ),
              SizedBox( height: 40,),
              Switch(
                  value: _isChecked,
                  onChanged: (value) { _isChecked = value; },
                  ),
              ListTile(
                title: Text('남자'),
                leading: Radio(
                  value: Gender.MAN,
                    groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  }),
              ),
              ListTile(
                title: Text('여자'),
                leading: Radio(
                    value: Gender.WOMEN,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    }),
              ),
              DropdownButton(
                value: _selectedValue,
                items: _valueList.map(
                        (value) {
                          return DropdownMenuItem (
                            value: value,
                            child: Text(value),
                          );
                        },
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
              ),
              RaisedButton(
                child: Text('이전페이지'), color: Colors.lightBlueAccent,
                onPressed: () async {
                  final result = await Navigator.pushNamed(context, '/first');
                  print(result);
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}