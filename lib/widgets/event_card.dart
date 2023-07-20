import 'package:events_app_intern_task/models/event_model.dart';
import 'package:events_app_intern_task/screens/event_details_screen.dart';
import 'package:events_app_intern_task/utils/helper.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
   EventCard({super.key, required this.event});
  final Event event;

  late final String _dateTime = convertDateTimeofEventCard(event.dateTime.toString());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EventDetailsScreen(
              event: event,
            );
          },
        ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Row(
            children: [
              // image

              Container(
                width: 79,
                height: 92,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(event.bannerImage),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${_dateTime}",
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5669FF))),
                    const SizedBox(height: 5),
                    Text(event.title,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF120D26))),
                    const SizedBox(height: 11),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 14,
                          color: Color(0xFFB0B1BC),
                        ),
                        Expanded(
                          child: Text(
                            " ${event.venueName} ● ${event.venueCity}, ${event.venueCountry}",
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF747688)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
