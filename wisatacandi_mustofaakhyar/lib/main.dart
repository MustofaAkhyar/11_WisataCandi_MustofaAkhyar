import 'package:flutter/material.dart';
import 'package:wisatacandi_mustofaakhyar/data/candi_data.dart';
import 'package:wisatacandi_mustofaakhyar/screens/profile-screen.dart';
import 'package:wisatacandi_mustofaakhyar/screens/search_screen.dart';
import 'package:wisatacandi_mustofaakhyar/screens/sign_in_screen.dart';
import 'package:wisatacandi_mustofaakhyar/screens/sign_up_screen.dart';
import 'package:wisatacandi_mustofaakhyar/screens/detail_screen.dart';
import 'package:wisatacandi_mustofaakhyar/screens/home_screen.dart';
import 'package:wisatacandi_mustofaakhyar/widgets/item_card.dart';
import 'package:wisatacandi_mustofaakhyar/screens/favorite_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.deepPurple),
            titleTextStyle: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(
                primary: Colors.deepPurple, surface: Colors.deepPurple[50]),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO : 1. Deklarasikan variabel yang dibutuhkan
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 2. Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
        canvasColor: Colors.deepPurple[50],
      )
      , child: ),
      // TODO : 3. Buat properti Bottom Navigation Bar dengan nilai theme
      // TODO : 4. Buat data dan child dari theme

    );
  }
}