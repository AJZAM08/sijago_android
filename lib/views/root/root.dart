import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/routes/route_app.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PNM SiJago',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      initialRoute: '/',
      getPages: RouteApp.pages,
    );
  }
}