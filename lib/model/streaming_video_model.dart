class StreamingVideoModel {
  String? id;
  String? videoId;
  String? userId;
  String? shortId;
  String? title;
  String? description;
  String? thumbnail;
  String? video_app_cover;
  String? video_app_cover_featured;
  String? videoLocation;
  String? youtube;
  String? vimeo;
  String? daily;
  String? facebook;
  String? ok;
  String? twitch;
  String? twitchType;
  String? time;
  DateTime? timeDate;
  String? active;
  String? tags;
  String? duration;
  String? size;
  String? converted;
  String? categoryId;
  String? views;
  bool? featured;
  String? registered;
  String? privacy;
  String? ageRestriction;
  String? type;
  String? approved;
  String? s240p;
  String? s360p;
  String? s480p;
  String? s720p;
  String? s1080p;
  String? s2048p;
  String? s4096p;
  String? sellVideo;
  String? subCategory;
  String? geoBlocking;
  String? demo;
  String? gif;
  String? isMovie;
  String? stars;
  String? producer;
  String? country;
  String? movieRelease;
  String? quality;
  String? rating;
  String? monetization;
  String? rentPrice;
  String? streamName;
  String? liveTime;
  String? liveEnded;
  String? agoraResourceId;
  String? agoraSid;
  String? agoraToken;
  String? license;
  String? isStock;
  String? trailer;
  String? embedding;
  String? liveChating;
  String? publicationDate;
  String? isShort;
  String? likesCount;
  String? disLikesCount;
  bool isliked = false;
  bool isDisliked = false;
// ! from the comment section
  bool isFromSearchScreen = false;
  bool isFrom_myvideos = false;
  List? userslikes;
  List? usersdisLikes;

  StreamingVideoModel(
      {this.id,
      this.videoId,
      this.userId,
      this.shortId,
      this.title,
      this.description,
      this.thumbnail,
      this.videoLocation,
      this.video_app_cover,
      this.video_app_cover_featured,
      this.youtube,
      this.vimeo,
      this.daily,
      this.facebook,
      this.ok,
      this.twitch,
      this.twitchType,
      this.time,
      this.timeDate,
      this.active,
      this.tags,
      this.duration,
      this.size,
      this.converted,
      this.categoryId,
      this.views,
      this.featured,
      this.registered,
      this.privacy,
      this.ageRestriction,
      this.type,
      this.approved,
      this.s240p,
      this.s360p,
      this.s480p,
      this.s720p,
      this.s1080p,
      this.s2048p,
      this.s4096p,
      this.sellVideo,
      this.subCategory,
      this.geoBlocking,
      this.demo,
      this.gif,
      this.isMovie,
      this.stars,
      this.producer,
      this.country,
      this.movieRelease,
      this.quality,
      this.rating,
      this.monetization,
      this.rentPrice,
      this.streamName,
      this.liveTime,
      this.liveEnded,
      this.agoraResourceId,
      this.agoraSid,
      this.agoraToken,
      this.license,
      this.isStock,
      this.trailer,
      this.embedding,
      this.liveChating,
      this.publicationDate,
      this.isShort,
      this.likesCount,
      this.disLikesCount,
      this.userslikes,
      this.usersdisLikes});

  StreamingVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // videoId = json['video_id'];
    // userId = json['user_id'];
    // shortId = json['short_id'];
    title = json['title'];
    // description = json['description'];
    thumbnail = json['thumbnail'];
    // video_app_cover = json['video_app_cover'];
    // video_app_cover_featured = json['video_app_cover_featured'];
    // videoLocation = json['video_location'];
    // youtube = json['youtube'];
    // vimeo = json['vimeo'];
    // daily = json['daily'];
    // facebook = json['facebook'];
    // ok = json['ok'];
    // twitch = json['twitch'];
    // twitchType = json['twitch_type'];
    // time = json['time'];
    // timeDate = DateTime.tryParse(json['time_date'].toString()) ?? null;
    // active = json['active'];
    // tags = json['tags'];
    // duration = json['duration'];
    // size = json['size'];
    // converted = json['converted'];
    // categoryId = json['category_id'];
    // views = json['views'];
    // featured = json['featured'] != null
    //     ? json['featured'] == "0"
    //         ? false
    //         : true
    //     : false;
    // registered = json['registered'];
    // privacy = json['privacy'];
    // ageRestriction = json['age_restriction'];
    // type = json['type'];
    // approved = json['approved'];
    // s240p = json['240p'];
    // s360p = json['360p'];
    // s480p = json['480p'];
    // s720p = json['720p'];
    // s1080p = json['1080p'];
    // s2048p = json['2048p'];
    // s4096p = json['4096p'];
    // sellVideo = json['sell_video'];
    // subCategory = json['sub_category'];
    // geoBlocking = json['geo_blocking'];
    // demo = json['demo'];
    // gif = json['gif'];
    // isMovie = json['is_movie'];
    // stars = json['stars'];
    // producer = json['producer'];
    // country = json['country'];
    // movieRelease = json['movie_release'];
    // quality = json['quality'];
    // rating = json['rating'];
    // monetization = json['monetization'];
    // rentPrice = json['rent_price'];
    // streamName = json['stream_name'];
    // liveTime = json['live_time'];
    // liveEnded = json['live_ended'];
    // agoraResourceId = json['agora_resource_id'];
    // agoraSid = json['agora_sid'];
    // agoraToken = json['agora_token'];
    // license = json['license'];
    // isStock = json['is_stock'];
    // trailer = json['trailer'];
    // embedding = json['embedding'];
    // liveChating = json['live_chating'];
    // publicationDate = json['publication_date'];
    // isShort = json['is_short'];
    // likesCount = json['totallikes'];
    // disLikesCount = json['totaldislikes'];

    // var list = [];
    // (json["Userslikes"] as String).split(',').forEach((element) {
    //   list.add(element);
    // });
    // userslikes = list;
    // var list1 = [];
    // (json["Usersdislikes"] as String).split(',').forEach((element) {
    //   list1.add(element);
    // });
    // usersdisLikes = list1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_id'] = this.videoId;
    data['user_id'] = this.userId;
    data['short_id'] = this.shortId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['video_app_cover'] = this.video_app_cover;
    data['video_location'] = this.videoLocation;
    data['youtube'] = this.youtube;
    data['vimeo'] = this.vimeo;
    data['daily'] = this.daily;
    data['facebook'] = this.facebook;
    data['ok'] = this.ok;
    data['twitch'] = this.twitch;
    data['twitch_type'] = this.twitchType;
    data['time'] = this.time;
    data['time_date'] = this.timeDate;
    data['active'] = this.active;
    data['tags'] = this.tags;
    data['duration'] = this.duration;
    data['size'] = this.size;
    data['converted'] = this.converted;
    data['category_id'] = this.categoryId;
    data['views'] = this.views;
    data['featured'] = this.featured;
    data['registered'] = this.registered;
    data['privacy'] = this.privacy;
    data['age_restriction'] = this.ageRestriction;
    data['type'] = this.type;
    data['approved'] = this.approved;
    data['240p'] = this.s240p;
    data['360p'] = this.s360p;
    data['480p'] = this.s480p;
    data['720p'] = this.s720p;
    data['1080p'] = this.s1080p;
    data['2048p'] = this.s2048p;
    data['4096p'] = this.s4096p;
    data['sell_video'] = this.sellVideo;
    data['sub_category'] = this.subCategory;
    data['geo_blocking'] = this.geoBlocking;
    data['demo'] = this.demo;
    data['gif'] = this.gif;
    data['is_movie'] = this.isMovie;
    data['stars'] = this.stars;
    data['producer'] = this.producer;
    data['country'] = this.country;
    data['movie_release'] = this.movieRelease;
    data['quality'] = this.quality;
    data['rating'] = this.rating;
    data['monetization'] = this.monetization;
    data['rent_price'] = this.rentPrice;
    data['stream_name'] = this.streamName;
    data['live_time'] = this.liveTime;
    data['live_ended'] = this.liveEnded;
    data['agora_resource_id'] = this.agoraResourceId;
    data['agora_sid'] = this.agoraSid;
    data['agora_token'] = this.agoraToken;
    data['license'] = this.license;
    data['is_stock'] = this.isStock;
    data['trailer'] = this.trailer;
    data['embedding'] = this.embedding;
    data['live_chating'] = this.liveChating;
    data['publication_date'] = this.publicationDate;
    data['is_short'] = this.isShort;
    return data;
  }
}
