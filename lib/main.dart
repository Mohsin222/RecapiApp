import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testapp2/routes/RoutePage.dart';
import 'package:testapp2/routes/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: Routes.Splash,
      getPages: RoutePages.pages,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: RecipeScreen(),
    );
  }
}

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  Color selectedColor = Colors.blue;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TweenAnimationBuilder(
        tween: Tween(begin: 0, end: 200),
        duration: const Duration(milliseconds: 1500),
        builder: (context, value, child) {
          return Container(
            width: 199,
            height: 100,
            decoration: const BoxDecoration(color: Colors.blue, boxShadow: [
              BoxShadow(color: Colors.red),
              BoxShadow(color: Colors.green)
            ]),
          );
        },
      ),
    );
  }
}
