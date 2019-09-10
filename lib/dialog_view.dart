import 'package:doco_speech_flutter/constant/app_colors.dart';
import 'package:doco_speech_flutter/constant/session.dart';
import 'package:doco_speech_flutter/util/session_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Informasi"),
      content: Text("Tampilkan bahasa sekarang"),
      actions: <Widget>[
        FlatButton(
          textColor: colorPrimary,
          child: Text("Batal"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        FlatButton(
          textColor: colorPrimary,
          child: Text("Ya"),
          onPressed: () async {
            var lang = await SessionUtil.getAsString(LANGUAGE, "id");
            Navigator.pop(context, lang);
          },
        )
      ],
    );
  }
}