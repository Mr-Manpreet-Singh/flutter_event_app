// To parse this JSON data, do
//
//     final fetchedData = fetchedDataFromJson(jsonString);

import 'dart:convert';

FetchedData fetchedDataFromJson(String str) => FetchedData.fromJson(json.decode(str));

String fetchedDataToJson(FetchedData data) => json.encode(data.toJson());

class FetchedData {
    final Content content;
    final bool status;

    FetchedData({
        required this.content,
        required this.status,
    });

    factory FetchedData.fromJson(Map<String, dynamic> json) => FetchedData(
        content: Content.fromJson(json["content"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "content": content.toJson(),
        "status": status,
    };
}

class Content {
    final List<Event> data;
    final Meta meta;

    Content({
        required this.data,
        required this.meta,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        data: List<Event>.from(json["data"].map((x) => Event.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Event {
    final int id;
    final String title;
    final String description;
    final String bannerImage;
    final DateTime dateTime;
    final String organiserName;
    final String organiserIcon;
    final String venueName;
    final String venueCity;
    final String venueCountry;

    Event({
        required this.id,
        required this.title,
        required this.description,
        required this.bannerImage,
        required this.dateTime,
        required this.organiserName,
        required this.organiserIcon,
        required this.venueName,
        required this.venueCity,
        required this.venueCountry,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        bannerImage: json["banner_image"],
        dateTime: DateTime.parse(json["date_time"]),
        organiserName: json["organiser_name"],
        organiserIcon: json["organiser_icon"],
        venueName: json["venue_name"],
        venueCity: json["venue_city"],
        venueCountry: json["venue_country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "banner_image": bannerImage,
        "date_time": dateTime.toIso8601String(),
        "organiser_name": organiserName,
        "organiser_icon": organiserIcon,
        "venue_name": venueName,
        "venue_city": venueCity,
        "venue_country": venueCountry,
    };
}

class Meta {
    final int total;

    Meta({
        required this.total,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
    };
}
