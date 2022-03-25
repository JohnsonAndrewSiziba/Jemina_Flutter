class Report {
  final int id;
  final int reportTypeID;
  final String title;
  final bool published;
  final String reportImagePath;
  final String path;
  final DateTime fromDate;
  final DateTime toDate;
  final String section1Title;
  final String section1;
  final String section2Title;
  final String section2;

  Report(this.id, this.reportTypeID, this.title, this.published, this.reportImagePath, this.path, this.fromDate, this.toDate, this.section1Title, this.section1, this.section2Title, this.section2);

}