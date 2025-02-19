import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BaseSizeExtra extends StatelessWidget {
  const BaseSizeExtra({
    super.key,
    required this.item,
    required this.thickness,
    required this.witdh,
  });

  final String item;
  final double thickness;
  final double witdh;

  @override
  Widget build(BuildContext context) {
    final thicknessBaseList = {
      'CR': [
        ThicknessBase(minBase: 700, maxBase: 750, weight: 5),
        ThicknessBase(minBase: 751, maxBase: 1050, weight: 4),
        ThicknessBase(minBase: 1051, maxBase: 1250, weight: 3),
        ThicknessBase(minBase: 1251, maxBase: 1550, weight: 2),
        ThicknessBase(minBase: 1551, maxBase: 2000, weight: 1),
      ],
      'PO': [
        ThicknessBase(minBase: 800, maxBase: 1199, weight: 3),
        ThicknessBase(minBase: 1200, maxBase: 1549, weight: 2),
        ThicknessBase(minBase: 1550, maxBase: 1849, weight: 1),
      ],
      'CGI': [
        CGIThicknessBase(minBase: 0, maxBase: 0, weight: 0),
      ],
    };
    final weightBaseList = {
      'CR': [
        WeightBase(minBase: 0.230, maxBase: 0.250, weight: 13),
        WeightBase(minBase: 0.251, maxBase: 0.270, weight: 12),
        WeightBase(minBase: 0.271, maxBase: 0.290, weight: 11),
        WeightBase(minBase: 0.291, maxBase: 0.319, weight: 10),
        WeightBase(minBase: 0.320, maxBase: 0.350, weight: 9),
        WeightBase(minBase: 0.351, maxBase: 0.399, weight: 8),
        WeightBase(minBase: 0.400, maxBase: 0.450, weight: 7),
        WeightBase(minBase: 0.451, maxBase: 0.499, weight: 6),
        WeightBase(minBase: 0.500, maxBase: 0.549, weight: 5),
        WeightBase(minBase: 0.550, maxBase: 0.599, weight: 4),
        WeightBase(minBase: 0.600, maxBase: 0.649, weight: 3),
        WeightBase(minBase: 0.650, maxBase: 0.699, weight: 2),
        WeightBase(minBase: 0.700, maxBase: 0.799, weight: 1),
        WeightBase(minBase: 0.800, maxBase: 0.899, weight: 0),
        WeightBase(minBase: 0.900, maxBase: 0.999, weight: -1),
        WeightBase(minBase: 1.000, maxBase: 1.749, weight: -2),
        WeightBase(minBase: 1.750, maxBase: 1.999, weight: -3),
        WeightBase(minBase: 2.000, maxBase: 2.300, weight: -4),
      ],
      'PO': [
        WeightBase(minBase: 1.191, maxBase: 1.340, weight: 4),
        WeightBase(minBase: 1.341, maxBase: 1.540, weight: 3),
        WeightBase(minBase: 1.541, maxBase: 1.740, weight: 2),
        WeightBase(minBase: 1.741, maxBase: 1.990, weight: 1),
        WeightBase(minBase: 1.991, maxBase: 2.540, weight: 0),
        WeightBase(minBase: 2.541, maxBase: 4.000, weight: -1),
        WeightBase(minBase: 4.001, maxBase: 6.000, weight: -2),
      ],
      'CGI': [
        CGIWeightBase(minBase: 700, maxBase: 761, weight: 2),
        CGIWeightBase(minBase: 762, maxBase: 913, weight: 1),
        CGIWeightBase(minBase: 914, maxBase: 1219, weight: 0),
        CGIWeightBase(minBase: 1220, maxBase: 1250, weight: 1),
        CGIWeightBase(minBase: 1251, maxBase: 1524, weight: 2),
        CGIWeightBase(minBase: 1525, maxBase: 2000, weight: 3),
      ],
    };

    return Column(
      children: [
        Text('$item EXTRA'),
        DataTable(
          decoration: BoxDecoration(color: Colors.white),
          border: TableBorder.all(),
          dataTextStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          headingTextStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
          horizontalMargin: 10,
          columnSpacing: 10,
          dataRowMinHeight: 10,
          columns: [
            DataColumn(label: Align(child: Text('T / W'))),
            ...thicknessBaseList[item]!.map((e) => DataColumn(label: Text(e.title))),
          ],
          rows: weightBaseList[item]!
              .map((row) => DataRow(cells: [
                    DataCell(Text(row.title)),
                    ...thicknessBaseList[item]!.map((e) {
                      var extraPrice = row.weight + e.weight;
                      if (extraPrice < 1) {
                        extraPrice = row.weight.abs() + e.weight;
                      }
                      return DataCell(Align(child: Text(extraPrice.toString())));
                    })
                  ]))
              .toList(),
        ),
      ],
    );
  }
}

class ThicknessBase {
  final int minBase;
  final int maxBase;
  final int weight;

  ThicknessBase({
    required this.minBase,
    required this.maxBase,
    required this.weight,
  });

  String get title {
    return '$minBase~$maxBase';
  }
}

class CGIThicknessBase extends ThicknessBase {
  CGIThicknessBase({
    required super.minBase,
    required super.maxBase,
    required super.weight,
  });

  @override
  String get title => 'Extra';
}

class WeightBase {
  final double minBase;
  final double maxBase;
  final int weight;

  WeightBase({
    required this.minBase,
    required this.maxBase,
    required this.weight,
  });

  String get title {
    final f = NumberFormat('0.000');
    return '${f.format(minBase)}~${f.format(maxBase)}';
  }
}

class CGIWeightBase extends WeightBase {
  CGIWeightBase({
    required super.minBase,
    required super.maxBase,
    required super.weight,
  });

  @override
  String get title {
    return '$minBase~$maxBase';
  }
}

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: SingleChildScrollView(
        child: Column(
          children: [
            BaseSizeExtra(
              item: 'PO',
              thickness: 100,
              witdh: 100,
            ),
            BaseSizeExtra(
              item: 'CR',
              thickness: 100,
              witdh: 100,
            ),
            BaseSizeExtra(
              item: 'CGI',
              thickness: 100,
              witdh: 100,
            ),
          ],
        ),
      ),
    ),
  );
}
