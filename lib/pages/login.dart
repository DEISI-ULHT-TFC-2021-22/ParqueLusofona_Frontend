import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tfc/src/generated/login.pbgrpc.dart';
import 'package:tfc/widgets/rounded_button.dart';
import 'package:tfc/widgets/rounded_input_field.dart';
import 'package:tfc/widgets/rounded_password_field.dart';
import 'package:tfc/global/global.dart' as globals;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController textUsername = TextEditingController();

  TextEditingController textPassword = TextEditingController();

  String username = "";

  String pass = "";

  String error = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.10,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.03,
                    color: Colors.blue[900],
                  ),
                ),
                Image.asset(
                  'assets/lusofona-logo.jpg',
                  height: size.height * 0.35,
                ),
                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: size.height * 0.02,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                RoundedInputField(
                  label: "Nome utilizador",
                  hintText: "Nome utilizador",
                  onChanged: (value) {
                    username = value;
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RoundedPasswordField(
                  visible: true,
                  hint: "Senha",
                  onChanged: (value) {
                    pass = value;
                  },
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    final channel = ClientChannel(
                      '10.0.2.2',
                      port: 7024,
                      options: const ChannelOptions(
                        credentials: ChannelCredentials.insecure(),
                      ),
                    );
                    final stub = LoginClient(channel);

                    var login = await stub.loginRequest(LoginData()
                      ..login = username
                      ..password = _encrypt(pass)
                    );
                    if (login.loginEfetuado == true) {
                      _write(username);
                      globals.mensagem = "";
                      Navigator.pushNamed(context, '/home');
                    } else {
                      setState(() {
                        error = "Dados inválidos";
                      });
                    }
                    await channel.shutdown();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_write(String text) async {
  globals.text = text;
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/username.txt');
  await file.writeAsString(text);
}

_encrypt(String pass) {

  final key = encrypt.Key.fromUtf8("tfc_2022_frontend_daniel_manuel1");
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

  final encrypted = encrypter.encrypt(pass, iv: iv);
  return encrypted.base64;
}