import 'package:flutter/material.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/blender_mixer_screen.dart';
import 'screens/blender_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Default to Blender Mixer (third icon)
  final List<Widget> _screens = [
    Container(),
    const BlindMixerScreen(), // Placeholder for second screen (if needed)
    const MixerScreen(),
    const BlindMixerScreen(), // Placeholder for fourth screen (if needed)
    const EditProfileScreen(), // Placeholder for fifth screen (if needed)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 29.0, horizontal: 9.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Iconsax.radar4, color: Colors.black87),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Image.asset(
                'assets/image9.png',
                width: 27,
                height: 27,
                color: Colors.black87,
              ),
              onPressed: () => _onItemTapped(1),
            ),
              IconButton(
              icon: SvgPicture.asset(
               'assets/g51.svg',
               width: 27,
               height: 27,
               color: Colors.black87, 
               ),
              onPressed: () => _onItemTapped(2),
              
            ),
            IconButton(
              icon: const Icon(Iconsax.eye, color: Colors.black87),
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: const Icon(Iconsax.profile_circle, color: Colors.black87),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
