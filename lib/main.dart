import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trecker_sample/Homescreen/bloc/chat_bloc.dart';
import 'package:trecker_sample/Homescreen/view/Homesceern.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}
void main(){
  runApp(MultiBlocProvider(providers: [BlocProvider(create: (context) => ChatBloc().. add(Ontaper()),)], child: Myapp()));
}