import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:login/widgets/widgets.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Leer nuestro provider AuthService
    final authService = Provider.of<AuthService>(context, listen: false);
    
    return  Scaffold(
    appBar:  const HomeAppBar(),
      body:   ListView(
         children: const  [
             
         ], 
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú'),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () {
                // Actualizar el estado de la aplicación
                // ...
                // Luego cerrar el drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Opción 2'),
              onTap: () {
                // Actualizar el estado de la aplicación
                // ...
                // Luego cerrar el drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar( 
        backgroundColor: Colors.transparent,
          color:   const Color(0xFF4C53A5),
          height: 70,
          items:  const [
            Icon(Icons.home, size: 30, color: Colors.white,),
            Icon(Icons.card_travel_outlined, size: 30, color: Colors.white,),
            Icon(Icons.list, size: 30, color: Colors.white,),
          ],
          onTap: (index) {
            //Handle button tap
          },
      ),
    );
  }
}
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.sort, size: 30, color: Color(0xFF4C53A5)),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('MK Shop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                      fontSize: 23,
                    ))),
            const Spacer(),
            badges.Badge(
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.red,
                padding: EdgeInsets.all(7),
              ),
              badgeContent:
                  const Text('3', style: TextStyle(color: Colors.white)),
              child: InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 32,
                  color: Color(0xFF4C53A5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0); // aquí puedes cambiar la altura
}
