import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
// TODO: 1.Deklarasi variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignedIn = false;
  bool _obsecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : 2. Pasang Appbar
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      //TODO : 3. Pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                // TODO: 4. Atur mainAxisAlignment dan crossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                //TODO : 9. Pasang TextFormField untuk nama 
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                ),
                //TODO : 5. Pasang TextFormField untuk pengguna
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Pengguna',
                    border: OutlineInputBorder(),
                  ),
                ),
                //TODO : 6. Pasang TextFormField untuk password
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obsecurePassword = !_obsecurePassword;
                        });
                      },
                      icon : Icon(_obsecurePassword ? Icons.visibility : Icons.visibility_off
                      ),
                    ), 
                  ),
                  obscureText: _obsecurePassword,
                ), 
                //TODO : 7. Pasang ElevatedButton untuk sign in
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () {}, child: const Text('Sign in'),
                ),
                //TODO : 8. Pasang TextButton untuk sign up
                const SizedBox(height: 20),
                // TextButton(
                //   onPressed: () {},
                //   child: const Text('Belum punya akun? Daftar disini'),
                // ),
                RichText(
                  text: TextSpan(
                    text: 'Sudah punya akun? ',
                    style: const TextStyle(fontSize: 16, color:Colors.deepPurple),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Masuk disini',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {},
                      )
                    ],
                  ),
                ),
            
            
                ],
              )),
          ),
        ),
      ),
    );
  }
}
