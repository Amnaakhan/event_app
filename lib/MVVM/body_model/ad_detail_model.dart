class AdsDetailModel {
  Ad? ad;
  int? totalRaised;
  int? progress;

  AdsDetailModel({this.ad, this.totalRaised, this.progress});

  AdsDetailModel.fromJson(Map<String, dynamic> json) {
    ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : null;
    totalRaised = json['total_raised'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ad != null) {
      data['ad'] = this.ad!.toJson();
    }
    data['total_raised'] = this.totalRaised;
    data['progress'] = this.progress;
    return data;
  }
}

class Ad {
  int? donationId;
  int? userId;
  String? title;
  String? imageUrl;
  String? description;
  String? amount;
  int? isActive;
  String? addDate;
  String? updatedAt;

  Ad(
      {this.donationId,
        this.userId,
        this.title,
        this.imageUrl,
        this.description,
        this.amount,
        this.isActive,
        this.addDate,
        this.updatedAt});

  Ad.fromJson(Map<String, dynamic> json) {
    donationId = json['donationId'];
    userId = json['userId'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    amount = json['amount'];
    isActive = json['isActive'];
    addDate = json['addDate'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['donationId'] = this.donationId;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['isActive'] = this.isActive;
    data['addDate'] = this.addDate;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
