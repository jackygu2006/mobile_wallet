import 'package:wallet/pages/account/create/createAccountPage.dart';
import 'package:wallet/pages/account/import/importAccountPage.dart';
import 'package:wallet/utils/i18n/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:polkawallet_sdk/utils/i18n.dart';
import 'package:polkawallet_ui/components/roundedButton.dart';

class CreateAccountEntryPage extends StatelessWidget {
  static final String route = '/account/entry';

  @override
  Widget build(BuildContext context) {
    final dic = I18n.of(context).getDic(i18n_full_dic_app, 'account');
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: Text(dic['add']),
        centerTitle: true,
        // backgroundColor: Color(0xFF009688),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Image.asset('assets/images/logo_about.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: RoundedButton(
                text: dic['create'],
                // color: Color(0xFF009688),
                onPressed: () {
                  Navigator.pushNamed(context, CreateAccountPage.route);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: RoundedButton(
                text: dic['import'],
                // color: Color(0xFF009688),
                onPressed: () {
                  Navigator.pushNamed(context, ImportAccountPage.route);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
