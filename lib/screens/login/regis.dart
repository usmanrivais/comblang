import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:aplikasi_comblangteam/screens/login/login.dart';
import 'package:aplikasi_comblangteam/config/colors.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpScreen({Key? key}) : super(key: key);

  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
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
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  _performSignUp(username, email, password);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: k2AccentStroke,
                  foregroundColor: kBlack,
                ),
                child: const Text('Daftar'),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                      _logger.d('Sign In pressed');
                    },
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performSignUp(String username, String email, String password) {
    _logger.d('Sign Up: Username: $username, Email: $email, Password: $password');
    // Lakukan tindakan yang sesuai untuk pendaftaran
  }
}
