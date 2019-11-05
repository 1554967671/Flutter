import 'package:flutter/material.dart';
import '../i10n/localization_intl.dart';

class MyPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(AppLocalizations.of(context).My),
        ),
      ),
    );
  }

}