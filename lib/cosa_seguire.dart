import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_calendar/squadre/squadre.dart';

class cosa_seguire extends StatelessWidget {
  const cosa_seguire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 140.0,
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0))),
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
                            margin: EdgeInsets.only(bottom: 10.0, left: 8, right: 8),
                            child: Text(
                              'Scegli gli sport, le competizioni o le squadre che vuoi seguire',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                              maxLines: 3,
                            ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: SizedBox(height: 1,),
                         ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => squadre()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.futbol,
                              color: Colors.lightGreen,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "SQUADRE",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "0 seguiti",
                              style: TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () {
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.whatshot_rounded,
                              color: Colors.red,
                              size: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "COMPETIZIONI CALCISTICHE",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "0 seguiti",
                              style: TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () {
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_sharp,
                              color: Colors.lightBlue,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "FORMULA 1",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Non la stai seguendo",
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () {
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.black,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "BASKET",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "0 seguiti",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () {
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_sharp,
                              color: Colors.lightBlue,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "LOL ESports",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Non la stai seguendo",
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          elevation: MaterialStateProperty.all<double>(8.0),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ))),
                      onPressed: () {
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.black,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "FIFA ESports",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "0 seguiti",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
