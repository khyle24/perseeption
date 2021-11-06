import 'dart:convert';

List<Announcement> announcementFromMap(String str) => List<Announcement>.from(json.decode(str).map((x) => Announcement.fromMap(x)));

String announcementToMap(List<Announcement> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Announcement {
  Announcement({
    this.announcementId,
    this.announcementTitle,
    this.announcementContent,
    this.announcementDate,
    this.userId,
    this.announcementImage,
  });

  int announcementId;
  String announcementTitle;
  String announcementContent;
  DateTime announcementDate;
  dynamic userId;
  String announcementImage;

  factory Announcement.fromMap(Map<String, dynamic> json) => Announcement(
    announcementId: json["ANNOUNCEMENT_ID"],
    announcementTitle: json["ANNOUNCEMENT_TITLE"],
    announcementContent: json["ANNOUNCEMENT_CONTENT"],
    announcementDate: DateTime.parse(json["ANNOUNCEMENT_DATE"]),
    userId: json["USER_ID"],
    announcementImage: json["ANNOUNCEMENT_IMAGE"],
  );

  Map<String, dynamic> toMap() => {
    "ANNOUNCEMENT_ID": announcementId,
    "ANNOUNCEMENT_TITLE": announcementTitle,
    "ANNOUNCEMENT_CONTENT": announcementContent,
    "ANNOUNCEMENT_DATE": announcementDate.toIso8601String(),
    "USER_ID": userId,
    "ANNOUNCEMENT_IMAGE": announcementImage,
  };
}
