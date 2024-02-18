import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late DateTime _selectedDate = DateTime.now();
  final List<DateTime> _bookedDates = [
    // Add your booked dates here
    DateTime(2022, 10, 10),
    DateTime(2022, 10, 15),
    DateTime(2022, 10, 20),
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      selectableDayPredicate: (DateTime date) {
        // Disable selection for booked dates
        return !_bookedDates.contains(date);
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Problem List',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Hospital',
              ),
              items: [
                DropdownMenuItem(
                  value: 'Hospital A',
                  child: Text('Hospital A'),
                ),
                DropdownMenuItem(
                  value: 'Hospital B',
                  child: Text('Hospital B'),
                ),
                DropdownMenuItem(
                  value: 'Hospital C',
                  child: Text('Hospital C'),
                ),
              ],
              onChanged: (value) {
                // Handle hospital selection
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date'),
            ),
            SizedBox(height: 16.0),
            Text(
              _selectedDate != null
                  ? 'Selected Date: ${_selectedDate.toString()}'
                  : 'No date selected',
            ),
            Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle appointment request
          },
          child: Text('Request Appointment'),
        ),
      ),
    ),
          ],
          
        ),
        
      ),
    );
  }
}
