import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group127Widget - GROUP
    return Center(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 600,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                      border: Border.all(
                        color: Color.fromRGBO(103, 140, 255, 1),
                        width: 2,
                      ),
                    ),
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 10,
                          left: 14,
                          child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 7.083303451538086,
                                    left: 3.3333029747009277,
                                    child: Container(
                                        width: 33.33340072631836,
                                        height: 25.833364486694336,
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                              top: 0.00001811981201171875,
                                              left: 0.00001811981201171875,
                                              child: Icon(
                                                Icons.email_outlined,
                                              )),
                                        ]))),
                              ]))),
                      Positioned(
                          top: 9,
                          left: 64,
                          child: Text(
                            'Your Email Address',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(144, 152, 177, 1),
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.normal,
                                height: 1.5 /*PERCENT not supported*/
                                ),
                          )),
                    ]))),
            Positioned(
              top: 110,
              left: 0,
              child: Container(
                width: 600,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                  border: Border.all(
                    color: Color.fromRGBO(103, 140, 255, 1),
                    width: 2,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(top: 10, left: 17, child: Icon(Icons.password)),
                    Positioned(
                      top: 9,
                      left: 64,
                      child: Text(
                        'Your Password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(144, 152, 177, 1),
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.normal,
                            height: 1.5 /*PERCENT not supported*/
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
