import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScoreCard(
              title: 'My score in flutter',
            ),
            SizedBox(
              height: 30,
            ),
            ScoreCard(
              title: 'My score in dart',
            ),
            SizedBox(
              height: 30,
            ),
            ScoreCard(
              title: 'My score in React',
            ),
          ],
        ),
      ),
    )),
  );
}

class ScoreCard extends StatefulWidget {
  final String title;
  const ScoreCard({Key? key, required this.title}) : super(key: key);

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0;

  void add() {
    if (score < 10) {
      setState(() {
        score++;
      });
    }
  }

  void remove() {
    if (score > 0) {
      setState(() {
        score--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 210,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
                color: Colors.grey, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: remove,
                icon: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 100,
              ),
              IconButton(
                onPressed: add,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: (score / 10) * 420,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
