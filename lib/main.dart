import 'package:apping/screeens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //     builder: (context, widget) => ResponsiveWrapper.builder(
    //         child,
    //         maxWidth: 1200,
    //         minWidth: 480,
    //         defaultScale: true,
    //         breakpoints: [
    //           const ResponsiveBreakpoint.resize(480, name: MOBILE),
    //           const ResponsiveBreakpoint.autoScale(800, name: TABLET),
    //           const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
    //         ],
    //         background: Container(color: const Color(0xFFF5F5F5))),
    //     initialRoute: "/",
    //   );

    return MaterialApp(
      //not using responsive layout since i havent used ongenerated // // //
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CartScreen(),
    );
  }
}
