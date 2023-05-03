import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:week_of_year/week_of_year.dart';
import 'package:intl/intl.dart';
import 'rescuesdata.dart';


// rescuer list

class Rescuer extends StatefulWidget {
  final List<List<dynamic>> listTeam;

  Rescuer({required this.listTeam});

  @override
  RescuerState createState() => RescuerState();
}

class RescuerState extends State<Rescuer> {

  var time = DateTime.now();
  final f = DateFormat('dd.MM.yyyy');

  List<dynamic> depTeam = [];

  Future<void> launchURL(String url) async {
    final Uri uri = Uri(scheme: 'tel', path: url);
    if(!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Appel impossible";
    }
  }

  @override

  void initState() {
    super.initState();
    depSecteur();
  }

  void depSecteur() {

    for (var i = 0; i < widget.listTeam.length; i++) {
      var sublist = widget.listTeam[i];
      int sem = time.weekOfYear;
      while (sem > sublist.length) {
        sem -= sublist.length;
      }
      depTeam.add(sublist[sem-1]);
    }
  }

  Future<void> selectDate(BuildContext context) async {

    DateTime? d = await showDatePicker(
      context: context,
      initialDate: time,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
      //locale:
    );
    if (d != null && d != time) {
      setState(() {
        time = d;
        depTeam.clear();
        depSecteur();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    var firstDayOfWeek = time.subtract(Duration(days: time.weekday - 1));
    var lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF646B52),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(10),
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_month),
                    color: Colors.deepOrange.shade800,iconSize: 35,
                ),
                Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Row(
                      children: [
                        Text('${f.format(time)} - ',
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                        Text('Semaine n° ${time.weekOfYear}',
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text('du ${f.format(firstDayOfWeek)} (08h) au ${f.format(lastDayOfWeek)} (08h)',
                          style: GoogleFonts.poppins(fontSize: 14)
                      ),
                  ]
                ),
              ],
            ),

          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: Text('- SECTEURS -',
                        style: GoogleFonts.blackOpsOne(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,)
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 430,
                    child: AnimatedContainer(

                      duration: const Duration(seconds: 2),
                      child: ListView.builder(
                        itemCount: depTeam.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 6,
                            child: ListTile(
                              leading: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(secteurs[index]['icon'], size: 30,),
                                    Text('Secteur ${secteurs[index]['nom']}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(depTeam[index],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              subtitle: Text('${secteurs[index]['limites']}',
                                style: TextStyle(color: Colors.black54),
                              ),
                              trailing: Container(
                                height: double.infinity,
                                child: IconButton(
                                  onPressed: () {
                                    launchURL('${phones['${depTeam[index]}']}');
                                    },
                                  icon: const Icon(Icons.call, color: Color(0xFF646B52), size: 40,),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


