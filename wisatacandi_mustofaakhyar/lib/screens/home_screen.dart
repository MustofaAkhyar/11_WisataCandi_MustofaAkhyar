import 'package:flutter/material.dart';
import 'package:wisatacandi_mustofaakhyar/data/candi_data.dart';
import 'package:wisatacandi_mustofaakhyar/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 1. Buat App bar dengan judul "Wisata Candi"
      appBar: AppBar(
        title: const Text('Wisata Candi'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: candiList.length,
          itemBuilder: (context, index) {
            return ItemCard(candi: candiList[index]);
          }),
      // TODO : 2. Buat body dengan GridView.Builder
      // TODO : 3. Buat itemcard sebagai return value dari GridView.Builder
    );
  }
}
