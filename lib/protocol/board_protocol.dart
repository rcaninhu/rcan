class BoardListResponse {
  final int id;
  final String writeDate;
  final String title;
  final String contents;

  BoardListResponse(this.id, this.writeDate, this.title, this.contents);

  static BoardListResponse fromJson(Map<String, dynamic> json) {
    return BoardListResponse(
        json['id'], json['writeDate'], json['title'], json['contents']);
  }
}
