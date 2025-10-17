import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTodos extends StatefulWidget {
  const AddTodos({super.key});

  @override
  State<AddTodos> createState() => _AddTodosState();
}

class _AddTodosState extends State<AddTodos> {
  TimeOfDay? _selectedTime;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

 
  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Personal Todo",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),

              TextField(
                autofocus: true,
                style: const TextStyle(color: Colors.black, fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'Todo Title',
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              const Text("Optional", style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),

            
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  hintText: 'Write something here...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 1.1),
                  ),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 30),

             
              GestureDetector(
                onTap: () => _pickTime(context),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _selectedTime == null
                          ? "Select Time"
                          : _selectedTime!.format(context),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

             
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  availableGestures: AvailableGestures.all,
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(fontSize: 10),
                    weekendStyle: TextStyle(fontSize: 10),
                  ),
                  calendarStyle: const CalendarStyle(
                    cellMargin: EdgeInsets.all(1),
                    defaultTextStyle: TextStyle(fontSize: 11),
                    todayDecoration: BoxDecoration(
                      color: Colors.tealAccent,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              if (_selectedDay != null)
                Text(
                  "Selected Date: ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}",
                  style: const TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              const SizedBox(height: 30),


               Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      
                      onPressed: () {
                        Navigator.pushNamed(context, '/all_folders');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal
                      ),
                      child: Text("Add Todo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),),
                      
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
