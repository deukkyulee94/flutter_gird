import 'package:flutter/material.dart';
import 'package:flutter_grid/steel/code_master.dart';
import 'package:flutter_grid/steel/steel_price_grid.dart';
import 'package:flutter_grid/steel/top_drop_down_button.dart';

class SteelPricePage extends StatelessWidget {
  const SteelPricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스틸가'),
        actions: [
          TopDropDownButton(codeMaster: codeMaster.firstWhere((e) => e.code == 'maker')),
          SizedBox(width: 10),
          TopDropDownButton(codeMaster: codeMaster.firstWhere((e) => e.code == 'product')),
          SizedBox(width: 10),
          TopDropDownButton(codeMaster: codeMaster.firstWhere((e) => e.code == 'country')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SteelPriceGrid(),
      ),
    );
  }
}
