import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';

import 'cosa_seguire.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Card(
            child: Padding(
              child: Text(
                "Something is not right here...",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: const EdgeInsets.all(8.0),
            ),
            color: Colors.red,
            margin: EdgeInsets.zero,
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(home: MyHomePage());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final translator = GoogleTranslator();
  final DateTime now = DateTime.now();
  final DateFormat formatter = new DateFormat('EEEE d MMMM');
  final bool variabile = true;

  @override
  Widget build(BuildContext context) {
    final String formatted_date = formatter.format(now);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 140.0,
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))),
              elevation: 8,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: FutureBuilder(
                              future: translator.translate(formatted_date, to: 'it'),
                              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return Center(
                                        child: CircularProgressIndicator(
                                      color: Colors.lightGreen,
                                    ));
                                  default:
                                    if (snapshot.hasError)
                                      return Center(child: Text('$formatted_date'));
                                    else {
                                      var data = snapshot.data;
                                      return Text(
                                        '$data',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                                        maxLines: 2,
                                      );
                                    }
                                }
                              },
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: 40.0),
                          child: Text(
                            'Pianifica la tua settimana sportiva!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 60),
          child: variabile
              ? Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Eventi di oggi',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    stops: [
                                      0.1,
                                      0.9
                                    ],
                                    colors: [
                                      Colors.red,
                                      Colors.white,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20),),),
                              margin: EdgeInsets.all(8),
                              height: 150,
                              width: 150,
                              child: Column(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child:
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                                              child: Text(
                                                '15:00',
                                                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                        child: Center(
                                          child: Text(
                                            'Prove libere 1 di formula',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                            maxLines: 3,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                                        child: Text(
                                          'Amazon Prime',
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            );
                          }),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    'Inizia premendo sul bottone in basso per selezionare competizioni, squadre e sport da non perdere!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 5,
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Aggiungi partita',
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => cosa_seguire()),
          );
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
