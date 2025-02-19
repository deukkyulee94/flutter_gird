import 'package:flutter/material.dart';
import 'package:flutter_grid/steel/base_size_extra.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

class SteelPriceGrid extends ConsumerStatefulWidget {
  const SteelPriceGrid({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SteelPriceGridState();
}

class _SteelPriceGridState extends ConsumerState<SteelPriceGrid> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'CUSTOMER',
      field: 'customer',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'PORT',
      field: 'port',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'ITEM',
      field: 'item',
      type: PlutoColumnType.select([
        'PO',
        'CR',
        'CGI',
      ]),
    ),
    PlutoColumn(
      title: 'SPEC',
      field: 'spec',
      type: PlutoColumnType.select([
        'CR3 SPCD',
      ]),
    ),
    PlutoColumn(
      title: 'THICKNESS',
      field: 'thickness',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'WIDTH',
      field: 'width',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'SIZE' + String.fromCharCode(0x10) + 'EXTRA',
      field: 'size_extra',
      type: PlutoColumnType.number(),
      readOnly: true,
      renderer: (rendererContext) {
        final _row = rendererContext.row;

        return Tooltip(
          richMessage: WidgetSpan(
              child: BaseSizeExtra(
            item: _row.cells['item']!.value.toString(),
            thickness: int.parse(_row.cells['thickness']!.value.toString()),
            witdh: int.parse(_row.cells['width']!.value.toString()),
          )),
          child: Text(rendererContext.cell.value.toString()),
        );
      },
    ),
  ];

  final List<PlutoColumnGroup> columnGroups = [
    PlutoColumnGroup(title: 'SIZE (MM)', fields: ['thickness', 'width']),
  ];

  @override
  Widget build(BuildContext context) {
    final List<PlutoRow> rows = [
      PlutoRow(
        cells: {
          'customer': PlutoCell(value: ''),
          'port': PlutoCell(value: ''),
          'item': PlutoCell(value: 'CR'),
          'spec': PlutoCell(value: 'CR3 SPCD'),
          'thickness': PlutoCell(value: 300),
          'width': PlutoCell(value: 300),
          'size_extra': PlutoCell(value: 100),
          // 'joined': PlutoCell(value: '2021-01-01'),
          // 'working_time': PlutoCell(value: '09:00'),
        },
      ),
    ];
    return PlutoGrid(
      columns: columns,
      rows: rows,
      columnGroups: columnGroups,
      // onLoaded: (PlutoGridOnLoadedEvent event) {
      //   stateManager = event.stateManager;
      //   stateManager.setShowColumnFilter(true);
      // },
      onChanged: (PlutoGridOnChangedEvent event) {
        print(event);
      },
      configuration: const PlutoGridConfiguration(),
    );
  }
}
