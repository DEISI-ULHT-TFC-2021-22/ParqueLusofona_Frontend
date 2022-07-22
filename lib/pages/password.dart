import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:tfc/src/generated/login.pbgrpc.dart';
import 'package:tfc/widgets/rounded_button.dart';
import 'package:tfc/widgets/rounded_password_field.dart';
import 'package:tfc/global/global.dart' as globals;

class Password extends StatefulWidget {
  Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {

  String username = globals.text;

  String oldpass = "";

  String newpass = "";

  String newpass2 = "";

  String mensagemPass = "";

  String error = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Mudar Senha"),
        ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                height: size.height * 0.05,
              ),

              Text(
                "Mudar Senha",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.03,
                  color: Colors.blue[900],
                ),
              ),

              Image.asset('assets/lusofona-logo.jpg',
                height: size.height * 0.25,
              ),

              RoundedPasswordField(
                hint: "Senha antiga",
                visible: false,
                onChanged: (value) {
                  oldpass = value;
                },
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              RoundedPasswordField(
                visible: false,
                hint: "Senha nova",
                onChanged: (value) {
                  newpass = value;
                },
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              RoundedPasswordField(
                visible: false,
                hint: "Confirmar senha nova",
                onChanged: (value) {
                  newpass2 = value;
                },

              ),

              RoundedButton(
                text: "MUDAR PASSWORD",
                press: () async {
                  final channel = ClientChannel(
                    '10.0.2.2',
                    port: 7024,
                    options: const ChannelOptions(
                      credentials: ChannelCredentials.insecure(),
                    ),
                  );
                  final stub = LoginClient(channel);

                  if (newpass == newpass2) {
                    var login = await stub.changePassword(
                        NewLoginData()
                          ..login = username
                          ..oldPass = _encrypt(oldpass)
                          ..newPass = _encrypt(newpass)
                    );

                  if(login.passAlterada == true) {
                    setState(() {
                      mensagemPass = "Senha alterada com sucesso";
                    });

                    await Future.delayed(const Duration(seconds: 1), (){});
                    Navigator.pushNamed(context, '/home');

                  } else {
                    setState(() {
                      mensagemPass = "Senha não alterada por dados incorretos";
                    });
                    }
                  } else {
                    setState(() {
                      mensagemPass = "Senha de confirmação não coincide";
                    });
                  }
                  await channel.shutdown();
                },
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              Text(
                mensagemPass,
                style: TextStyle(

                  color: mensagemPass == "Senha alterada com sucesso" ? (Colors.green) : (Colors.red),
                  fontSize: size.height * 0.025,
                ),
              )

              //Rounded(
              //text: "LOGIN",
              //press: () {},
              //)
            ],
          ),
        ),
      ),
    );
  }
}

_encrypt(String pass) {

  final key = encrypt.Key.fromUtf8("tfc_2022_frontend_daniel_manuel1");
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

  final encrypted = encrypter.encrypt(pass, iv: iv);
  return encrypted.base64;
}