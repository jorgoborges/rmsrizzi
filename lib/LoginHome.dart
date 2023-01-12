import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:rms/SamplePage.dart';





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
        MaterialPageRoute(builder: (_) => SamplePage()),
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
          leading: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  child: const Image(
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
            child: const AutoSizeText(
              'RMS-RIZZI MANAGEMENT SYSTEM',
              style: TextStyle(fontSize: 14.0),
              maxFontSize: 14.0,
              maxLines: 1,
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
              top: 3,
            ),
            child: const Image(
              image: AssetImage("assets/images/image2.png"),
              fit: BoxFit.contain,
              height: 200,
              width: 800,
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
                      padding: const EdgeInsets.only(top: 200),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            style: const TextStyle(color: Colors.black),
                            controller: _controladorEmail,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "WorkSansLight",
                                  fontSize: 14.0),
                              filled: true,
                              fillColor: Colors.white24,
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white24, width: 0.9)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xff041e42),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                    ),
                    TextFormField(
                      obscureText: isHiddenPassword,
                      style: const TextStyle(color: Colors.black),
                      controller: _controladorSenha,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: "WorkSansLight",
                            fontSize: 14.0),
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: "Senha",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(90.0)),
                            borderSide:
                                BorderSide(color: Colors.white24, width: 0.9)),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0xff041e42),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 5, top: 15),
                    ),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff041e42),
                            elevation: 15,
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          ),
                          onPressed: () => {newlogin(context)},
                          child: const AutoSizeText('Entrar',
                              textAlign: TextAlign.center,
                              maxFontSize: 14.0,
                              maxLines: 2,
                              style: TextStyle(fontSize: 14.0))),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                        width: 400,
                        child: Container(
                          alignment: Alignment.center,
                          child: const AutoSizeText(
                            'Rizzi Consulting Ⓡ 2000|2023 Todos os Direitos Reservados',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14.0),
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
