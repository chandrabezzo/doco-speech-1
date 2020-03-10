import 'package:doco_speech_flutter/constant/app_colors.dart';
import 'package:doco_speech_flutter/model/bottom_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomView extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  BottomView(this.scaffoldKey);

  @override
  _BottomViewState createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {

  var data = List<BottomModel>();

  @override
  void initState() {
    super.initState();

    data = initData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index){
        return Divider(color: colorPrimary);
      },
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: (context, position){
        return ListTile(
          trailing: Icon(Icons.chevron_right),
          title: Text(data[position].value),
          onTap: (){
            print(data[position].value);
            Navigator.pop(context);
          },
        );
      },
    );
  }

  List<BottomModel> initData(){
    var values = List<BottomModel>();

    for(int counter = 0; counter < 2; counter++){
      var data = BottomModel(
        id: counter,
        value: "Data ke $counter"
      );

      values.add(data);
    }

    return values;
  }
}