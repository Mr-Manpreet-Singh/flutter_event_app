import 'package:flutter/material.dart';
import 'package:events_app_intern_task/models/event_model.dart';
import 'package:events_app_intern_task/widgets/event_card.dart';

class EventListBuilder extends StatelessWidget {
  const EventListBuilder({super.key, required this.events});
  final Future<List<Event>> events;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
      future: events,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error occurred: ${snapshot.error}'));
        } else {
          List<Event> allEvents = snapshot.data!;
          return ListView.builder(
              itemCount: allEvents.length,
              itemBuilder: (context, index) {
                return EventCard(event: allEvents[index]);
              });
        }
      },
    );
  }
}
