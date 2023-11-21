import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/widgets/all_widgets.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // color: Colors.purple,
          image: DecorationImage(
              fit: BoxFit.cover,
              // image: AssetImage('lib/assets/images/calm-water.jpeg')),
              image: AssetImage('lib/assets/images/blue-grad.png')),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('lib/assets/icons/images-svgrepo-com.svg'),
              SizedBox(
                height: 20,
              ),
              //--Title
              Text(
                'XCBT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              //--SubTitle
              SizedBox(
                height: 10,
              ),
              Text(
                'XLPE Computer Based Training',
                style: TextStyle(color: kBlack),
              ),
              SizedBox(
                height: 20,
              ),
              //--Button
              MyButton.appPrimary(context, 'Test', sz.width * 0.5, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntroView()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
