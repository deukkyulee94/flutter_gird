import 'package:flutter/material.dart';
import 'package:flutter_grid/steel/code_master.dart';

class TopDropDownButton extends StatefulWidget {
  const TopDropDownButton({super.key, required this.codeMaster});

  final CodeMaster codeMaster;

  @override
  State<TopDropDownButton> createState() => _TopDropDownButtonState();
}

class _TopDropDownButtonState extends State<TopDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.codeMaster.title),
        SizedBox(width: 10),
        DropdownButton(
          value: widget.codeMaster.detail.first.code,
          items: widget.codeMaster.detail
              .map((e) => DropdownMenuItem(
                    value: e.code,
                    child: Text(e.title),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
