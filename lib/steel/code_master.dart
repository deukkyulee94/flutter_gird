class CodeMaster {
  final String code;
  final String title;
  final List<CodeDetail> detail;

  CodeMaster(this.code, this.title, this.detail);
}

class CodeDetail {
  final String code;
  final String title;

  CodeDetail(this.code, this.title);
}

final codeMaster = [
  CodeMaster(
    'maker',
    '메이커',
    [
      CodeDetail('posco', '포스코'),
      CodeDetail('hyundai', '현대제철'),
      CodeDetail('kg', 'KG스틸'),
      CodeDetail('donguk', '동국제강'),
      CodeDetail('tcc', 'TCC'),
    ],
  ),
  CodeMaster(
    'product',
    '제품',
    [
      CodeDetail('type1', '후판'),
      CodeDetail('type2', '열/냉/도금'),
    ],
  ),
  CodeMaster(
    'country',
    '국가',
    [
      CodeDetail('none', '구분없음'),
      CodeDetail('japen', '일본'),
      CodeDetail('daman', '대만'),
      CodeDetail('euro', '유럽'),
      CodeDetail('america', '미국'),
    ],
  ),
];
