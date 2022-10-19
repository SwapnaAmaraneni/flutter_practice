import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Flutter layout demo'),
          ),
          backgroundColor: Colors.greenAccent[400],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             // Image.asset
                Container(
                  width: 300,
                  height: 300,
                  alignment: Alignment.center,

                  child: Image.asset(
                    'assets/images/s1.jpg',
                  ),

                  margin: EdgeInsets.all(10.0),
                  //BoxDecoration Widget
                  decoration: BoxDecoration(
                   
                    /*  image: const DecorationImage(               
                      image: NetworkImage(
                          'https://pragativadi.com/core/uploads/2022/06/Untitled-design-11-2.png'),
                      fit: BoxFit.cover,
                    ), */ //DecorationImage
                    border: Border.all(
                      color: Colors.green,
                      width: 5,
                    ), //Border.all
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ), //BoxDecoration
                ),
                Container(
                  margin: const EdgeInsets.all(15.0),  
                  width: 300,
                 
                  alignment: Alignment.center,

                  child: Image.asset(
                    'assets/images/r3.jpg',
                    alignment: Alignment.center,
                  ),

              
                  //BoxDecoration Widget
                  decoration: BoxDecoration(
                    /*  image: const DecorationImage(               
                      image: NetworkImage(
                          'https://pragativadi.com/core/uploads/2022/06/Untitled-design-11-2.png'),
                      fit: BoxFit.cover,
                    ), */ //DecorationImage
                    border: Border.all(
                      color: Colors.green,
                      width: 8,
                    ), //Border.all
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ), //BoxDecoration
                ),
                Container(
                  width: 300,
                  height: 300,
                  //BoxDecoration Widget
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://pragativadi.com/core/uploads/2022/06/Untitled-design-11-2.png'),
                      fit: BoxFit.cover,
                    ), //DecorationImage
                    border: Border.all(
                      color: Colors.green,
                      width: 8,
                    ), //Border.all
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ), //BoxDecoration
                ),
              ],
            ),

            //Container
          ),
        ), //Center
      ),
    );
  }
}
