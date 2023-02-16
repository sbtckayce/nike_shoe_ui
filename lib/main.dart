import 'package:flutter/material.dart';
import 'package:shoe_app/blocs/cart/cart_bloc.dart';
import 'package:shoe_app/config/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CartBloc()..add(StartCart()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFCEDDEE)
          
        ),
        initialRoute: '/login',
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}

