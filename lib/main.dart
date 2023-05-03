import 'package:flutter/material.dart';
import 'package:resqme/rescuer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rescuesdata.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main()  {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: const MaterialColor(0xFF646B52, <int, Color>{
          50 : Color(0x1A646B52),
          100 : Color(0x33646B52),
          200 : Color(0x40646B52),
          300 : Color(0x66646B52),
          400 : Color(0x80646B52),
          500 : Color(0xFF646B52),
          600 : Color(0x93646B52),
          700 : Color(0x83646B52),
          800 : Color(0xCC646B52),
          900 : Color(0xE6646B52),
        }),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fr'),
        ],
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        home:  const HomePage(
          title: 'ResQMe',
        ),
      )
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

bool _iconbool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _HomePageState extends State<HomePage> {
  bool darkmode = false;
  dynamic savedThemeMode;

  void initState() {
    super.initState();
    getCurrentTheme();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    if(savedThemeMode.toString() == 'AdaptiveThemeMode.dark') {
      setState(() {
        darkmode = true;
        _iconbool = true;
      });
    } else {
      setState(() {
        darkmode = false;
        _iconbool = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
              child: Text(
                '   ResQMe',
                style: GoogleFonts.gugi(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                ),
              ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (_iconbool == true) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }
                  setState(() {
                    _iconbool = !_iconbool;
                    darkmode = _iconbool;
                  });
                },
                icon: Icon(_iconbool ? _iconDark : _iconLight),
                color: Colors.deepOrange.shade800,
            )
          ],
        ),
        body: Rescuer(listTeam: teams),
        );

  }
}