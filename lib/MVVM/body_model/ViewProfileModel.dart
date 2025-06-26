class ViewPublicProfileModel {
  int? userId;
  String? name;
  String? profileImageUrl;
  String? shortBio;
  List<String>? interests;
  int? followersCount;
  int? followingCount;

  ViewPublicProfileModel(
      {this.userId,
        this.name,
        this.profileImageUrl,
        this.shortBio,
        this.interests,
        this.followersCount,
        this.followingCount});

  ViewPublicProfileModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    profileImageUrl = json['profileImageUrl'];
    shortBio = json['shortBio'];
    interests = json['interests'].cast<String>();
    followersCount = json['followers_count'];
    followingCount = json['following_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['profileImageUrl'] = this.profileImageUrl;
    data['shortBio'] = this.shortBio;
    data['interests'] = this.interests;
    data['followers_count'] = this.followersCount;
    data['following_count'] = this.followingCount;
    return data;
  }
}
