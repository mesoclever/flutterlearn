import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    // style for elevated button
    final ButtonStyle elevatedButtonStyle =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DropdownButtonExample(),
                      Image.asset('assets/airplane.jpg'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            color: Colors.amber[100 * (index + 1)],
                            child: Center(child: Text('Entry ${index + 1}')),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text('Passenger Name'),
                      Text('Cost of Ticket'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_downward),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 64,
                            child: TextField(
                              //controller: TextEditingController(text: '$_value'),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              //onChanged: {dynamic}(),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_upward),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () {},
                    child: const Text('Book Flight'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text('hi'),
                    Text('bye'),
                    Container(
                      padding: EdgeInsets.all(8),
                      //height: currentHeight,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter some text',
                        ),
                        maxLines: null,
                        onEditingComplete: () {
                          // Add your logic to update the widget when the user presses the return key
                        },
                      ),
                    ), // con
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
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
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
