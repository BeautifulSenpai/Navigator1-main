import 'package:flutter/material.dart';
import 'package:navigator/screens/api_data/api_data.dart';
import 'package:navigator/screens/components/button_global.dart';
import 'package:navigator/screens/components/text_form_global.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:navigator/screens/home_screen/home_screen.dart';
import 'package:navigator/screens/signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberController = TextEditingController();

  void loginUser() async {
    final String phoneNumberLogin = phoneNumberController.text;

    try {
      const String apiUrl = ApiData.loginUser;

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phoneNumber': phoneNumberLogin,
        }),
      );

      final responseData = jsonDecode(response.body);
      final String message = responseData['message'];

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        );
      }
    } catch (e) {
      showErrorMessage('Ошибка при отправке запроса');
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  void signUpUser() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 192, 128, 1),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Image.asset(
                'assets/images/logo.png',
                scale: 3,
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Пожалуйста, введите номер мобильного телефона',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(66, 56, 46, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              TextFormGlobal(
                controller: phoneNumberController,
                text: '7XXXXXXXXXX',
                obscure: false,
                textInputType: TextInputType.phone,
                inputFormatters: [PhoneNumberFormatter()],
              ),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                ),
              ),
              const SizedBox(height: 50.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    ButtonGlobal(
                      text: "Войти",
                      onTap: loginUser,
                    ),
                    const SizedBox(height: 20.0),
                    ButtonGlobal(
                      text: "Зарегистрироваться",
                      onTap: signUpUser,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
