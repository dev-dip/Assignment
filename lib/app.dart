import 'package:assignmentostad/screens/desktop_ui.dart';
import 'package:assignmentostad/screens/mobile_ui.dart';
import 'package:assignmentostad/screens/tablet_ui.dart';
import 'package:assignmentostad/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: MobileUi(),
      tablet: TabletUi(),
      desktop: DesktopUi(),
    );
  }
}