import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rms/SamplePagePortal.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginHome extends StatelessWidget {
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();

  //final _formKey = GlobalKey<FormState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> newlogin(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _controladorEmail.text, password: _controladorSenha.text);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SamplePagePortal()),
      );
    } catch (FirebaseAuthException) {
      const snackBar = SnackBar(
        content: Text('Autenticação Inválida.'),
        backgroundColor: Color(0xFFB71C1C),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 150,
          leading: Container(
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Image(
                    image: AssetImage("assets/images/image1.png"),
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xff041e42),
          title: Container(
            alignment: Alignment.bottomRight,
            child: AutoSizeText(
              'RMS-RIZZI MANAGEMENT SYSTEM',
              style: TextStyle(fontSize: 12),
              maxFontSize: 12,
              maxLines: 1,
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: 3,
            ),
            child: Image(
              image: AssetImage("assets/images/image2.png"),
              fit: BoxFit.contain,
              height: 390,
              width: 1000,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 400),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            controller: _controladorEmail,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "WorkSansLight",
                                  fontSize: 17.0),
                              filled: true,
                              fillColor: Colors.white24,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white24, width: 0.9)),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: const Color(0xff041e42),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    TextFormField(
                      obscureText: isHiddenPassword,
                      style: TextStyle(color: Colors.black),
                      controller: _controladorSenha,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "WorkSansLight",
                            fontSize: 17.0),
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: "Senha",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(90.0)),
                            borderSide:
                                BorderSide(color: Colors.white24, width: 0.9)),
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: const Color(0xff041e42),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 15),
                    ),
                    SizedBox(
                      height: 25,
                      width: 100,
                      child: ElevatedButton(
                          child: AutoSizeText('Entrar',
                              textAlign: TextAlign.center,
                              maxFontSize: 12,
                              maxLines: 2,
                              style: TextStyle(fontSize: 10)),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff041e42),
                            elevation: 15,
                            shape: BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          ),
                          onPressed: () => {newlogin(context)}),
                    ),
              SizedBox(
                height: 10,
              ),
                    SizedBox(
                      width: 400,
                        child: Container(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'Rizzi Consulting Ⓡ 2000|2023 Todos os Direitos Reservados',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 7),
                        maxLines: 2,
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
