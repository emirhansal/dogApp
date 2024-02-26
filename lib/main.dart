import 'package:dog/services/bloc.dart';
import 'package:dog/ui/splash/view_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProviderBloc(StateBlocInitial()),
        child: const ViewSplash(),
      ),
    );
  }
}
