class EventModel {
  final int? eventId;
  final String? eventTitle;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final String? eventPrice;
  final String? description;
  final String? category;
  final String? address;
  final String? city;
  final String? eventImage;

  EventModel({
    this.eventId,
    this.eventTitle,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.eventPrice,
    this.description,
    this.category,
    this.address,
    this.city,
    this.eventImage,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventId: json['eventId'],
      eventTitle: json['eventTitle'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      eventPrice: json['eventPrice'],
      description: json['description'],
      category: json['category'],
      address: json['address'],
      city: json['city'],
      eventImage: json['eventImage'],
    );
  }
}
