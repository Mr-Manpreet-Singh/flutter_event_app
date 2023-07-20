import 'package:flutter/material.dart';

import 'package:events_app_intern_task/models/event_model.dart';

class DetailsScreenVenueCard extends StatelessWidget {
  const DetailsScreenVenueCard(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // color: const Color(0xffEEF0FF),
            ),
            padding: const EdgeInsets.all(9),
            child: const Icon(
              Icons.calendar_month_rounded,
              size: 30,
              color: Color(
                0xFF5669FF,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF120D26))),
              Text(
                subTitle,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF747688)),
              )
            ],
          )
        ],
      ),
    );
  }
}
