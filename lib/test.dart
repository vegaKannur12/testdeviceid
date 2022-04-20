import 'package:flutter/material.dart';
import 'package:tesdeviceid/components/customDatePicker.dart';
import 'package:tesdeviceid/components/customSnackbar.dart';
import 'package:tesdeviceid/components/customappbar.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  CustomSnackbar customsnackbar = CustomSnackbar();
  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  IconData? email;
  IconData? password;


  String textFieldvalue = "";
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(),
      ),
      body: Container(
        height: screenHeight-keyboardHeight,
        child: Column(
          children: [
            // Text("hellooo"),
            CustomDatePicker(),
            SizedBox(height: 20),
            Container(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    customsnackbar.customSnackbar(context);
                  },
                  child: Text("display snackbar")),
            ),
            email!=null?customTextField("username",controller1,email!):customTextField("username",controller1,null),
            password!=null?customTextField("Password",controller2,password!):customTextField("Password",controller2,null),
      
            ElevatedButton(
                onPressed: () {
                  print(controller1.text);
                  print(controller2.text);
                  
                },
                child: Text("display data")),
      
            Container(
              height: 20,
              child: Text(controller1.text)),
          ],
        ),
      ),
    );
  }

  Widget customTextField(String hinttext,TextEditingController controllerValue,IconData? iconString) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controllerValue,
          
          decoration: InputDecoration(
            prefixIcon: iconString!=null?Icon(iconString):null,
            hintText: hinttext.toString()),
        ),
      ),
    );
  }
}
//////////////////////////////////