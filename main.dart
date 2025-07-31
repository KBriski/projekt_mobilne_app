/* 
podsjetnik: 
.dart
1. main.dart - pokreće aplikaciju i navigira između ekrana
2. database_helper.dart - bitna za interakciju s bazom podataka, u njemu  su definirane sve metode za unos, dohvat i manipulaciju podacima u bazi
3. expense_screen.dart - unos troškova, početni zaslon
4. all_expenses_screen.dart - prikaz svih troškova, drugi zaslon
5. month_expenses_screen.dart - prikaz ukupnih troškova po mjesecima, treći zaslon


objašnjenje šta je šta :D

_getDatabase():
--> Ova metoda otvara bazu podataka ili je stvara ako ne postoji. Koristi sqflite paket za pristup bazi.

insertExpense():
-->Ova metoda unosi trošak (naziv, iznos i mjesec) u tabelu expenses. Ako već postoji sličan zapis, koristi ConflictAlgorithm.replace da bi zamijenila postojeći zapis.

getExpenses():
-->Dohvaća sve troškove iz baze i vraća ih kao listu mapa.

getExpensesByMonth():
-->Dohvaća sve troškove za određeni mjesec.

getTotalExpenseForMonth():
-->Dohvaća ukupni iznos svih troškova za određeni mjesec koristeći SQL funkciju SUM.

--> Početni ekran je ExpenseScreen.  znači da kada pokrenem aplikaciju,  prvo vidim ExpenseScreen.
-->U ExpenseScreen, postoje dva dugmeta:
1) "Pogledaj sve troškove" – klikom na ovo dugme, aplikacija će navigirati na ekran AllExpensesScreen.
2) "Pogledaj troškove po mjesecima" – klikom na ovo dugme, aplikacija će navigirati na ekran MonthExpensesScreen.
*/

// import 'all_expenses_screen.dart';
// import 'month_expenses_screen.dart';

/*import 'package:flutter/material.dart';
import 'expense_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Troškovnik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Troškovnik', // Naslov aplikacije
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold), // Stil za naslov
          ),
        ),
        body: const ExpenseScreen(), // Glavni ekran aplikacije
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'expense_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Troškovnik', // Naslov aplikacije
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), // Stil za naslov
            ),
          ),
        ),
        body: const ExpenseScreen(), // Glavni ekran aplikacije
      ),
    );
  }
}
