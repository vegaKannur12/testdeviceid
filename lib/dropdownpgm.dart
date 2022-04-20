import 'package:flutter/material.dart';

class DropdownPgm extends StatefulWidget {
  const DropdownPgm({Key? key}) : super(key: key);

  @override
  State<DropdownPgm> createState() => _DropdownPgmState();
}

class _DropdownPgmState extends State<DropdownPgm> {
  String selected = "anu";
  List<String> items = ["anu", "graha", "appu"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: DropdownButton<String>(
            value: selected,
            items: items
                .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: GestureDetector(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page2(item: item,)),
                          );
                        }),
                        child: Text(item))))
                .toList(),
            onChanged: (item) {
              setState(() {
                if (item != null) selected = item;
              });
            }),
      )),
    );
  }
}

////////////////////////////////////////////////
class Page2 extends StatefulWidget {
  String? item;
   Page2({this.item});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text(widget.item.toString(),style: TextStyle(fontSize: 30),)),
      ),
    );
  }
}
