
class TvList {
  String? total;
  int? page;
  int? pages;
  List<TvShows>? tvShows;

  TvList({this.total, this.page, this.pages, this.tvShows});

  TvList.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    pages = json['pages'];
    if (json['tv_shows'] != null) {
      tvShows = <TvShows>[];
      json['tv_shows'].forEach((v) {
        tvShows!.add(new TvShows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['pages'] = this.pages;
    if (this.tvShows != null) {
      data['tv_shows'] = this.tvShows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvShows {
  int? id;
  String? name;
  String? permalink;
  String? startDate;
  Null? endDate;
  String? country;
  String? network;
  String? status;
  String? imageThumbnailPath;

  TvShows(
      {this.id,
      this.name,
      this.permalink,
      this.startDate,
      this.endDate,
      this.country,
      this.network,
      this.status,
      this.imageThumbnailPath});

  TvShows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    permalink = json['permalink'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    country = json['country'];
    network = json['network'];
    status = json['status'];
    imageThumbnailPath = json['image_thumbnail_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['permalink'] = this.permalink;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['country'] = this.country;
    data['network'] = this.network;
    data['status'] = this.status;
    data['image_thumbnail_path'] = this.imageThumbnailPath;
    return data;
  }
}
