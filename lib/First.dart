import 'package:flutter/material.dart';
import 'package:dscapp/Second.dart';
DateTime _selectedTime;
String _Time;

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('First'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Alert Dialog'),
                  onPressed: () {
                  showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('제목'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Alert Dialog입니다'),
                            Text('OK를 눌러 닫습니다'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }),
              RaisedButton(
                child: Text('Date Picker'),
                onPressed: () {
                  Future<DateTime> selectedDate = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2018),
                      lastDate: DateTime(2030),
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.light(), //라이트 테마 사용
                          child: child,
                        );
                      },
                  );
                  selectedDate.then((datetime) {
                    setState(() {
                      _selectedTime = datetime;
                    });
                  });
                },
              ),
              Text('$_selectedTime'),
              RaisedButton(
                child: Text('Time Picker'),
                onPressed: () {
                  Future<TimeOfDay> selectedTime = showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  selectedTime.then((timeOfDay) {
                    setState(() {
                      _Time = '${timeOfDay.hour}:${timeOfDay.minute}';
                    });
                  });
                },
              ),
              Text('$_Time'),
              RaisedButton(
                child: Text('다음페이지'), color: Colors.lightBlueAccent,
                onPressed: () async {
                  final result = await Navigator.pushNamed(context, '/second');
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