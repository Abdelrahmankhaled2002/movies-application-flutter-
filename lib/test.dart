import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return MoviesScreen();
          }));
        },
          child: Text('Navigate'),
        ),
      ),
    );
  }
}
