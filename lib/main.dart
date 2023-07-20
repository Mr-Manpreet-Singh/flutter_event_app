import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:events_app_intern_task/screens/events_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const EventsScreen(),
      // home: EventDetailsScreen(),
    );
  }
}
