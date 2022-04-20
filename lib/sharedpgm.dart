import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpgm extends StatefulWidget {
  const Sharedpgm({Key? key}) : super(key: key);

  @override
  State<Sharedpgm> createState() => _SharedpgmState();
}

class _SharedpgmState extends State<Sharedpgm> {
  var idfetch;
  var idfetchresult;
  // TextEditingController con=TextEditingController();
  addToShare(String id)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('action', id);
    print("added----${id}");
  }

  fetch()async{
    final prefs = await SharedPreferences.getInstance();
    idfetch=await prefs.getString('action');
    return idfetch;
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   addToShare("jhhzx");
  //   idfetchresult=fetch();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
        children: [
            // TextField(),
            ElevatedButton(onPressed: ()async {
              // idfetchresult=await fetch();
               addToShare("jhhzx");
              // print("idddd----${idfetch}");
            }, child: Text("Register")),
   // Text("id : ${idfetchresult}"),
        ],
      ),
          )),
    );
  }
}


////////////////////////////////////////////////////
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child:Text("welcome------"),
        ),
      ),
    );
  }
}