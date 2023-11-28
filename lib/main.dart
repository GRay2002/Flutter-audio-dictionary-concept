import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TranslationApp(),
    );
  }
}

class TranslationApp extends StatefulWidget {
  const TranslationApp({super.key});

  @override
  _TranslationAppState createState() => _TranslationAppState();
}

class _TranslationAppState extends State<TranslationApp> {
  // Lista de cuvinte, pattern: 'română', 'germană'
  List<String> phrases = [
    'Salut',
    'Willkommen',
    'Ma numesc',
    'Ich heiße',
    'Cum ești?',
    'Wie geht es dir?',
    'Sunt bine',
    'Ich bin gut',
  ];

  AudioPlayer audioPlayer = AudioPlayer();

  void playAudio(int index) {
    //Dam play la audio cu indexul dat ca parametru. Avem inclus path-ul.
    audioPlayer.play('res/basic_phrases/$index.mp3', isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Basic Phrases', style: TextStyle(fontSize: 36, color: Colors.white))),
        backgroundColor: Colors.purple[900],
      ),
      //folosim GridView pentru a afisa lista de cuvinte intr-un grid cu 2 coloane
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //numarul de coloane
          crossAxisCount: 2,
        ),

        //numarul de itemi din lista
        itemCount: phrases.length,

        //builderul pentru fiecare item din lista (un fel de for my fancy)
        itemBuilder: (context, index) {
          //indexul este indexul din lista de cuvinte, dar noi vrem sa incepem de la 1, nu de la 0 (pentru ca avem fisierele audio de la 1.mp3 la 8.mp3)
          int phraseIndex = index + 1;

          //returnam un GestureDetector pentru a putea da apasa pe fiecare item din lista
          return GestureDetector(
            onTap: () {
              //apelam functia de play audio cu indexul itemului din lista
              playAudio(phraseIndex);
            },

            //creem un card pentru fiecare item din lista
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(10),

              //Chestii care fac cardul sa arate bine :))
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.purple[700]!, Colors.purple[900]!], // Adjust colors as needed
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    phrases[index],
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
