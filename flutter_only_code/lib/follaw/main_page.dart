import 'package:final_project/follaw/cases_page.dart';
import 'package:final_project/follaw/login_menu.dart';
import 'package:final_project/follaw/news_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenTest extends StatefulWidget {
  final String? userName;

  const HomeScreenTest({Key? key, this.userName}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenTest> {
  String _getTitle() {
    // SharedPreferences에서 isLoggedIn 값 가져오기
    SharedPreferences.getInstance().then((prefs) {
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      if (isLoggedIn) {
        String username = prefs.getString('username') ?? '';
        setState(() {});
        return '안녕하세요, $username님';
      } else {
        setState(() {});
        return '홈';
      }
    });
    return '';
  }

  // final String? userName;
  // _HomeScreenState({this.userName});

  int _currentNewsIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    // 작업 실행 코드
  });
  Future<void> login() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    // 로그인 처리 로직

    // 로그인 성공 시 로그인 상태 저장
    await preferences.setBool('isLoggedIn', true);
  }

  List<String> newsList = [
    'News 1',
    'News 2',
    'News 3',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentNewsIndex);
    startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentNewsIndex < newsList.length - 1) {
        _currentNewsIndex++;
      } else {
        _currentNewsIndex = 0;
      }
      _pageController.animateToPage(
        _currentNewsIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('메뉴'),
            ),
            ListTile(
              title: const Text('판례 목록'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CasesScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('뉴스 목록'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()),
                  // MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
            ListTile(
              title: const Text('로그인 페이지'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: '검색',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(newsList[index]),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentNewsIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: newsList.map((news) {
              int index = newsList.indexOf(news);
              return Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentNewsIndex == index ? Colors.blue : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void showMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('메뉴'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 판례 목록으로 이동하는 코드 작성
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CasesScreen()),
                  );
                },
                child: const Text('판례 목록'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 법률 목록으로 이동하는 코드 작성
                  Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => LawListPage()),
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('법률 목록'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 로그인 페이지로 이동하는 코드 작성
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('로그인 페이지'),
              ),
            ],
          ),
        );
      },
    );
  }
}
