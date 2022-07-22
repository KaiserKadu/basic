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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Basic Widgets',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Basic widgets'),
        '/newScreen': (context) => const newScreen(),
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
  int currentIndex = 0;
  String buttonName = 'Open Seasame';
  // ignore: non_constant_identifier_names
  final Contacts = List<String>.generate(100, (index) => 'Contact $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: currentIndex == 0
          ? Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.of(context).pushNamed('/newScreen'),
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff66BFBF),
                        shadowColor: Colors.red.shade400),
                    child: Text(buttonName),
                  )
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: Contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(Contacts[index]),
                  trailing: const Icon(Icons.view_list_outlined),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.yard_rounded),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        unselectedItemColor: const Color(0xffFFFFFF),
        unselectedFontSize: 14,
        selectedItemColor: Colors.deepPurpleAccent.shade700,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            label: 'Profile',
            icon: Icon(
              Icons.person,
            ),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
      ),
    );
  }
}

class newScreen extends StatefulWidget {
  const newScreen({Key? key}) : super(key: key);

  @override
  State<newScreen> createState() => _newScreenState();
}

class _newScreenState extends State<newScreen> {
  bool isOn = false;
  bool? isBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoutout to JWST'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isTrue(),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 10,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.purple.shade800,
              // ignore: prefer_const_constructors
              child: Text(
                textAlign: TextAlign.center,
                'JWST is revolutionary',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint('Eleveated Button');
              },
              child: const Text('Elevated button'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Outlined Button');
              },
              child: const Text('Outlined button'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Text Button');
              },
              child: const Text('Text button'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.airplanemode_active,
                  color: isOn ? Colors.blue : Colors.greenAccent,
                ),
                const Text('Row Widget'),
                Icon(
                  Icons.airplanemode_active,
                  color: isOn ? Colors.green : Colors.blueAccent,
                ),
              ],
            ),
            Switch(
              value: isOn,
              onChanged: (bool newbool) {
                setState(
                  () {
                    isOn = newbool;
                  },
                );
              },
            ),
            Checkbox(
              value: isBox,
              onChanged: (bool? newBool) {
                setState(
                  () {
                    isBox = newBool;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }


  Widget isTrue(){
    if (isBox == true) {
    return Image.asset('images/jwst2.jpg');
    }
    else{
      return Image.asset('images/jwst1.jpg');
    }
  }
}
