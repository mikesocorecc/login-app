import 'package:flutter/material.dart';
import 'package:login/screens/screens.dart';
import 'package:login/services/services.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
   
  const CheckAuthScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    // Leer nuestro provider AuthService
    final authService = Provider.of<AuthService>(context, listen: false);

    return   Scaffold(
      body: Center(
         child: FutureBuilder(
          future: authService.readToken(), 
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData) {
              return const Text('Espere');
            }

            if(snapshot.data == ''){
                Future.microtask(()   {

                  // Navigator.pushReplacementNamed(context, 'home');
                  Navigator.pushReplacement(context, PageRouteBuilder(
                    pageBuilder: (_, __, ___) => LoginScreen(), 
                    transitionDuration: const Duration(seconds: 0),
                  ) );
                });
            }else{
                  Future.microtask(()   {
 
                    Navigator.pushReplacement(context, PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomeScreen(), 
                      transitionDuration: const Duration(seconds: 0),
                    ) );
                });
            }
            
            
            return Container();
          }
        ),
      ),
    );
  }
}