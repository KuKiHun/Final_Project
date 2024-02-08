// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class MyPage extends StatelessWidget {
  final String user_id;

  const MyPage({super.key, required this.user_id});

  Future<Map<String, dynamic>> fetchUserInfo() async {
    final settings = ConnectionSettings(
      host: '175.198.206.137',
      port: 3306,
      user: 'q',
      password: 'q',
      db: 'follaw',
    );

    final conn = await MySqlConnection.connect(settings);
    final results =
        await conn.query('SELECT * FROM users WHERE user_id = ?', [user_id]);
    await conn.close();

    if (results.isNotEmpty) {
      return results.first.fields;
    } else {
      throw Exception('No user found for that id');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('마이페이지'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final userInfo = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('이름: ${userInfo['user_name']}'),
                  Text('전화번호: ${userInfo['user_tel']}'),
                  Text('생년월일: ${userInfo['user_birth']}'),
                  Text('아이디: ${userInfo['user_id']}'),
                  Text('주소: ${userInfo['user_addr']}'),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // 현재 페이지를 닫고 이전 페이지로 돌아갑니다.
        },
      ),
    );
  }
}
