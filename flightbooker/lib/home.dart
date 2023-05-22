import 'package:flutter/material.dart';
import './dropdownbutton.dart';
import './tspinedit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _age = 0;
  String _flight = '';
  int _selectedIndex = -1;
  final TextEditingController _controller = TextEditingController();
  final List<String> flightClass = [
    "Economy Class",
    "First Class",
    "Builder Class"
  ];
  String _passengerName = '';
  String _costOfTicket = '';

  @override
  void initState() {
    super.initState();
    _controller.text = ''; // default value of the Dropdown First flight
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final currentWidth = MediaQuery.of(context).size.width;
    //final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Flight Booker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DropDownbuttonClass(
                        onValueChanged: (String value) {
                          setState(() {
                            _flight = value;
                          });
                          //print('Selected value: $value');
                        },
                      ),
                      Image.asset('assets/airplane.jpg'),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(8),
                          itemCount: flightClass.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: _selectedIndex == index
                                    ? Colors.grey[300]
                                    : null,
                                borderRadius: BorderRadius.circular(
                                    8.0), // Optional: Add some border radius to the container
                              ),
                              child: ListTile(
                                title: Text(
                                  flightClass[index],
                                  style: TextStyle(
                                    color: _selectedIndex == index
                                        ? Colors.red[300]
                                        : Colors
                                            .black, // Optional: Add some font color to the text
                                    fontWeight: _selectedIndex == index
                                        ? FontWeight.bold
                                        : FontWeight
                                            .normal, // Optional: Add some font weight to the text
                                  ),
                                ),
                                selected: _selectedIndex == index,
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Passenger Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Cost of Ticket',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Passenger Name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _passengerName = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Cost of Ticket',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _costOfTicket = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: const Text(
                          'Age',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      TSpinEdit(
                        initialValue: _age,
                        //onValueChanged: callback(),
                        onValueChanged: (int newValue) {
                          setState(() {
                            //print('New value: $newValue');
                            _age = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[300],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          side: BorderSide(width: 2, color: Colors.black),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          // Validate the inputs
                          validateInput();
                          _controller.text =
                              "Flight: $_flight\nFlight Class: ${flightClass[_selectedIndex]} \nPassenger Name: $_passengerName \nCost of Ticket: $_costOfTicket \nAge: $_age";
                        },
                        child: const Text('Book Flight'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 400,
                //color: Colors.red[300],
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                  ),
                  maxLines: null,
                  controller: _controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateInput() {
    // Validate the inputs
    if (_flight.isEmpty) {
      // Show a SnackBar if flight is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a flight')),
      );
      return;
    }
    if (_selectedIndex < 0 || _selectedIndex >= flightClass.length) {
      // Show a SnackBar if the selected index is out of range
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a flight class')),
      );
      return;
    }
    if (_passengerName.isEmpty ||
        !RegExp(r'^[a-zA-Z ]+$').hasMatch(_passengerName)) {
      // Show a SnackBar if passenger name is empty or contains non-alphabetic characters
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid passenger name')),
      );
      return;
    }
    if (!RegExp(r'^\d+$').hasMatch(_costOfTicket)) {
      // Show a SnackBar if cost of ticket contains non-numeric characters
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid cost of ticket')),
      );
      return;
    }
    if (!RegExp(r'^[1-9]\d*$').hasMatch(_age.toString())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid age')),
      );
      return;
    }
  }
}
