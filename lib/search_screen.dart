import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  final List _dataList = ["hi", "hello", "kam", "sum"];
  final List _filteredList = [];

  @override
  void initState() {
    super.initState();
    _filteredList.addAll(_dataList);
  }

  void _filterList(String searchText) {
    _filteredList.clear();
    if (searchText.isEmpty) {
      _filteredList.addAll(_dataList);
    } else {

    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            onChanged: (value) {
              _filterList(value);
            },
            controller: _textController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.clear_rounded,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  _textController.clear();
                  // _filterList('');
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColorDark,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          screenSize.height * 0.05,
          screenSize.height * 0.1,
          screenSize.height * 0.05,
          0,
        ),
        child: ListView.builder(
          itemCount: _filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(_filteredList[index]);
          },
        ),
      ),
    );
  }
}
