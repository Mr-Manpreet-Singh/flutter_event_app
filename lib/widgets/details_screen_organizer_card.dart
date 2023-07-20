import 'package:events_app_intern_task/models/event_model.dart';
import 'package:flutter/material.dart';

class OrganizerCard extends StatelessWidget {
  const OrganizerCard({super.key, required this.event});
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
              width: 54,
              height: 51.68,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        event.organiserIcon), 
                    fit: BoxFit.cover,
                  ))),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.organiserName,
                  style: const TextStyle(
                    fontSize: 15,
                  )),
              const Text(
                "Organizer",
                style: TextStyle(fontSize: 12, color: Color(0xFf706E8F)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FontWeith {}
