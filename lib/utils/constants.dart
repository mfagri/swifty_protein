class Constants {
  static const Map<String, int> atomsCPK = {
    'H': 0xFFFFFF, // White
    'He': 0xFFC0CB, // Pink
    'Li': 0xFF0000, // Red
    'Be': 0xFF1493, // Deep Pink
    'B': 0xFFA500, // Orange
    'C': 0x808080, // Grey
    'N': 0x0000FF, // Blue
    'O': 0xFF0000, // Red
    'F': 0x7FFF00, // Green
    'Ne': 0xFF1493, // Deep Pink
    'Na': 0x0000FF, // Blue
    'Mg': 0x228B22, // Forest Green
    'Al': 0x808090, // Gray-Blue
    'Si': 0xDAA520, // Golden Rod
    'P': 0xFFA500, // Orange
    'S': 0xFFFF00, // Yellow
    'Cl': 0x00FF00, // Green
    'Ar': 0xFF1493, // Deep Pink
    'K': 0x0000FF, // Blue
    'Ca': 0x808090, // Gray-Blue
    'Sc': 0x808090, // Gray-Blue
    'Ti': 0x808090, // Gray-Blue
    'V': 0x808090, // Gray-Blue
    'Cr': 0x808090, // Gray-Blue
    'Mn': 0x808090, // Gray-Blue
    'Fe': 0xFFA500, // Orange
    'Co': 0x808090, // Gray-Blue
    'Ni': 0x808090, // Gray-Blue
    'Cu': 0xA52A2A, // Brown
    'Zn': 0x808090, // Gray-Blue
    'Ga': 0x808090, // Gray-Blue
    'Ge': 0x808090, // Gray-Blue
    'As': 0x808090, // Gray-Blue
    'Se': 0xFFA500, // Orange
    'Br': 0x800000, // Brown
    'Kr': 0xFF1493, // Deep Pink
    'I': 0x800080, // Purple
    'Xe': 0xFF1493, // Deep Pink
    'Cs': 0x0000FF, // Blue
    'Ba': 0xFFA500, // Orange
    'Pt': 0x808090, // Gray-Blue
    'Au': 0xFFD700, // Gold
    'Hg': 0x808090, // Gray-Blue
    'Pb': 0x808090, // Gray-Blue
  };
  static const atomBonds = {
    'H': 1, // Hydrogen
    'HE': 0, // Helium
    'LI': 1, // Lithium
    'BE': 2, // Beryllium
    'B': 3, // Boron
    'C': 4, // Carbon
    'N': 3, // Nitrogen
    'O': 2, // Oxygen
    'F': 1, // Fluorine
    'NE': 0, // Neon
    'NA': 1, // Sodium
    'MG': 2, // Magnesium
    'AL': 3, // Aluminum
    'SI': 4, // Silicon
    'P': 5, // Phosphorus
    'S': 6, // Sulfur
    'CL': 1, // Chlorine
    'AR': 0, // Argon
    'K': 1, // Potassium
    'CA': 2, // Calcium
    'SC': 3, // Scandium
    'TI': 4, // Titanium
    'V': 5, // Vanadium
    'CR': 6, // Chromium
    'MN': 6, // Manganese
    'FE': 6, // Iron
    'CO': 6, // Cobalt
    'NI': 6, // Nickel
    'CU': 4, // Copper
    'ZN': 2, // Zinc
    'GA': 3, // Gallium
    'GE': 4, // Germanium
    'AS': 3, // Arsenic
    'SE': 6, // Selenium
    'BR': 1, // Bromine
    'KR': 0, // Krypton
    'RB': 1, // Rubidium
    'SR': 2, // Strontium
    'Y': 3, // Yttrium
    'ZR': 4, // Zirconium
    'NB': 5, // Niobium
    'MO': 6, // Molybdenum
    'TC': 7, // Technetium
    'RU': 8, // Ruthenium
    'RH': 6, // Rhodium
    'PD': 4, // Palladium
    'AG': 1, // Silver
    'CD': 2, // Cadmium
    'IN': 3, // Indium
    'SN': 4, // Tin
    'SB': 3, // Antimony
    'TE': 6, // Tellurium
    'I': 1, // Iodine
    'XE': 0, // Xenon
    'CS': 1, // Cesium
    'BA': 2, // Barium
    'PT': 6, // Platinum
    'AU': 4, // Gold
    'HG': 2, // Mercury
    'PB': 4, // Lead
    'BI': 3, // Bismuth
    'PO': 6, // Polonium
    'AT': 1, // Astatine
    'RN': 0, // Radon
    'FR': 1, // Francium
    'RA': 2, // Radium
    'U': 6, // Uranium
  };

  static const Map<String, String> atomsFullName = {
    'H': 'Hydrogen',
    'He': 'Helium',
    'Li': 'Lithium',
    'Be': 'Beryllium',
    'B': 'Boron',
    'C': 'Carbon',
    'N': 'Nitrogen',
    'O': 'Oxygen',
    'F': 'Fluorine',
    'Ne': 'Neon',
    'Na': 'Sodium',
    'Mg': 'Magnesium',
    'Al': 'Aluminum',
    'Si': 'Silicon',
    'P': 'Phosphorus',
    'S': 'Sulfur',
    'Cl': 'Chlorine',
    'Ar': 'Argon',
    'K': 'Potassium',
    'Ca': 'Calcium',
    'Sc': 'Scandium',
    'Ti': 'Titanium',
    'V': 'Vanadium',
    'Cr': 'Chromium',
    'Mn': 'Manganese',
    'Fe': 'Iron',
    'Co': 'Cobalt',
    'Ni': 'Nickel',
    'Cu': 'Copper',
    'Zn': 'Zinc',
    'Ga': 'Gallium',
    'Ge': 'Germanium',
    'As': 'Arsenic',
    'Se': 'Selenium',
    'Br': 'Bromine',
    'Kr': 'Krypton',
    'Rb': 'Rubidium',
    'Sr': 'Strontium',
    'Y': 'Yttrium',
    'Zr': 'Zirconium',
    'Nb': 'Niobium',
    'Mo': 'Molybdenum',
    'Tc': 'Technetium',
    'Ru': 'Ruthenium',
    'Rh': 'Rhodium',
    'Pd': 'Palladium',
    'Ag': 'Silver',
    'Cd': 'Cadmium',
    'In': 'Indium',
    'Sn': 'Tin',
    'Sb': 'Antimony',
    'Te': 'Tellurium',
    'I': 'Iodine',
    'Xe': 'Xenon',
    'Cs': 'Cesium',
    'Ba': 'Barium',
    'La': 'Lanthanum',
    'Ce': 'Cerium',
    'Pr': 'Praseodymium',
    'Nd': 'Neodymium',
    'Pm': 'Promethium',
    'Sm': 'Samarium',
    'Eu': 'Europium',
    'Gd': 'Gadolinium',
    'Tb': 'Terbium',
    'Dy': 'Dysprosium',
    'Ho': 'Holmium',
    'Er': 'Erbium',
    'Tm': 'Thulium',
    'Yb': 'Ytterbium',
    'Lu': 'Lutetium',
    'Hf': 'Hafnium',
    'Ta': 'Tantalum',
    'W': 'Tungsten',
    'Re': 'Rhenium',
    'Os': 'Osmium',
    'Ir': 'Iridium',
    'Pt': 'Platinum',
    'Au': 'Gold',
    'Hg': 'Mercury',
    'Tl': 'Thallium',
    'Pb': 'Lead',
    'Bi': 'Bismuth',
    'Po': 'Polonium',
    'At': 'Astatine',
    'Rn': 'Radon',
    'Fr': 'Francium',
    'Ra': 'Radium',
    'Ac': 'Actinium',
    'Th': 'Thorium',
    'Pa': 'Protactinium',
    'U': 'Uranium',
    'Np': 'Neptunium',
    'Pu': 'Plutonium',
    'Am': 'Americium',
    'Cm': 'Curium',
    'Bk': 'Berkelium',
    'Cf': 'Californium',
    'Es': 'Einsteinium',
    'Fm': 'Fermium',
    'Md': 'Mendelevium',
    'No': 'Nobelium',
    'Lr': 'Lawrencium',
    'Rf': 'Rutherfordium',
    'Db': 'Dubnium',
    'Sg': 'Seaborgium',
    'Bh': 'Bohrium',
  };
}
