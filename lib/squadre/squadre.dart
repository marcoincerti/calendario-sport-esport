import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class squadre extends StatefulWidget {
  const squadre({Key? key}) : super(key: key);

  @override
  _squadreState createState() => _squadreState();
}

class _squadreState extends State<squadre> {
  final Stream<DocumentSnapshot> _squadreStream = FirebaseFirestore.instance.collection('Squadre').doc('IyF58ZnsOXSPafQ5IdfR').snapshots();

  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                floating: false,
                pinned: true,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))),
                elevation: 8,
                backgroundColor: Colors.green,
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
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Scegli i tuoi tags",
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                              child: TextField(
                                onChanged: (value) {},
                                textCapitalization: TextCapitalization.sentences,
                                controller: editingController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Search",
                                    hintText: "Search",
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "In questa sezione puoi scegliere le squadre che vorrai seguire.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 4,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.amber
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Queste sono le tue squadre preferite:",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
                        child: Text('Non hai inserito nessuna squadra nelle tue preferite',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.redAccent),
                          maxLines: 4,),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<DocumentSnapshot>(
                  stream: _squadreStream,
                  builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Ci dispiace, qualcosa è andato storto... :(');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    Map<String, dynamic> data = snapshot.data!.data()! as Map<String, dynamic>;
                    return ListView.builder(
                      itemCount: data.keys.length,
                      itemBuilder: (BuildContext context, int index) {
                        String key = data.keys.elementAt(index);
                        return new Column(
                          children: <Widget>[
                            new ListTile(
                              title: new Text("$key"),
                              subtitle: new Text("${data[key]}"),
                            ),
                            new Divider(
                              height: 2.0,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
