import 'package:flutter/material.dart';
import 'package:xcbt/configs/all_configs.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const GradientButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
        decoration: BoxDecoration(
          gradient: kPrimaryGradient,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(title),
      ),
    );
  }
}

class MyButton {
  //--CommonButton.defaultBtn
  static MaterialButton defaultBtn(
      BuildContext context, String text, double width, Function() function) {
    return MaterialButton(
      minWidth: width,
      padding: EdgeInsets.all(20),
      onPressed: function,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20)
              .copyWith(color: kBlack, fontWeight: FontWeight.bold)),
    );
  }

  //--CommonButton.successBtn
  static MaterialButton successBtn(
      BuildContext context, String text, double width, Function() function) {
    return MaterialButton(
      minWidth: width,
      padding: EdgeInsets.all(20),
      onPressed: function,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20)
              .copyWith(color: kBlack, fontWeight: FontWeight.bold)),
    );
  }

  //--CommonButton.successBtnOutline
  static OutlinedButton successBtnOutline(
      BuildContext context, String text, Function() function) {
    return OutlinedButton(
      onPressed: function,
      child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20)
              .copyWith(color: kBlack, fontWeight: FontWeight.bold)),
    );
  }  

  //--CommonButton.successBtn
  static InkWell iconBtn(
      Function() function, IconData icon, Color fColor, Color bgColor) {
    return InkWell(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            padding: EdgeInsets.all(5),
            color: bgColor,
            child: Icon(icon, color: fColor)),
      ),
    );
  }
}

// class MyButtonsX {
//   static MaterialButton showMyButtons(
//     // BuildContext context,
//     String title,
//     Color color,
//     VoidCallback onPress,
//   ) {
//     return MaterialButton(
//       child: Text(title),
//       color: color,
//       onPressed: onPress,
//     );
//   }

//   static secondary({String title, Function onPress}) {
//     showMyButtons(title, Color(0x6C757D), onPress);
//   }
// }

// class MyButtons {
//   static showMyButtons(
//     BuildContext context,
//     String title,
//     Color color,
//     VoidCallback onPress,
//   ) {
//     return MaterialButton(
//       child: Text(title),
//       color: color,
//       onPressed: onPress,
//     );
//   }

  // static primary({String title, Function onPress}) {
  //   showMyButtons(title, onPress, Color(0x007BFF));
  // }

  // static secondary(BuildContext context, String title, Function onPress) {
  //   showMyButtons(context, title, Color(0x6C757D), onPress);
  // }

  // static success(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0x28A745));
  // }

  // static danger(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0xDC3545));
  // }

  // static warning(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0xFFC107));
  // }

  // static info(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0x17A2B8));
  // }

  // static light(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0xF8F9FA));
  // }

  // static dark(String title, Function onPress) {
  //   showMyButtons(title, onPress, Color(0x343A40));
  // }
// }
