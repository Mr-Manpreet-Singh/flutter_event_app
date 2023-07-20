import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:events_app_intern_task/models/event_model.dart';

class AllEventsNotifier extends StateNotifier<List<Event>> {
  AllEventsNotifier() : super([]);

  addListOfEvents(List<Event> events) {
    state = [...state, ...events];
    debugPrint("all events count stored in provider = ${state.length}");
    
  }
}

final allEventsProvider = StateNotifierProvider<AllEventsNotifier, List<Event>>(
  (ref) => AllEventsNotifier(),
);
