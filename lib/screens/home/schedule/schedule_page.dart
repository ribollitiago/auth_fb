import 'package:auth_sql/screens/home/schedule/sucess_page.dart';
import 'package:auth_sql/store/calendar/calendar.store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late Future<void> _loadDataFuture;

  @override
  void initState() {
    super.initState();
    _loadDataFuture = _loadData();
  }

  Future<void> _loadData() async {
    final store = Provider.of<CalendarStore>(context, listen: false);
    await store.retrievePartnerNames();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else {
          return _buildContent();
        }
      },
    );
  }

  CalendarFormat _format = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String selectedTime = '';

  String valueExame = 'Clique aqui para selecionar';
  String valueConsul = '';

  List<String> listConsultorio = [];
  List<String> listExame = [
    'Clique aqui para selecionar',
    'Exame 1',
    'Exame 2',
    'Exame 3',
    'Exame 4'
  ];
  List<String> horarios = List.generate(
      8, (index) => '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}');

  DateTime? _selectedDate;
  String? formattedDate;

  bool _isLoading = true;


  Widget _buildContent() {
    return CustomScrollView(
      slivers: [
        _buildConsultorioSelection(),
        _buildExameSelection(),
        _buildDaySelection(),
        _buildHorarioSelection(),
        _buildMarcarConsultaButton(),
      ],
    );
  }

  Widget _buildConsultorioSelection() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: const Center(
              child: Text(
                'Selecione o Consultório',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              hint: const Text('Selecione o Consultório'),
              underline: SizedBox(),
              isExpanded: true,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              value: valueConsul,
              onChanged: (String? newValue) {
                setState(() {
                  valueConsul = newValue!;
                  print(valueConsul);
                });
              },
              items: listConsultorio.map((String valueItem) {
                return DropdownMenuItem<String>(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExameSelection() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: const Center(
              child: Text(
                'Selecione o tipo de Exame',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(8)),
            child: DropdownButton<String>(
              hint: const Text('Selecione o Exame'),
              underline: SizedBox(),
              isExpanded: true,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              value: valueExame,
              onChanged: (String? newValue) {
                setState(() {
                  valueExame = newValue!;
                });
              },
              items: listExame.map((String valueItem) {
                return DropdownMenuItem<String>(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelection() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: const Center(
              child: Text(
                'Selecione o dia da consulta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          _tableCalendar(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Center(
              child: Text(
                'Selecionar horário da consulta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      locale: 'pt_BR',
      focusedDay: _focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 30),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration:
            BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      ),
      availableCalendarFormats: const {
        CalendarFormat.week: 'Week',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusedDay = focusedDay;
          _dateSelected = true;
          _selectedDate = selectedDay;
          formattedDate = DateFormat('dd/MM/yyyy').format(selectedDay);
          print(formattedDate);
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }

  Widget _buildHorarioSelection() {
    return _isWeekend
        ? SliverToBoxAdapter(
            child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            alignment: Alignment.center,
            child: const Text(
              'Fim de semana não disponível, selecione outra data',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ))
        : SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                      _timeSelected = true;
                    });
                    selectedTime = horarios[index];
                    print('Horário selecionado: $selectedTime');
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: _currentIndex == index ? Colors.green : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      horarios[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _currentIndex == index ? Colors.white : null,
                      ),
                    ),
                  ),
                );
              },
              childCount: 8,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 1.5),
          );
  }

  Widget _buildMarcarConsultaButton() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green[500],
        ),
        child: TextButton(
          onPressed: _timeSelected &&
                  _dateSelected &&
                  valueExame != 'Clique aqui para selecionar'
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmar Agendamento'),
                        content: Text(
                            'Gostaria de agendar ${valueExame} no consultório ${valueConsul} no dia ${formattedDate} no horario ${selectedTime}'),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              botaoPadrao(
                                text: 'SIM',
                                onClick: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SucessPage()),
                                      (route) => false);
                                },
                              ),
                              botaoPadrao(
                                text: 'NÃO',
                                onClick: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
              : null,
          child: const Text(
            "Marcar Consulta",
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
    );
  }

  Widget botaoPadrao({required String text, VoidCallback? onClick}) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500],
      ),
      child: TextButton(
        onPressed: onClick,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
