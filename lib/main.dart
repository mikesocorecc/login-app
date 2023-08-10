import 'package:flutter/material.dart'; 
import 'package:login/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:login/services/services.dart';
 
 
void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()), 
      ],
      child: MyApp(),
    );
  }
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login page',
        initialRoute: 'checking',
        routes: {
          'checking'    : ( BuildContext context ) => CheckAuthScreen(),

          'home'     : ( BuildContext context ) => HomeScreen(), 
          'product'     : ( BuildContext context ) => ProductScreen(), 

          'login'    : ( BuildContext context ) => LoginScreen(),
          'register'    : ( BuildContext context ) => RegisterScreen(),
        },
        scaffoldMessengerKey: NotificationsService.messengerKey,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300]
        ),
    );
      
  }
}