import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:aplikasi_comblangteam/screens/login/regis.dart';
import 'package:aplikasi_comblangteam/screens/nav/nav.dart';
import 'package:aplikasi_comblangteam/config/colors.dart';

class Login extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({Key? key}) : super(key: key);

  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/comblang.png'),
                ),
              ),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigasi ke halaman lupa password
                  },
                  child: const Text('Lupa Password?'),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username == 'admin' && password == 'admin') {
                    _logger.d('Login successful');

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Nav()),
                    );
                  } else {
                    _logger.d('Login Failed');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: k2AccentStroke,
                  foregroundColor: kBlack,
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum punya akun?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                      _logger.d('Sign Up pressed');
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
