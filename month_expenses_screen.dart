import 'package:flutter/material.dart';
import 'database_helper.dart';

class MonthExpensesScreen extends StatefulWidget {
  const MonthExpensesScreen({super.key});

  @override
  _MonthExpensesScreenState createState() => _MonthExpensesScreenState();
}

class _MonthExpensesScreenState extends State<MonthExpensesScreen> {
  Map<String, double> monthlyTotals = {};

  @override
  void initState() {
    super.initState();
    _loadMonthlyTotals();
  }

  Future<void> _loadMonthlyTotals() async {
    List<String> allMonths = [
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

    for (String month in allMonths) {
      double total = await DatabaseHelper.getTotalExpenseForMonth(month);
      setState(() {
        monthlyTotals[month] = total;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Izračunavanje ukupnog troška
    double totalExpense =
        monthlyTotals.values.fold(0, (sum, value) => sum + value);

    return Scaffold(
      appBar: AppBar(title: const Text("Mjesečni troškovi")),
      backgroundColor: Colors.lightBlueAccent, // Boja pozadine cijelog ekrana
      body: monthlyTotals.isEmpty
          ? const Center(
              child: Text(
                "Nema unesenih troškova za prikaz.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dodajemo rečenicu ispod naslova s pozadinskom bojom
                  Container(
                    color: Colors.greenAccent, // Pozadinska boja za rečenicu
                    padding: const EdgeInsets.all(8.0), // Unutarnje margine
                    child: const Text(
                      "Popis svih mjeseci i mjesečnih troškova:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Boja teksta crna
                      ),
                    ),
                  ),
                  // Lista svih troškova po mjesecima
                  Expanded(
                    child: Container(
                      color: Colors
                          .lightBlueAccent, // Pozadinska boja cijelog popisa
                      child: ListView(
                        children: [
                          ...monthlyTotals.entries.map((e) {
                            return ListTile(
                              title: Text(
                                  "${e.key}: ${e.value.toStringAsFixed(2)}€"),
                            );
                          }).toList(),
                          // Prikaz ukupnog troška sa specifičnom pozadinom
                          ListTile(
                            title: Center(
                              child: Container(
                                color: Colors
                                    .greenAccent, // Boja pozadine samo za tekst "Ukupno"
                                padding: const EdgeInsets.all(
                                    8.0), // Unutarnje margine za "Ukupno"
                                child: Text(
                                  "Ukupno: ${totalExpense.toStringAsFixed(2)}€",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Tekst crne boje
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
