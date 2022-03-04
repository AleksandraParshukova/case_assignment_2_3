import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: '2.3'),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: '2.3'),
        '/one': (context) => const OneScreenWidget(),
        '/two': (context) => const TwoScreenWidget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            TextButton(
              onPressed: () {},
              onLongPress: () {},
              child: const Text('Кнопка 1'),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.white30),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.watch),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm),
            ),
          ],
        ),
        drawer: const NavigationDrawerWidget(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              label: 'Главный',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Первый',
              icon: Icon(Icons.mail),
            ),
            BottomNavigationBarItem(
              label: 'Второй',
              icon: Icon(Icons.person),
            ),
          ],
          onTap: (int index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/one');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/two');
            }
          },
        ),
        body: Center(
          child: Text(
            'Главный экран',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
