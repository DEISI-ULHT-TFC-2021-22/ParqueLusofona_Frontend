import 'dart:io';
import 'package:tfc/global/global.dart' as globals;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tfc/widgets/button_enter.dart';
import 'package:tfc/widgets/button_exit.dart';
import 'package:grpc/grpc.dart';
import '../src/generated/mobile.pbgrpc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton<int>(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 0,
                    child: Text('Mudar Password'),
                  ),
                  PopupMenuDivider(),
                  const PopupMenuItem(
                    value: 1,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ]),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: Text(
                          "Bem vindo(a),",
                          style: TextStyle(fontSize: size.height * 0.025),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                        child: Text(
                          "${globals.text}",
                          style: TextStyle(fontSize: size.height * 0.025),

                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.2,
              ),

              Row(
                children: <Widget>[
                  ButtonEnter(
                      text: "Entrar",
                      press: () async {
                        final channel = ClientChannel(
                          '10.0.2.2',
                          port: 7024,
                          options: const ChannelOptions(
                            credentials: ChannelCredentials.insecure(),
                          ),
                        );
                        final stub = MobileClient(channel);

                        try {
                          globals.mensagem = "A Processar...";
                          setState(() {
                          });
                          var response = await stub
                              .abrirCancela(Pedido()
                            ..cancelaEntrada = true
                            ..login = globals.text
                          );

                          globals.mensagem = response.toString();

                          setState(() {
                          });
                          print(globals.mensagem);
                        } catch (e) {
                          print('Caught error: $e');
                        }
                        await channel.shutdown();
                      }),

                  ButtonExit(
                      text: "Sair",
                      press: () async {
                        final channel = ClientChannel(
                          '10.0.2.2',
                          port: 7024,
                          options: const ChannelOptions(
                            credentials: ChannelCredentials.insecure(),
                          ),
                        );
                        final stub = MobileClient(channel);

                        try {
                          globals.mensagem = "A Processar...";
                          setState(() {
                          });

                          var response = await stub
                              .abrirCancela(Pedido()
                            ..cancelaEntrada = false
                            ..login = globals.text
                          );
                          globals.mensagem = response.toString();
                          setState(() {
                          });
                        } catch (e) {
                          print('Caught error: $e');
                        }
                        await channel.shutdown();
                      }),
                ],
              ),

              SizedBox(
                height: size.height * 0.10,
              ),

              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 60,
                ),
                child: Center(
                  child: Text(

                    globals.mensagem.replaceAll("mensagem: ", ""),
                    style: TextStyle(fontSize: size.height * 0.027),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

  onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.pushNamed(context, '/password');
        break;

      case 1:
        _write("");
        Navigator.pushNamed(context, '/login');
        break;
    }
  }

}

  _write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/username.txt');
    await file.writeAsString(text);
  }
