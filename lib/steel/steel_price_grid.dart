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
  final Map<String, List<String>> specOptions = {
    'PO': ['PO SPHC', 'PO SS400'],
    'CR': ['CR3 SPCD', 'CR3 SPCC'],
    'CGI': ['EN-DX51D+Z', 'SGCC'],
  };

  late PlutoGridStateManager stateManager;

  final List<PlutoColumn> columns = <PlutoColumn>[
    // PlutoColumn(
    //   title: 'CUSTOMER',
    //   field: 'customer',
    //   type: PlutoColumnType.text(),
    // ),
    // PlutoColumn(
    //   title: 'PORT',
    //   field: 'port',
    //   type: PlutoColumnType.text(),
    // ),
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
      type: PlutoColumnType.select([]),
    ),
    PlutoColumn(
      title: 'THICKNESS',
      field: 'thickness',
      type: PlutoColumnType.number(format: '0.00'),
    ),
    PlutoColumn(
      title: 'WIDTH',
      field: 'width',
      type: PlutoColumnType.number(),
    ),
    PlutoColumn(
      title: 'SIZE EXTRA',
      field: 'size_extra',
      type: PlutoColumnType.number(),
      readOnly: true,
      renderer: (rendererContext) {
        final row = rendererContext.row;

        return Tooltip(
          richMessage: WidgetSpan(
              child: BaseSizeExtra(
            item: row.cells['item']!.value.toString(),
            thickness: double.parse(row.cells['thickness']!.value.toString()),
            witdh: double.parse(row.cells['width']!.value.toString()),
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
    final emptyJson = {
      'customer': '',
      'port': '',
      'item': '',
      'spec': '',
      'thickness': 0,
      'width': 0,
      'size_extra': 0,
    };
    final rowJson = [
      {
        'customer': 'Best Steel',
        'port': 'Osaka',
        'item': 'CR',
        'spec': 'CR3 SPCD',
        'thickness': 0.40,
        'width': 1000,
        'size_extra': 0,
      },
      {
        'customer': 'Best Steel',
        'port': 'Osaka',
        'item': 'CR',
        'spec': 'CR3 SPCD',
        'thickness': 0.45,
        'width': 900,
        'size_extra': 0,
      },
      {
        'customer': 'Best Steel',
        'port': 'Osaka',
        'item': 'CGI',
        'spec': 'EN-DX51D+Z',
        'thickness': 0.45,
        'width': 1072,
        'size_extra': 6,
      },
    ];
    final List<PlutoRow> rows = [
      ...rowJson.map((e) => PlutoRow.fromJson(e)),
      PlutoRow.fromJson(emptyJson),
      PlutoRow.fromJson(emptyJson),
      PlutoRow.fromJson(emptyJson),
    ];
    return PlutoGrid(
      columns: columns,
      rows: rows,
      columnGroups: columnGroups,
      // onLoaded: (PlutoGridOnLoadedEvent event) {
      //   stateManager = event.stateManager;
      // },
      // onChanged: (PlutoGridOnChangedEvent event) {
      //   if (event.column.field == 'item') {
      //     final String selectedItem = event.value;
      //     final List<String> newSpecOptions = specOptions[selectedItem] ?? [];

      //     final specColumn = stateManager.columns.firstWhere((column) => column.field == 'spec');
      //     specColumn.type = PlutoColumnType.select(newSpecOptions);

      //     if (!newSpecOptions.contains(event.row.cells['spec']?.value)) {
      //       event.row.cells['spec']?.value = '';
      //     }

      //     stateManager.notifyListeners();
      //   }
      // },
      configuration: const PlutoGridConfiguration(),
    );
  }
}
