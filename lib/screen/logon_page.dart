import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogonPage extends StatefulWidget {
  const LogonPage({super.key});

  @override
  State<LogonPage> createState() => _LogonPageState();
}

class _LogonPageState extends State<LogonPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn()
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Autenticar com o Firebase Auth ou outra API de autenticação
      // Salvar dados do usuário no banco de dados interno
    } catch (error) {
      print('Erro ao fazer login com o Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login e Cadastro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _handleGoogleSignIn,
              child: Text('Entrar com o Google'),
            ),
            // Adicione os campos de login e cadastro aqui
          ],
        ),
      ),
    );
  }
}
