import 'package:flutter/material.dart';
import 'package:flutter_notification/SecondPage.dart';
import 'package:flutter_notification/notificationApi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    NotificationApi.init();
    listenNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }

  void listenNotification() =>
      NotificationApi.onNotifications.listen(onClickedNotification);

  void onClickedNotification(String? payload) => Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => SecondPage(
                  payload: payload,
                )),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('uygefgy'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => NotificationApi.showNotification(
                  title: 'Order Delay!',
                  body:
                      'Expected a Slight delay in your order due to covid-19s weekly LockDown In Kerala',
                  payload: 'sarah.abs',
                ),
                child: Text('Simple notification'),
              ),
              ElevatedButton(
                onPressed: () {
                  NotificationApi.showScheduleNotification(
                    title: 'Dinner',
                    body: 'Today at 6 Pm',
                    payload: 'dinner_6pm',
                    scheduledDate: DateTime.now().add(Duration(seconds: 5)),
                  );
                  final snackBar = SnackBar(
                    content: Text('Scheduled in 5 Seconds!'),
                    backgroundColor: Colors.teal,
                  );
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(snackBar);
                },
                child: Text('schedule notification'),
              ),
              ElevatedButton(
                onPressed: () {
                  NotificationApi.cancelAll();
                },
                child: Text('cancel notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
