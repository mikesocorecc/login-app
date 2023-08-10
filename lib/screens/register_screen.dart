import 'package:flutter/material.dart';
import 'package:login/providers/login_form_provider.dart';
import 'package:login/ui/input_decorations.dart';
import 'package:login/widgets/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AuthBackground(
        child:   SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 180),
              CardContainer(
                child: Column(
                 children: [
                 const SizedBox(height: 20,),
                  Text(
                    "Crear cuenta",
                    style:  Theme.of(context).textTheme.headline4
                  ),
                  const SizedBox(height: 30),
                  // Pantalla de login
                  ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child:  _LoginForm(),
                  )
                 
                 ],
                ),
              ),
             const SizedBox(height: 50),
             TextButton(
                onPressed:  () => Navigator.pushReplacementNamed(context, 'login'), 
                style:ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(const StadiumBorder()),

                ) ,
                child: const Text(
                      "¿Ya tiene una cuenta?",
                      style: TextStyle(
                        fontSize: 18,  
                        color: Colors.black87
                  )
                )
              ), 
              const SizedBox(height: 50),
            ]
          ),
        ),
      ) 
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey, 
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: "john.doe@gmail.com", 
                prefixIcon: Icons.alternate_email_sharp,
                labelText: "Correo electronico"
              ), 
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp =   RegExp(pattern);
                return regExp.hasMatch(value ?? '') 
                ? null
                : 'El valor no es un correo electronico valido';
              }
            ),
           const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: "*******", 
                prefixIcon: Icons.lock_outline,
                labelText: "Contraseña"
              ), 
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                // Validate password value is max length 6 or
                if (value!.length < 6) {
                  return 'La contraseña debe tener al menos 6 caracteres';
                } 
                return null;
              }
            ),
            const SizedBox(height: 30,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple, 
              onPressed: loginForm.isLoading ? null : () async { 
                FocusScope.of(context).unfocus(); //Desactivar el teclado
                if (!loginForm.isValidForm()) return;

                // Indicar que se esta cargado 
                loginForm.isLoading = true;
                await Future.delayed(const Duration(seconds: 2));

                // TODO: Validar si el Login es correcto
                loginForm.isLoading = false;
                 
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, 'home');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child:   Text(
                  loginForm.isLoading ? 'Espere' : 'Ingresar', 
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}