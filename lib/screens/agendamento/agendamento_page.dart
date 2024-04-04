import 'package:auth_sql/screens/agendamento/sucess_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendamentoPage extends StatefulWidget {
  const AgendamentoPage({super.key});

  @override
  State<AgendamentoPage> createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  
  CalendarFormat _format = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String valueConsul = 'Clique aqui para selecionar';
  String valueExame = 'Clique aqui para selecionar';
  List<String> listConsultorio= ['Clique aqui para selecionar', 'Consultorio 1', 'Consultorio 2', 'Consultorio 3', 'Consultorio 4'];
  List<String> listExame = ['Clique aqui para selecionar','Exame 1', 'Exame 2', 'Exame 3', 'Exame 4'];

  @override
  Widget build(BuildContext context) {
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                  Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                    child: Text(
                      'Selecione o Consultório',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 2), borderRadius: BorderRadius.circular(8)),
                  child: DropdownButton<String>(
                    hint: const Text('Selecione o Consultório'),
                    underline: SizedBox(),
                    isExpanded: true,
                    value: valueConsul,
                    style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold,),
                    onChanged: (String? newValue) {
                      setState(() {
                        valueConsul = newValue!;
                      });
                    },
                    items: listConsultorio.map((String valueItem){
                      return DropdownMenuItem<String>(
                        value: valueItem, 
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                    child: Text(
                      'Selecione o tipo de Exame',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 2), borderRadius: BorderRadius.circular(8)),
                  child: DropdownButton<String>(
                    hint: const Text('Selecione o Consultório'),
                    underline: SizedBox(),
                    isExpanded: true,
                    value: valueExame,
                    style: const TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold,),
                    onChanged: (String? newValue) {
                      setState(() {
                        valueExame = newValue!;
                      });
                    },
                    items: listExame.map((String valueItem){
                      return DropdownMenuItem<String>(
                        value: valueItem, 
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),

                Container(
                margin: EdgeInsets.only(top: 15),
                child: Center(
                    child: Text(
                      'Selecione o dia da consulta',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),

                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Center(
                    child: Text(
                      'Selecionar horário da consulta',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  alignment: Alignment.center,
                  child: const Text(
                    'Fim de semana não disponível, selecione outra data',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
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
                            '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5),
                ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green[500],
              ),
              child: TextButton(
                onPressed: _timeSelected && _dateSelected
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SucessPage()));
                      }
                    : null,
                child: const Text(
                  "Marcar Consulta",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
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
}
