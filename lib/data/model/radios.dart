import 'dart:convert';

/// id : 1
/// name : "Ibrahim Al-Akdar"
/// url : "https://backup.qurango.net/radio/ibrahim_alakdar"
/// recent_date : "2019-02-02 13:40:34"

Radios radiosFromJson(String str) => Radios.fromJson(json.decode(str));
String radiosToJson(Radios data) => json.encode(data.toJson());
class Radios {
  Radios({
      num? id, 
      String? name, 
      String? url, 
      String? recentDate,}){
    _id = id;
    _name = name;
    _url = url;
    _recentDate = recentDate;
}

  Radios.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _url = json['url'];
    _recentDate = json['recent_date'];
  }
  num? _id;
  String? _name;
  String? _url;
  String? _recentDate;
Radios copyWith({  num? id,
  String? name,
  String? url,
  String? recentDate,
}) => Radios(  id: id ?? _id,
  name: name ?? _name,
  url: url ?? _url,
  recentDate: recentDate ?? _recentDate,
);
  num? get id => _id;
  String? get name => _name;
  String? get url => _url;
  String? get recentDate => _recentDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['url'] = _url;
    map['recent_date'] = _recentDate;
    return map;
  }

}