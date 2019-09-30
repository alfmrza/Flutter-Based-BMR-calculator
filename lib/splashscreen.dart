import 'package:flutter/material.dart';
import 'package:bmr_calculator/metricsystem.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/bmr.png', scale: 1),
              SizedBox(
                height: 20,
              ),
              new ProgressIndicator(),
            ]
          ),
        ),
      ),
    );
  }
}
class ProgressIndicator extends StatefulWidget {
  @override
  _ProgressIndicatorState createState() => new _ProgressIndicatorState();
}
class _ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value > 0.9) {
            //Nagivation to new page is here
        print('Login Success');
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (buildContext) => MetricSystem()));
          }
        });
      });
    controller.repeat();
  }
  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      width: 200,
      color: Colors.redAccent,
      child: LinearProgressIndicator(
        value: animation.value,
        backgroundColor: Colors.black,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
      ),
    ));
  }
}