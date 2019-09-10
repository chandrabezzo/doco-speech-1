import 'package:doco_speech_flutter/constant/app_colors.dart';
import 'package:doco_speech_flutter/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class Search extends SearchDelegate<SearchModel> {

  List<SearchModel> data;

  Search({this.data});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: colorPrimary),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return PlatformIconButton(
      androidIcon: Icon(Icons.arrow_back, color: colorPrimary),
      iosIcon: Icon(Icons.arrow_back_ios, color: colorPrimary),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _showResult(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _showResult(context);
  }

  Widget _showResult(BuildContext context){
    return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, position){
        return Card(
          elevation: 8,
          child: ListTile(
            trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.pop(context, data[position]);
            },
            title: Text("${data[position].value} (+${data[position].value})"),
          ),
        );
      },
    );
  }
}