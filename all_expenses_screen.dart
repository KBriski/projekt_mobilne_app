/*import 'package:flutter/material.dart';
import 'database_helper.dart';

class AllExpensesScreen extends StatefulWidget {
  const AllExpensesScreen({super.key});

  @override
  _AllExpensesScreenState createState() => _AllExpensesScreenState();
}

class _AllExpensesScreenState extends State<AllExpensesScreen> {
  List<Map<String, dynamic>> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  _loadExpenses() async {
    var data =
        await DatabaseHelper.getExpenses(); // Dohvati sve troškove iz baze
    setState(() {
      expenses = data; // Ažuriraj listu troškova
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ukupni troškovi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: expenses.isEmpty
            ? const Center(child: Text("Nema podataka."))
            : ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  var expense = expenses[index];
                  return ListTile(
                    title: Text(
                        "${expense['name']} - ${expense['amount']} € (${expense['month']})"),
                  );
                },
              ),
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'database_helper.dart';

class AllExpensesScreen extends StatefulWidget {
  const AllExpensesScreen({super.key});

  @override
  _AllExpensesScreenState createState() => _AllExpensesScreenState();
}

class _AllExpensesScreenState extends State<AllExpensesScreen> {
  List<Map<String, dynamic>> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final data = await DatabaseHelper.getExpenses();
    setState(() {
      expenses = data;
    });
  }

/*
ListView.builder – dinamički prikazuje popis troškova.
itemCount: expenses.length – određuje koliko redaka će biti prikazano.
ListTile – za svaki trošak prikazuje naziv i iznos u title, a mjesec u subtitle, ma neka i mjesec ide gore pa nema subtitle
dodati i provjeru ako nema unosa podataka
*/
  @override
  Widget build(BuildContext context) {
    double totalSum =
        expenses.fold(0, (sum, item) => sum + (item['amount'] as double));

Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: const Text("Svi troškovi")),
      body: expenses.isEmpty
          ? const Center(
              child: Text(
                "Nema unesenih troškova.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.separated(
              itemCount:
                  expenses.length + 1, // Dodajemo +1 za prikaz ukupnog zbroja
              separatorBuilder: (context, index) =>
                  const Divider(), // Razdvajanje elemenata
              itemBuilder: (context, index) {
                if (index < expenses.length) {
                  final expense = expenses[index];
                  return ListTile(
                    title: Text(
                        "${expense['name']} - ${expense['amount']}€ - ${expense['month']}"),
                  );
                } else {
                  // Zadnji element liste -> prikaz ukupnog troška
                  return ListTile(
                    title: Center(
                      child: Text(
                        "Ukupno: $totalSum€",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    tileColor:
                        Colors.lightBlue, // Blago drugačija boja pozadine
                  );
                }
              },
            ),
    );
    }
  }
}
*/
/*import 'package:flutter/material.dart';
import 'database_helper.dart';

class AllExpensesScreen extends StatefulWidget {
  const AllExpensesScreen({super.key});

  @override
  _AllExpensesScreenState createState() => _AllExpensesScreenState();
}

class _AllExpensesScreenState extends State<AllExpensesScreen> {
  List<Map<String, dynamic>> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  // Metoda za učitavanje troškova iz baze
  Future<void> _loadExpenses() async {
    final data = await DatabaseHelper.getExpenses();
    setState(() {
      expenses = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Izračunaj ukupni iznos svih troškova
    double totalSum = expenses.fold(0, (sum, item) => sum + (item['amount'] as double));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Svi troškovi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: expenses.isEmpty
            ? const Center(child: Text("Nema podataka."))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Prikaz rečenice ispod naslova
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Popis svih unesenih troškova:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      
                    ),
                  ),
                  // Lista troškova
                  Expanded(
                    child: ListView.separated(
                      itemCount: expenses.length + 1, // Dodajemo +1 za ukupni zbroj
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (index < expenses.length) {
                          final expense = expenses[index];
                          return ListTile(
                            title: Text(
                                "${expense['name']} - ${expense['amount']}€ - ${expense['month']}"),
                          );
                        } else {
                          // Zadnji element liste -> prikaz ukupnog troška
                          return ListTile(
                            title: Center(
                              child: Text(
                                "Ukupno: $totalSum€",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            tileColor: Colors.lightBlue, // Drugačija boja pozadine
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}*/
/*import 'package:flutter/material.dart';
import 'database_helper.dart';

class AllExpensesScreen extends StatefulWidget {
  const AllExpensesScreen({super.key});

  @override
  _AllExpensesScreenState createState() => _AllExpensesScreenState();
}

class _AllExpensesScreenState extends State<AllExpensesScreen> {
  List<Map<String, dynamic>> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final data = await DatabaseHelper.getExpenses();
    setState(() {
      expenses = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalSum =
        expenses.fold(0, (sum, item) => sum + (item['amount'] as double));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Svi troškovi"),
      ),
      backgroundColor: Colors.lightBlueAccent, // Postavi boju pozadine ekran
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: expenses.isEmpty
            ? const Center(child: Text("Nema podataka."))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dodana rečenica
                  Container(
                    color: Colors.greenAccent, // Pozadinska boja rečenice
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Popis svih unesenih troškova:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Boja teksta crna
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount:
                          expenses.length + 1, // Dodajemo +1 za ukupni zbroj
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (index < expenses.length) {
                          final expense = expenses[index];
                          return ListTile(
                            title: Text(
                                "${expense['name']}, ${expense['amount']}€, ${expense['month']}"),
                          );
                        } else {
                          return ListTile(
                            title: Center(
                              child: Text(
                                "Ukupno: $totalSum€",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            tileColor: Colors.greenAccent,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'database_helper.dart';

class AllExpensesScreen extends StatefulWidget {
  const AllExpensesScreen({super.key});

  @override
  _AllExpensesScreenState createState() => _AllExpensesScreenState();
}

class _AllExpensesScreenState extends State<AllExpensesScreen> {
  List<Map<String, dynamic>> expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    final data = await DatabaseHelper.getExpenses();
    setState(() {
      expenses = data;
    });
  }

  Future<void> _deleteExpense(int id) async {
    bool confirmDelete = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Brisanje troška"),
              content: const Text(
                  "Jeste li sigurni da želite obrisati ovaj trošak?"),
              actions: [
                TextButton(
                  child: const Text("Odustani"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Obriši",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            );
          },
        ) ??
        false;

    if (confirmDelete) {
      await DatabaseHelper.deleteExpense(id);
      _loadExpenses(); // Automatsko ažuriranje liste
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalSum =
        expenses.fold(0, (sum, item) => sum + (item['amount'] as double));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Svi troškovi"),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: expenses.isEmpty
            ? const Center(child: Text("Nema podataka."))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Popis svih unesenih troškova:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: expenses.length + 1,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        if (index < expenses.length) {
                          final expense = expenses[index];
                          return ListTile(
                            title: Text(
                                "${expense['name']}, ${expense['amount']}€, ${expense['month']}"),
                            trailing: IconButton(
                              icon:
                                  const Icon(Icons.delete, color: Colors.black),
                              onPressed: () => _deleteExpense(expense['id']),
                            ),
                          );
                        } else {
                          return ListTile(
                            title: Center(
                              child: Text(
                                "Ukupno: $totalSum€",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            tileColor: Colors.greenAccent,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
