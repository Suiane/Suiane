
import 'package:flutter/material.dart'; 
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    title: 'Receitas de Chocolates',
    home: RandomWords()
    );
  }
}
class RandomWordsState extends State<RandomWords>{
  final _suggestions = <String>["Petit Gateau de Nutella", "Torta Caprese", "Suflê de Chocolate", "Brigadeiro de Pão de Mel", "Bolo Praliné no Pote", "Macaron Au Chocolat", "Coulant de Chocolate", "Trufa de Brigadeiro"];
  final Set<String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Receitas de Chocolates'),
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          return null;
        }
        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(String pair){
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState((){
           if (alreadySaved) {
             _saved.remove(pair);
           } else {
             _saved.add(pair);
           }
        });
      }
    );
  }
}
class RandomWords extends StatefulWidget {
  @override 
  RandomWordsState createState() => RandomWordsState();
}