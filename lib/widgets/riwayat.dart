

import 'package:flutter/material.dart';

class RiwayatPerhitungan extends StatelessWidget {
  const RiwayatPerhitungan({
    super.key,
    required this.listViewItem,
  });

  final List<String> listViewItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: listViewItem.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Text(listViewItem[index],style: TextStyle(
                  fontSize: 20
                ),)
                );
            }));
  }
}