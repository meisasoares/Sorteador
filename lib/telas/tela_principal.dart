import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/img1.jpeg',
    'assets/img2.webp',
    'assets/img3.jpg',
  ];

  List<int> imagemSelecionada = [0, 1, 2];
  

  int contadorVitorias = 0; // contador de vitórias

  void sortear() {
    setState(() {
      imagemSelecionada[0] = Random().nextInt(images.length);
      imagemSelecionada[1] = Random().nextInt(images.length);
      imagemSelecionada[2] = Random().nextInt(images.length);
    });

    if (imagemSelecionada[0] == imagemSelecionada[1] &&
        imagemSelecionada[1] == imagemSelecionada[2]) {
      setState(() {
        contadorVitorias++;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Parabéns"),
          content: Text("Você ganhou"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width - 30;
    final larguraImagem = larguraTela / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text("Itsisasoares", style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 163, 219, 248),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          const SizedBox(height: 15),
          // Mostra o contador de vitórias
          Text(
            'Vitórias: $contadorVitorias',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                images[imagemSelecionada[0]],
                width: larguraImagem,
                height: 200,
              ),
              const SizedBox(width: 10),
              Image.asset(
                images[imagemSelecionada[1]],
                width: larguraImagem,
                height: 200,
              ),
              const SizedBox(width: 10),
              Image.asset(
                images[imagemSelecionada[2]],
                width: larguraImagem,
                height: 200,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: sortear,
        child: Icon(Icons.catching_pokemon),
        backgroundColor: const Color.fromARGB(255, 163, 219, 248),
        foregroundColor: Colors.white,
      ),
    );
  }
}
