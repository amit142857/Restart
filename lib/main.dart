import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple[900]
      ),
      home: RandomWOrds());
  }
}

class RandomWOrds extends StatefulWidget {
  const RandomWOrds({Key? key}) : super(key: key);

  @override
  State<RandomWOrds> createState() => _RandomWOrdsState();
}

class _RandomWOrdsState extends State<RandomWOrds> {
  final _randomWordPairs =  <WordPair>[];

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, item) {
        if(item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length){
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase ,
      style: TextStyle(
        fontSize: 18
      ),),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wordpair Generator"),
      ),
      body: _buildList(),
    );
  }
}
