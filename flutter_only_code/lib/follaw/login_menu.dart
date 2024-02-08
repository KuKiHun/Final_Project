import 'dart:developer';

import 'package:final_project/follaw/my_page.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    // mariadb 연결 정보
    final settings = ConnectionSettings(
      host: '175.198.206.137',
      port: 3306,
      user: 'q',
      password: 'q',
      db: 'follaw',
    );

    final conn = await MySqlConnection.connect(settings);

    final id = _idController.text;
    final password = _passwordController.text;

    // users 테이블에서 아이디와 비밀번호 확인
    final results = await conn.query(
        'SELECT * FROM users WHERE user_id = ? AND user_pw = ?',
        [id, password]);

    if (results.isNotEmpty) {
      // 로그인 성공 session -> preferences
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString('user_id', id); // 사용자 아이디 저장
      await preferences.setString(
          'user_name', results.first['user_name']); // 사용자 이름 저장
      await preferences.setBool('isLoggedIn', true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyPage(user_id: id), // 사용자 아이디를 MyPage에 전달합니다.
        ),
      );
      log('로그인 성공');
    } else {
      // 로그인 실패
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('로그인 실패'),
            content: const Text('아이디와 비밀번호가 일치하지 않습니다.'),
            actions: <Widget>[
              TextButton(
                child: const Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _idController,
              decoration: const InputDecoration(
                labelText: '아이디',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '비밀번호',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
