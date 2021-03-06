import 'dart:math';

import 'package:flutter/material.dart';

import '../qrcConnection/resultModels.dart';

class NamedComponentPropertyTableData extends DataTableSource {
  final List<QRCComponentProperty> properties;

  NamedComponentPropertyTableData(this.properties);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => properties.length;

  @override
  int get selectedRowCount => 0;

  DataRow getRow(int index) {
    return DataRow(
        cells: <DataCell>[
          DataCell(Text(properties[index].prettyName)),
          DataCell(Text(properties[index].name)),
          DataCell(Text(properties[index].value)),
        ]
    );
  }
}

class NamedComponentPropertyTable extends StatelessWidget {
  final List<QRCComponentProperty> properties;

  NamedComponentPropertyTable(this.properties);

  @override
  Widget build(BuildContext context) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 700),
         child: PaginatedDataTable(
           rowsPerPage: 5,
            header: Text("Properties", style: Theme.of(context).textTheme.headline6),
            source: NamedComponentPropertyTableData(properties),
            showFirstLastButtons: properties.length > 15,
            columns: const <DataColumn>[
              DataColumn(
                label: Text('Display Name')
              ),
              DataColumn(
                label: Text('Name')
              ),
              DataColumn(
                label: Text('Value')
              )
            ],
          ));
  }
}