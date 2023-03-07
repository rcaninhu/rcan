import 'dart:convert';

import 'package:board/protocol/board_protocol.dart';
import 'package:board/service/base_api_call.dart';
import 'package:http/http.dart' as http;

class BoardService extends BaseApiCall {
  final _serviceBaseUrl = "api.rcan.net";
  final _serviceName = "demo";

  Future<List<BoardListResponse>> getBoard() async {
    var request = await getRequest("GET", _serviceBaseUrl,
        "/$_serviceName/api/board", <String, dynamic>{}, <String, String>{});

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    var responseMap = jsonDecode(await response.stream.bytesToString());
    var boardList = <BoardListResponse>[];
    var data = responseMap as List;
    for (var value in data) {
      boardList.add(BoardListResponse.fromJson(value));
    }
    return boardList;
  }
}
