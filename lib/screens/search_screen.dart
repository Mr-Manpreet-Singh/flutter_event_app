import 'package:events_app_intern_task/models/event_model.dart';
import 'package:events_app_intern_task/screens/events_screen.dart';
import 'package:events_app_intern_task/utils/http_methods.dart';
import 'package:events_app_intern_task/widgets/event_card.dart';
import 'package:events_app_intern_task/widgets/event_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchingValue = "";

  Future<List<Event>> requestAllEventDetails() async {
    final httpMethods = HttpMethods();
    return await httpMethods.searchInAllEvents(_searchingValue);
  }

  @override
  void initState() {
    requestAllEventDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      'assets/images/search_colored.svg',
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  child: VerticalDivider(
                    thickness: 10,
                    // color: Color(0xFF7974E7),
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: TextField(
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          hintText: "Type Event Name",
                          border: InputBorder.none),
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchingValue = value;
                        });
                      }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Expanded(child: EventListBuilder(events: requestAllEventDetails()))
        ]),
      ),
    );
  }
}
