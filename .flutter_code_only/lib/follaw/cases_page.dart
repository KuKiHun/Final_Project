import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:final_project/follaw/case_container.dart';
import 'package:final_project/follaw/case_vo.dart';
import 'package:http/http.dart' as http;

class CasesModel {
  final String name;
  final String number;
  final String serial;

  CasesModel({
    required this.name,
    required this.number,
    required this.serial,
  });
}

class CasesScreen extends StatefulWidget {
  const CasesScreen({super.key});

  @override
  _CasesScreenState createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  List<CasesModel> CasesList = [];

  @override
  void initState() {
    fetchCases();
    super.initState();
  }

  Future<void> fetchCases() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/esResult/1'));
    List<dynamic> esResultList;
    String esCount;
    if (response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      esResultList = jsonData['esResult'];
      esCount = jsonData['esCount'];
      log(esCount);
      setState(() {
        CasesList = esResultList
            .map((data) => CasesModel(
                  name: data['사건명'],
                  serial: data['판례일련번호'],
                  number: data['사건번호'],
                ))
            .toList();
      });
    } else {
      throw Exception('Failed to fetch news');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (CasesList.isEmpty) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('판례'),
          ),
          body: const Center(
            child: Text(
              '검색 결과가 없습니다.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('판례'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final cases = CasesList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CasesDetailScreen(caseNumber: cases.serial),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cases.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cases.serial,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          cases.number,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
