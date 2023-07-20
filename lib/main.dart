import 'package:flutter/material.dart';

import 'package:events_app_intern_task/screens/event_details_screen.dart';
import 'package:events_app_intern_task/screens/events_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
