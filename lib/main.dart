import 'package:dice/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:dice/reusable_widgets.dart';

void main() {
  
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ModernAppBar(
          title: "DiceApp",
          subtitle: "Welcome Player",

          // textColor: Colors.lightGreenAccent,
          actions: [
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          ],
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.games_outlined)),
          // backgroundColor: Colors.white,
          
        ),
        // appBar: AppBar(title: const Center(child: Text("Dice App"))),
        body: GradientContainer(
          colors: [
            Color.fromARGB(255, 33, 5, 109),
            Color.fromARGB(255, 68, 21, 148),
          ],
        ),
        bottomNavigationBar: ModernBottomNav(
          currentIndex: 0,
          selectedColor: Colors.amber,
          onTap: (index) {},
          items: [
            ModernBottomNavItem(icon: Icons.home, label: 'Home'),
            // ModernBottomNavItem(icon: Icons.search, label: 'Search'),
            // ModernBottomNavItem(icon: Icons.favorite, label: 'Favorites'),
            // ModernBottomNavItem(icon: Icons.person, label: 'Profile'),
          ],
        ),
      ),
    ),
  );
}
