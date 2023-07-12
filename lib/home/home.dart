import 'package:flutter/material.dart';
import 'package:tapshyrma7_quize_app/useFail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UseQuize useQuize = UseQuize();
  List<Icon> iconaluu = [];

  void teksher(bool koldonuu) {
    setState(() {
      if (useQuize.isFinished() == true) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Тест QuizeApp'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Тест аяктады!'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('жок'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('ооба'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        useQuize.indexZero();
        iconaluu = [];
      } else {
        if (useQuize.joopAluu() == koldonuu) {
          iconaluu.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          iconaluu.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        useQuize.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 26, 19),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Тапшырма 7",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Text(
                useQuize.surooAluu(),
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 335,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 29, 94, 63)),
                onPressed: () {
                  teksher(true);
                },
                child: const Text(
                  "ТУУРА",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 335,
              height: 70,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                onPressed: () {
                  teksher(false);
                },
                child: const Text(
                  "ТУУРА ЭМЕС",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: iconaluu.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return iconaluu[index];
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
