import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbar (String message) {
 final snackBar = SnackBar(
  content: Row(
    children: [
      const Icon(Icons.warning, color: Colors.white),
      const SizedBox(width: 10),
      Flexible(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ],
  ),
  backgroundColor: Colors.deepPurple,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  behavior: SnackBarBehavior.floating,
  action: SnackBarAction(
    label: 'OK',
    textColor: Colors.yellow,
    onPressed: () {
      // Código para manejar la acción del botón
    },
  ),
  duration: const Duration(seconds: 5),
);




    messengerKey.currentState!.showSnackBar(snackBar);
  }

}