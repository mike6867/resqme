import 'package:flutter/material.dart';

final List<List<String>> teams = [
  ['JOSSERON ILLZACH', 'ALSACE DEPANNAGE HESINGUE', 'PRIMUS RIXHEIM', 'JOSSERON HESINGUE', 'ALSACE DEPANNAGE ILLZACH'],
  ['JOSSERON COLMAR', 'ALSACE DEPANNAGE COLMAR'],
  ['ALSACE DEPANNAGE ILLZACH', 'JOSSERON ILLZACH'],
  ['JOSSERON COLMAR', 'AB DEPANNAGES HERRLISHEIM', 'ZINS COLMAR', 'BECHLER WETTOLSHEIM', 'ALSACE DEPANNAGE COLMAR', 'MEYER MEYENHEIM'],
  ['BECHLER WETTOLSHEIM', 'ZINS COLMAR', 'AB DEPANNAGES HERRLISHEIM', 'JOSSERON COLMAR', 'ALSACE DEPANNAGE COLMAR'],
];

final List<Map<String, dynamic>> secteurs = [
  {'nom': '01', 'limites': 'St Louis - Ensisheim', 'icon': Icons.local_shipping_rounded},
  {'nom': '02', 'limites': 'Ensisheim - St Hippolyte', 'icon': Icons.local_shipping_rounded},
  {'nom': '03', 'limites': 'Rixheim - Ensisheim', 'icon': Icons.directions_car_filled_rounded},
  {'nom': '04', 'limites': 'Ensisheim - Colmar Semm', 'icon': Icons.directions_car_filled_rounded},
  {'nom': '05', 'limites': 'Colmar Semm - St Hippolyte', 'icon': Icons.directions_car_filled_rounded},
];

final Map<String, String> phones =
  {
    'ALSACE DEPANNAGE COLMAR': '+33389291000',
    'ALSACE DEPANNAGE HESINGUE': '+33389675050',
    'ALSACE DEPANNAGE ILLZACH': '+33389310000',
    'JOSSERON COLMAR': '+33389296850',
    'JOSSERON HESINGUE': '+33389671617',
    'JOSSERON ILLZACH': '+33389617688',
    'BECHLER WETTOLSHEIM': '+33389249933',
    'AB DEPANNAGES HERRLISHEIM': '+33389222748',
    'MEYER MEYENHEIM': '+33389811416',
    'PRIMUS RIXHEIM': '+33389443333',
    'ZINS COLMAR': '+33389412925'
  };

final Map<String, dynamic> contacts =
{
  'nom': 'ALSACE DEPANNAGE COLMAR',
  'fixe': 0389291000,
  'mobile': 0610610694,
  'adresse': '12 rue des Frères Lumières - 68000 COLMAR',
  'email': 'colmar@alsacedepannage.fr'
};

