import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loginpage/service/api_service.dart';
import 'package:loginpage/utils/app_route.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => APIService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

       // route
       onGenerateRoute: onGenerateRoute,
       initialRoute: '/splash',
        builder: EasyLoading.init(),


      ),
    );
  }
}
