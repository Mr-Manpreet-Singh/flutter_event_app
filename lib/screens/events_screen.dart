import 'package:events_app_intern_task/screens/search_screen.dart';
import 'package:events_app_intern_task/widgets/event_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:events_app_intern_task/models/event_model.dart';
import 'package:events_app_intern_task/utils/http_methods.dart';
import 'package:events_app_intern_task/widgets/event_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key,});


  @override
  ConsumerState<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  Future<List<Event>> requestAllEventDetails() async {
    final httpMethods = HttpMethods();
    return await httpMethods.getAllEvents();
  }

  @override
  void initState() {
    // TODO: implement initState
    requestAllEventDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("provider Fetched Events count = ${allEvents.length}");
    return Scaffold(
      // backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Events"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ));
            },
            // icon:  Image.asset("assets/images/search.svg")
            icon:  SvgPicture.asset('assets/images/search.svg')
            
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 7, top: 24),
        child: EventListBuilder(events: requestAllEventDetails())
      ),
    );
  }
}
