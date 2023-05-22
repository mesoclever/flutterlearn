import 'package:flutter/material.dart';

/// DropdownButton
class DropDownbuttonClass extends StatefulWidget {
  final ValueChanged<String> onValueChanged;

  const DropDownbuttonClass({Key? key, required this.onValueChanged})
      : super(key: key);

  @override
  State<DropDownbuttonClass> createState() => _DropDownbuttonClassState();
}

const List<String> list = <String>['A111', 'A112', 'A113', 'A114', 'A115'];

class _DropDownbuttonClassState extends State<DropDownbuttonClass> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          widget.onValueChanged(dropdownValue);
        });
      },
      items: list.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}
