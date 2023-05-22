import 'package:flutter/material.dart';

/// TSpinEdit
class TSpinEdit extends StatefulWidget {
  final int initialValue;
  final Function onValueChanged;

  const TSpinEdit({required this.initialValue, required this.onValueChanged});

  @override
  _TSpinEditState createState() => _TSpinEditState();
}

class _TSpinEditState extends State<TSpinEdit> {
  late int _value;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
    _controller = TextEditingController(text: widget.initialValue.toString());
  }

  // avoid memory leaks
  // call the dispose method of the stateful widget
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                _value--;
                _controller.text = _value.toString();
                widget.onValueChanged(_value);
              });
            },
          ),
          SizedBox(
            width: 50,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _value = int.parse(value);
                  widget.onValueChanged(_value);
                });
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                _value++;
                _controller.text = _value.toString();
                widget.onValueChanged(_value);
              });
            },
          ),
        ],
      ),
    );
  }
}
