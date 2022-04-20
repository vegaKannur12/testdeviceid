import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:flutter/material.dart';
class MobileNumbercheck extends StatefulWidget {
  static var hasPhonePermission;

  const MobileNumbercheck({ Key? key }) : super(key: key);

  @override
  State<MobileNumbercheck> createState() => _MobileNumbercheckState();
}

class _MobileNumbercheckState extends State<MobileNumbercheck> {
  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  @override
  void initState() {
    super.initState();
    MobileNumber.listenPhonePermission((isPermissionGranted) {
      if (isPermissionGranted) {
        initMobileNumberState();
      } else {}
    });

    initMobileNumberState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    String mobileNumber = '';
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _mobileNumber = mobileNumber;
    });

    print("mobile-------${_mobileNumber}");
  }

  Widget fillCards() {
    List<Widget> widgets = _simCard
        .map((SimCard sim) => Text(
            'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
        .toList();
    return Column(children: widgets);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Center(
            child: Column(
              children: <Widget>[
                Text('Running on: $_mobileNumber\n'),
                fillCards()
              ],
            ),
          ),
     ), 
    );
  }
}