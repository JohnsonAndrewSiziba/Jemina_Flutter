class Report {
  final int id;
  final int reportTypeID;
  final String title;
  final bool published;
  final String reportImagePath;
  final String path;
  final String? fromDate;
  final String? toDate;
  final String? section1Title;
  final String? section1;
  final String? section2Title;
  final String? section2;
  final String? extract;
  final String? reportType;

  Report(
    this.id,
    this.reportTypeID,
    this.title,
    this.published,
    this.reportImagePath,
    this.path,
    this.fromDate,
    this.toDate,
    this.section1Title,
    this.section1,
    this.section2Title,
    this.section2,
    this.extract,
    this.reportType,
  );

  static List<Report> jsonDecode(List<dynamic> jsonList) {
    return (jsonList as List).map((i) => Report.fromJson(i)).toList();
  }

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        json["id"],
        json["report_type_id"],
        json["title"],
        json["published"] == 1 ? true : false,
        json["report_image_path"],
        json["path"],
        json["from_date"],
        json["to_date"],
        json["section_1_title"],
        json["section_1"],
        json["section_2_title"],
        json["section_2"],
        json["extract"],
        json["report_type"]["type"],
      );
}
