import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class EnglishWordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: EnglishWords(),
    );
  }
}

class EnglishWords extends StatefulWidget {
  @override
  _EnglishWordsState createState() => new _EnglishWordsState();
}

class _EnglishWordsState extends State<EnglishWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return new Divider();
        }

        final int index = i ~/ 2;

        if (index >= _suggestions.length) {
          // ...then generate 10 more and add them to the
          // suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final WordPair wordPair = new WordPair.random();
    //return new Text(wordPair.asPascalCase);

    return new Scaffold(
      // Add from here...
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}
