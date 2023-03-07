import 'package:board/protocol/board_protocol.dart';
import 'package:board/service/board_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var boardList = <BoardListResponse>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
            children: _getBody(),
          )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> _getBody() {
    List<Widget> result = [];
    for (var element in boardList) {
      result.add(Card(
        child: Column(
          children: [
            Text(element.title),
            Text(element.contents),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(element.writeDate)],
            )
          ],
        ),
      ));
    }
    if (boardList.isEmpty) {
      result.add(Card(child: Text("데이터가 없음")));
    }
    return result;
  }

  @override
  void initState() {
    _loadBoard();
    super.initState();
  }

  _loadBoard() async {
    boardList.clear();
    _callBoard();
    setState(() {});
  }

  _callBoard() async {
    List<BoardListResponse> list = await BoardService().getBoard();
    boardList.addAll(list);
  }
}
