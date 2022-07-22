import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tfc/global/global.dart' as globals;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  _write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/username.txt');
    await file.writeAsString("");
  }

  void _read() async {
    try {

      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/username.txt');
      bool fileExists = await File('${directory.path}/username.txt').exists();
      if (fileExists) {
        globals.text = await file.readAsString();
      } else {
        _write("");
      }
      await Future.delayed(const Duration(seconds: 2), (){});
      if(globals.text != "") {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/login');
      }
    } catch (e) {
      print("Couldn't read file");
    }
  }


  @override
  void initState() {
    super.initState();
    _read();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SpinKitSpinningLines(
              color: Colors.white,
              size: 100.0,
            ),

            SizedBox(
              height: size.height * 0.05,
            ),

            const Text(
              "Loading...",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            )
          ],
        ),

      ),
    );
  }
}
