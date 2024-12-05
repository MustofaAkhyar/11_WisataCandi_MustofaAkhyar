import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

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

  bool _obsecurePassword = true;

// TODO: Membuat fungsi SingUp
  void _signUp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = _namaController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    prefs.setString('fulname', name);
    prefs.setString('username', username);
    prefs.setString('password', password);

    Navigator.pushReplacementNamed(context, '/signin');

    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          setState(() {
            _errorText = 
            'Minimal 8 Karekter, Kombinasi huruf besar, huruf kecil, angka, dan karakter spesial';
          });
          return;
        }
        if(name.isEmpty && username.isEmpty && password.isEmpty){
          final encrypt.Key key = encrypt.Key.fromLength(32);
          final iv = encrypt.IV.fromLength(16);

          final encrypter = encrypt.Encrypter(encrypt.AES(key));
          final encryptName = encrypter.encrypt(name, iv: iv);
          final encryptUsername = encrypter.encrypt(username, iv: iv);
          final encryptPassword = encrypter.encrypt(password, iv: iv);

          // Simpan data pengguna di SharedPreferences
          prefs.setString('fulname', encryptName.base64);
          prefs.setString('username', encryptName.base64);
          prefs.setString('password', encryptName.base64);
          prefs.setString('key', encryptName.base64);
          prefs.setString('iv', encryptName.base64);
        }
  }

  // TODO: Membuat fungsi dispose
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : 2. Pasang Appbar
      appBar: AppBar(
        title: const Text("Sign Up"),
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
                      icon: Icon(_obsecurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  obscureText: _obsecurePassword,
                ),
                //TODO : 7. Pasang ElevatedButton untuk sign up
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    _signUp();
                  },
                  child: const Text('Sign up'),
                ),
                //TODO : 8. Pasang TextButton untuk sign up
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Sudah punya akun? ',
                    style:
                        const TextStyle(fontSize: 16, color: Colors.deepPurple),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Masuk disini',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
