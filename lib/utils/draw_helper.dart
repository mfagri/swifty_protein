// lib/utils/draw_helper.dart
import 'package:flutter/material.dart';


class DrawHelper {
  static const Map<String, Color> atomColors = {
    'H': Colors.white,
    'HE': Color(0xFFD9FFFF),
    'LI': Color(0xFFCC80FF),
    'BE': Color(0xFFC2FF00),
    'B': Color(0xFFFFB5B5),
    'C': Color(0xFF909090),
    'N': Color(0xFF3050F8),
    'O': Color(0xFFFF0D0D),
    'F': Color(0xFF90E050),
    'NE': Color(0xFFB3E3F5),
    'NA': Color(0xFFAB5CF2),
    'MG': Color(0xFF8AFF00),
    'AL': Color(0xFFBFA6A6),
    'SI': Color(0xFFF0C8A0),
    'P': Color(0xFFFF8000),
    'S': Color(0xFFFFFF30),
    'CL': Color(0xFF1FF01F),
    'AR': Color(0xFF80D1E3),
    'K': Color(0xFF8F40D4),
    'CA': Color(0xFF3DFF00),
    'SC': Color(0xFFE6E6E6),
    'TI': Color(0xFFBFC2C7),
    'V': Color(0xFFA6A6AB),
    'CR': Color(0xFF8A99C7),
    'MN': Color(0xFF9C7AC7),
    'FE': Color(0xFFE06633),
    'CO': Color(0xFFF090A0),
    'NI': Color(0xFF50D050),
    'CU': Color(0xFFC88033),
    'ZN': Color(0xFF7D80B0),
    'GA': Color(0xFFC28F8F),
    'GE': Color(0xFF668F8F),
    'AS': Color(0xFFBD80E3),
    'SE': Color(0xFFFFA100),
    'BR': Color(0xFFA62929),
    'KR': Color(0xFF5CB8D1),
    'RB': Color(0xFF702EB0),
    'SR': Color(0xFF00FF00),
    'Y': Color(0xFF94FFFF),
    'ZR': Color(0xFF94E0E0),
    'NB': Color(0xFF73C2C9),
    'MO': Color(0xFF54B5B5),
    'TC': Color(0xFF3B9E9E),
    'RU': Color(0xFF248F8F),
    'RH': Color(0xFF0A7D8C),
    'PD': Color(0xFF006985),
    'AG': Color(0xFFC0C0C0),
    'CD': Color(0xFFFFD98F),
    'IN': Color(0xFFA67573),
    'SN': Color(0xFF668080),
    'SB': Color(0xFF9E63B5),
    'TE': Color(0xFFD47A00),
    'I': Color(0xFF940094),
    'XE': Color(0xFF429EB0),
    'CS': Color(0xFF57178F),
    'BA': Color(0xFF00C900),
    'LA': Color(0xFF70D4FF),
    'CE': Color(0xFFFFFFC7),
    'PR': Color(0xFFD9FFC7),
    'ND': Color(0xFFC7FFC7),
    'PM': Color(0xFFA3FFC7),
    'SM': Color(0xFF8FFFC7),
    'EU': Color(0xFF61FFC7),
    'GD': Color(0xFF45FFC7),
    'TB': Color(0xFF30FFC7),
    'DY': Color(0xFF1FFFC7),
    'HO': Color(0xFF00FF9C),
    'ER': Color(0xFF00E675),
    'TM': Color(0xFF00D452),
    'YB': Color(0xFF00BF38),
    'LU': Color(0xFF00AB24),
    'HF': Color(0xFF4DC2FF),
    'TA': Color(0xFF4DA6FF),
    'W': Color(0xFF2194D6),
    'RE': Color(0xFF267DAB),
    'OS': Color(0xFF266696),
    'IR': Color(0xFF175487),
    'PT': Color(0xFFD0D0E0),
    'AU': Color(0xFFFFD123),
    'HG': Color(0xFFB8B8D0),
    'TL': Color(0xFFA6544D),
    'PB': Color(0xFF575961),
    'BI': Color(0xFF9E4FB5),
    'PO': Color(0xFFAB5C00),
    'AT': Color(0xFF754F45),
    'RN': Color(0xFF428296),
    'FR': Color(0xFF420066),
    'RA': Color(0xFF007D00),
    'AC': Color(0xFF70ABFA),
    'TH': Color(0xFF00BAFF),
    'PA': Color(0xFF00A1FF),
    'U': Color(0xFF008FFF),
    'NP': Color(0xFF0080FF),
    'PU': Color(0xFF006BFF),
    'AM': Color(0xFF545CF2),
    'CM': Color(0xFF785CE3),
    'BK': Color(0xFF8A4FE3),
    'CF': Color(0xFFA136D4),
    'ES': Color(0xFFB31FD4),
    'FM': Color(0xFFB31FBA),
    'MD': Color(0xFFB30DA6),
    'NO': Color(0xFFBD0D87),
    'LR': Color(0xFFC70066),
    'RF': Color(0xFFCC0059),
    'DB': Color(0xFFD1004F),
    'SG': Color(0xFFD90045),
    'BH': Color(0xFFE00038),
    'HS': Color(0xFFE6002E),
    'MT': Color(0xFFEB0026),
  };

  static const Map<String, double> atomRadii = {
    'H': 0.3,
    'C': 0.4,
    'N': 0.4,
    'O': 0.4,
    'P': 0.5,
    'S': 0.5,
    'Cl': 0.5,
    'F': 0.4,
    'Br': 0.5,
    'I': 0.6,
    'Fe': 0.5,
    'Ca': 0.5,
    'Zn': 0.5,
    'Na': 0.5,
    'Mg': 0.5,
  };

}