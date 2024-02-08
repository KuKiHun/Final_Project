class Precedent {
  String serialNumber; // 판례일련번호
  String caseName; // 사건명
  String caseNumber; // 사건번호
  DateTime judgmentDate; // 선고일자
  String courtName; // 법원명
  String caseTypeName; // 사건종류명
  String issueRaised; // 판시사항
  String decisionSummary; // 판결요지
  List<String> referenceArticles; // 참조조문
  List<String> referencePrecedents; // 참조판례

  Precedent({
    required this.serialNumber,
    required this.caseName,
    required this.caseNumber,
    required this.judgmentDate,
    required this.courtName,
    required this.caseTypeName,
    required this.issueRaised,
    required this.decisionSummary,
    required this.referenceArticles,
    required this.referencePrecedents,
  });

  dynamic operator [](String key) {
    switch (key) {
      case '사건명':
        return caseName;
      case '판례일련번호':
        return serialNumber;
      case '사건번호':
        return caseNumber;
      default:
        return null;
    }
  }
}
