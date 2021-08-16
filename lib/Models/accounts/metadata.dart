
class Metadata {
  String address;
  String kind;
  String owner;
  String alias;
  String description;
  String logo;
  String site;
  String support;
  String email;
  String twitter;
  String telegram;
  String discord;
  String reddit;
  String slack;
  String riot;
  String github;
  String instagram;
  String facebook;

  Metadata(
      {this.address,
      this.kind,
      this.owner,
      this.alias,
      this.description,
      this.logo,
      this.site,
      this.support,
      this.email,
      this.twitter,
      this.telegram,
      this.discord,
      this.reddit,
      this.slack,
      this.riot,
      this.github,
      this.instagram,
      this.facebook});

  Metadata.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    kind = json['kind'];
    owner = json['owner'];
    alias = json['alias'];
    description = json['description'];
    logo = json['logo'];
    site = json['site'];
    support = json['support'];
    email = json['email'];
    twitter = json['twitter'];
    telegram = json['telegram'];
    discord = json['discord'];
    reddit = json['reddit'];
    slack = json['slack'];
    riot = json['riot'];
    github = json['github'];
    instagram = json['instagram'];
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['kind'] = this.kind;
    data['owner'] = this.owner;
    data['alias'] = this.alias;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['site'] = this.site;
    data['support'] = this.support;
    data['email'] = this.email;
    data['twitter'] = this.twitter;
    data['telegram'] = this.telegram;
    data['discord'] = this.discord;
    data['reddit'] = this.reddit;
    data['slack'] = this.slack;
    data['riot'] = this.riot;
    data['github'] = this.github;
    data['instagram'] = this.instagram;
    data['facebook'] = this.facebook;
    return data;
  }
}
