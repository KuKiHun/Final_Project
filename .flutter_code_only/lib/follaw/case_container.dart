import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CasesDetailScreen extends StatelessWidget {
  final String caseNumber;
  // String sa;

  const CasesDetailScreen({Key? key, required this.caseNumber})
      : super(key: key);

  Future<void> fetchCases() async {
    final response = await http
        .get(Uri.parse('http://10.0.2.2:8080/esResult/number/$caseNumber'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      log(jsonData['사건번호']);
    } else {
      throw Exception('Failed to fetch news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('판례 상세보기'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('요약정보'),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('판례일련번호: $caseNumber'),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('사건명: ${jsonData['사건명']}'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('사건번호: ${precedent.caseNumber}'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('선고일자: ${precedent.judgmentDate}'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('법원명: ${precedent.courtName}'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('사건종류명: ${precedent.caseTypeName}'),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(8),
          //   child: Text('상세정보'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('판시사항: ${precedent.issueRaised}'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('판결요지: ${precedent.decisionSummary}'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('참조조문: ${precedent.referenceArticles}'),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Text('참조판례: ${precedent.referencePrecedents}'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     final url =
          //         'https://www.law.go.kr/LSW/precInfoP.do?precSeq=$caseNumber';
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => WebViewPage(url: url),
          //         ),
          //         );
          //   },
          //   child: const Text('전문조회'),
          // ),
        ],
      ),
    );
  }
}
