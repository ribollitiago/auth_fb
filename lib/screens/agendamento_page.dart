import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';

class Agendamento extends StatefulWidget {
  @override
  _AgendamentoState createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  CalendarFormat _calendarFormat =
      CalendarFormat.week; // Alterado para formato semanal
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime lastDay = today.add(const Duration(days: 365));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agendamento',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) => AgendamentoCalendario(context: context, today: today, lastDay: lastDay)
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final newAppointmentDate = _selectedDay; 
              print('Agendado para: $newAppointmentDate');
            },
            child: const Text('Agendar'),
          ),
        ],
      ),
    );
  }


  Widget AgendamentoCalendario(
      {required BuildContext context,
      required DateTime today,
      required DateTime lastDay}) {
    return TableCalendar(
      firstDay: today,
      lastDay: lastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      locale: 'pt-BR',
      startingDayOfWeek: StartingDayOfWeek.sunday,
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      availableCalendarFormats: {
        CalendarFormat.week: 'Week', // Apenas o formato semanal
      },
    );
  }
}
