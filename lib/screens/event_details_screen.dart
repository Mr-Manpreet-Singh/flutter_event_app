import 'package:events_app_intern_task/utils/helper.dart';
import 'package:flutter/material.dart';

import 'package:events_app_intern_task/models/event_model.dart';
import 'package:events_app_intern_task/widgets/book_now_button.dart';
import 'package:events_app_intern_task/widgets/details_screen_venue_card.dart';
import 'package:events_app_intern_task/widgets/details_screen_organizer_card.dart';

class EventDetailsScreen extends StatelessWidget {
  EventDetailsScreen({super.key, required this.event});
  final Event event;

  late final String _date =
      convertToFormattedDateForDetailsScreen(event.dateTime.toString());
  late final String _day =
      convertToFormattedDayForDetailsScreen(event.dateTime.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        // colo
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Event Details",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image
            Container(
              width: double.infinity,
              height: 244,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(event.bannerImage),
                      fit: BoxFit.cover)),
            ),

            Container(
              padding: const EdgeInsets.all(21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.title,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                      )),
                  OrganizerCard(event: event),
                  const SizedBox(height: 20),
                  DetailsScreenVenueCard(title: _date, subTitle: _day),
                  const SizedBox(height: 20),
                  DetailsScreenVenueCard(
                      title: event.venueName,
                      subTitle: "${event.venueCity}, ${event.venueCountry}"),
                  const SizedBox(height: 33),
                  const Text("About Event",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(height: 8),
                  Text(event.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(height: 8),
                  const BookNowButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
