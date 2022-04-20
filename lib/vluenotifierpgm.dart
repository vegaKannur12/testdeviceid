import 'package:flutter/material.dart';

class CheckValueNot extends StatelessWidget {
  CheckValueNot({Key? key}) : super(key: key);
  late ValueNotifier<int> counter = ValueNotifier(0);

  // @override
  // void initState() {
  //   super.initState();
  //   counter=ValueNotifier(0);
  //   ///whatever you want to run on page build
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (BuildContext context, int counterValue, Widget? child) {
                return Text("${counterValue}");
              },
            ),
            // Text(""),
            ElevatedButton(
              onPressed: () {
                counter.value = counter.value + 1;
              },
              child: Text("click"),
            ),
          ],
        ),
      )),
    );
  }
}
