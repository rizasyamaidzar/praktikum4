import 'package:flutter/material.dart';

class TargetPerhitungan extends StatelessWidget {
  const TargetPerhitungan({
    super.key,
    required this.selectedValue,
    required this.dropdownItems,
    required this.onDropdownChanged,
  });

  final String selectedValue;
  final List<String> dropdownItems;
  final Function onDropdownChanged;
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedValue,
        items: dropdownItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          onDropdownChanged(value);
          
        });
  }
}