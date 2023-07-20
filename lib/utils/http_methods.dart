import 'package:events_app_intern_task/providers/all_events_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:events_app_intern_task/models/event_model.dart';

class HttpMethods {
  final allEventsEndPoint =
      'https://sde-007.api.assignment.theinternetfolks.works/v1/event';

  // Get All Events API

  Future<List<Event>> getAllEvents() async {
    var request = http.Request('GET', Uri.parse(allEventsEndPoint));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responceBody = await response.stream.bytesToString();
      final fetchedData = fetchedDataFromJson(responceBody);
      final List<Event> allEvents = fetchedData.content.data;

      // Sending data to Provider

      final AllEventsNotifier allEventsNotifier = AllEventsNotifier();
      allEventsNotifier.addListOfEvents(allEvents);
      debugPrint("getAllEvents api success + data sent to provider");
      return allEvents;
    } else {
      throw Exception('Failed to load events');
    }
  }

  // Search API

  Future<List<Event>> searchInAllEvents(String value) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$value'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responceBody = await response.stream.bytesToString();
      final fetchedData = fetchedDataFromJson(responceBody);
      final List<Event> allSearchedEvents = fetchedData.content.data;

      // Sending data to Provider
      // final AllEventsNotifier allEventsNotifier = AllEventsNotifier();
      // allEventsNotifier.addListOfEvents(allSearchedEvents);

      debugPrint("searchInAllEvents api success ");
      return allSearchedEvents;
    } else {
      return [];
    }
  }
}
