/*import 'package:flutter/material.dart';
import 'database_helper.dart';  // Import funkcija za bazu

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final _nazivController = TextEditingController();
  final _iznosController = TextEditingController();
  String? selectedMonth;

  final List<String> months = [
    "Siječanj", "Veljača", "Ožujak", "Travanj", "Svibanj", "Lipanj",
    "Srpanj", "Kolovoz", "Rujan", "Listopad", "Studeni", "Prosinac"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Troškovnik")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nazivController,
              decoration: const InputDecoration(labelText: 'Naziv troška'),
            ),
            TextField(
              controller: _iznosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Iznos troška'),
            ),
            DropdownButton<String>(
              hint: const Text("Izaberite mjesec"),
              value: selectedMonth,
              onChanged: (String? newMonth) {
                setState(() {
                  selectedMonth = newMonth;
                });
              },
              items: months.map((month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_nazivController.text.isNotEmpty &&
                    _iznosController.text.isNotEmpty &&
                    selectedMonth != null) {
                  double expense = double.parse(_iznosController.text);
                  await DatabaseHelper.insertExpense(
                      _nazivController.text, expense, selectedMonth!);

                  // Očisti polja
                  _nazivController.clear();
                  _iznosController.clear();
                  selectedMonth = null;

                  // Osveži UI
                  setState(() {});
                }
              },
              child: const Text("Dodaj trošak"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllExpensesScreen(),
                  ),
                );
              },
              child: const Text("Pogledaj sve troškove"),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'database_helper.dart';  // Import za interakciju s bazom

class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final _nazivController = TextEditingController();
  final _iznosController = TextEditingController();
  String? selectedMonth;
  final List<String> months = [
    "Siječanj", "Veljača", "Ožujak", "Travanj", "Svibanj", "Lipanj",
    "Srpanj", "Kolovoz", "Rujan", "Listopad", "Studeni", "Prosinac"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Troškovnik")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nazivController,
              decoration: InputDecoration(labelText: 'Naziv troška'),
            ),
            TextField(
              controller: _iznosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Iznos troška'),
            ),
            DropdownButton<String>(
              hint: Text("Izaberite mjesec"),
              value: selectedMonth,
              onChanged: (String? newMonth) {
                setState(() {
                  selectedMonth = newMonth;
                });
              },
              items: months.map((month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_nazivController.text.isNotEmpty &&
                    _iznosController.text.isNotEmpty &&
                    selectedMonth != null) {
                  double expense = double.parse(_iznosController.text);
                  await DatabaseHelper.insertExpense(
                      _nazivController.text, expense, selectedMonth!);

                  // Očisti polja
                  _nazivController.clear();
                  _iznosController.clear();
                  selectedMonth = null;

                  // Osveži UI
                  setState(() {});
                }
              },
              child: Text("Dodaj trošak"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllExpensesScreen(),
                  ),
                );
              },
              child: Text("Pogledaj sve troškove"),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/* import 'package:flutter/material.dart';
import 'all_expenses_screen.dart'; // Importiranje ekrana za sve troškove
import 'database_helper.dart'; // Importiranje helpera za bazu podataka

class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final _nazivController = TextEditingController();
  final _iznosController = TextEditingController();
  String? selectedMonth;

  // Popis mjeseci
  final List<String> months = [
    "Siječanj",
    "Veljača",
    "Ožujak",
    "Travanj",
    "Svibanj",
    "Lipanj",
    "Srpanj",
    "Kolovoz",
    "Rujan",
    "Listopad",
    "Studeni",
    "Prosinac"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Troškovnik")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Polje za naziv troška
            TextField(
              controller: _nazivController,
              decoration: InputDecoration(labelText: 'Naziv troška'),
            ),
            // Polje za iznos troška
            TextField(
              controller: _iznosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Iznos troška'),
            ),
            // Dropdown za odabir mjeseca
            DropdownButton<String>(
              hint: Text("Izaberite mjesec"),
              value: selectedMonth,
              onChanged: (String? newMonth) {
                setState(() {
                  selectedMonth = newMonth;
                });
              },
              items: months.map((month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nazivController.text.isNotEmpty &&
                    _iznosController.text.isNotEmpty &&
                    selectedMonth != null) {
                  // Unos troška u bazu podataka
                  double expense = double.parse(_iznosController.text);
                  DatabaseHelper.insertExpense(
                      _nazivController.text, expense, selectedMonth!);

                  // Očisti polja
                  _nazivController.clear();
                  _iznosController.clear();
                  setState(() {
                    selectedMonth = null;
                  });
                }
              },
              child: Text("Dodaj trošak"),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigacija prema ekranu sa svim troškovima
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllExpensesScreen()),
                );
              },
              child: Text("Pogledaj sve troškove"),
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'all_expenses_screen.dart';
import 'month_expenses_screen.dart';

class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final _nazivController = TextEditingController();
  final _iznosController = TextEditingController();
  String? selectedMonth;

  final List<String> months = [
    "Siječanj",
    "Veljača",
    "Ožujak",
    "Travanj",
    "Svibanj",
    "Lipanj",
    "Srpanj",
    "Kolovoz",
    "Rujan",
    "Listopad",
    "Studeni",
    "Prosinac"
  ];

  Future<void> _addExpense() async {
    if (_nazivController.text.isNotEmpty &&
        _iznosController.text.isNotEmpty &&
        selectedMonth != null) {
      double amount = double.tryParse(_iznosController.text) ?? 0.0;

      await DatabaseHelper.insertExpense(
          _nazivController.text, amount, selectedMonth!);

      setState(() {
        _nazivController.clear();
        _iznosController.clear();
        selectedMonth = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Troškovnik")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nazivController,
              decoration: InputDecoration(labelText: 'Naziv troška'),
            ),
            TextField(
              controller: _iznosController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Iznos troška'),
            ),
            DropdownButton<String>(
              hint: Text("Izaberite mjesec"),
              value: selectedMonth,
              onChanged: (String? newMonth) {
                setState(() {
                  selectedMonth = newMonth;
                });
              },
              items: months.map((month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _addExpense,
              child: Text("Dodaj trošak"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllExpensesScreen()));
              },
              child: Text("Svi troškovi"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MonthExpensesScreen()));
              },
              child: Text("Troškovi po mjesecima"),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'all_expenses_screen.dart';
import 'month_expenses_screen.dart'; // Provjeri da je ovaj import ispravan

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final _nazivController = TextEditingController();
  final _iznosController = TextEditingController();
  String? selectedMonth;

  final List<String> months = [
    "Siječanj",
    "Veljača",
    "Ožujak",
    "Travanj",
    "Svibanj",
    "Lipanj",
    "Srpanj",
    "Kolovoz",
    "Rujan",
    "Listopad",
    "Studeni",
    "Prosinac"
  ];

  Future<void> _addExpense() async {
    if (_nazivController.text.isNotEmpty &&
        _iznosController.text.isNotEmpty &&
        selectedMonth != null) {
      double amount = double.tryParse(_iznosController.text) ?? 0.0;

      await DatabaseHelper.insertExpense(
        _nazivController.text,
        amount,
        selectedMonth!,
      );

      // Resetiranje polja za unos
      setState(() {
        _nazivController.clear();
        _iznosController.clear();
        selectedMonth = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nazivController,
              decoration: const InputDecoration(labelText: 'Naziv troška'),
            ),
            TextField(
              controller: _iznosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Iznos troška'),
            ),
            DropdownButton<String>(
              hint: const Text("Izaberite mjesec"),
              value: selectedMonth,
              onChanged: (String? newMonth) {
                setState(() {
                  selectedMonth = newMonth;
                });
              },
              items: months.map((month) {
                return DropdownMenuItem<String>(
                  value: month,
                  child: Text(month),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _addExpense,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
              ),
              child: const Text("Dodaj trošak"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllExpensesScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
              ),
              child: const Text("Svi troškovi"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MonthExpensesScreen())); // Ovdje se koristi ispravan naziv klase
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                foregroundColor: Colors.black,
              ),
              child: const Text("Mjesečni troškovi"),
            ),
          ],
        ),
      ),
    );
  }
}
