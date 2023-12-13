import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/widgets/all_widgets.dart';

import '../../../helpers/x_helpers.dart';
import '../x_frontpage.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          //--Appbar:
          ThisAppbar(),
          Container(
            height: 100,
            color: kGreen,
            child: Text('Your Quiz'),
          ),
          //--UjianList:
          Container(
              height: 500,
              child: ListView.builder(
                  itemCount: exListUjian.length,
                  itemBuilder: (context, i) {
                    // return UjianListBox(listData: listUjian);
                    return Card(
                      child: ListTile(
                        title: RichText(
                            text: TextSpan(
                                text: '${exListUjian[i].category} \n',
                                style: getFont(14, color: kBlack),
                                children: [
                              TextSpan(text: exListUjian[i].status)
                            ])),
                      ),
                    );
                  })),
        ]),
      ),
    );
  }
}
