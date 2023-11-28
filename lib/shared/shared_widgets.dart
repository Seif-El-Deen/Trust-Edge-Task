import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:trust_edge_task/shared/constants.dart';

Widget defaultButton(
    {required String btnText,
    void Function()? onTap,
    Color textColor = Colors.purple,
    Color backgroundColor = Colors.white}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 280,
      padding: const EdgeInsets.symmetric(vertical: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: darkPurpleColor, width: 1.5),
          color: backgroundColor),
      child: Text(
        btnText,
        style: TextStyle(
            color: textColor, fontSize: 24, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget appLogoAndTitle({required String text}) {
  return Column(
    children: [
      Image.asset(
        "assets/images/app_logo.png",
        width: 130,
      ),
      defaultSizedBox(height: 25),
      Text(
        text,
        style: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.w600, color: lightPurpleColor),
      )
    ],
  );
}

Widget defaultSizedBox({double width = 0, double height = 0}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

Widget defaultTextFormField({
  TextEditingController? textEditingController,
  String? Function(String?)? validator,
  String hintText = "",
  String? labelText,
  TextInputType? keyboardType = TextInputType.text,
  bool obscureText = false,
  bool isPassword = false,
  IconData? suffixIcon,
  Widget? prefixIcon,
  void Function()? suffixPressed,
}) {
  return Container(
    margin: const EdgeInsets.all(10),
    width: 280,
    child: TextFormField(
      controller: textEditingController,
      textAlign: TextAlign.center,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style:
          const TextStyle(color: darkPurpleColor, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: mediumGreyColor),
        // label: Center(
        //   child: Text(
        //     hintText,
        //     style: const TextStyle(
        //         fontSize: 22,
        //         fontWeight: FontWeight.w600,
        //         color: mediumGreyColor),
        //   ),
        // ),

        suffix: isPassword
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  color: mediumGreyColor,
                ))
            : defaultSizedBox(),
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: lightGreyColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: lightGreyColor),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: redColor),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: redColor),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

Widget defaultQuestionTextButton(
    {required String questionText,
    required String btnText,
    required void Function()? onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        questionText,
        style: const TextStyle(
          color: lightPurpleColor,
        ),
      ),
      TextButton(
        onPressed: onPressed,
        child: Text(
          btnText,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: darkPurpleColor),
        ),
      ),
    ],
  );
}

Widget homeViewDetailsItem(
    {required IconData icon, required String detailsText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25),
    child: Row(
      children: [
        Icon(
          icon,
          color: darkPurpleColor,
        ),
        defaultSizedBox(width: 20),
        Text(
          detailsText,
          style: const TextStyle(
              color: mediumGreyColor,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}

Widget homeViewButton({void Function()? onTap, required btnText}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(top: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            mediumGreyColor.withOpacity(0.5),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10, left: 5),
        margin: const EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              btnText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: darkPurpleColor,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: darkPurpleColor)
          ],
        ),
      ),
    ),
  );
}

PreferredSizeWidget defaultAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
    centerTitle: true,
  );
}

Widget countryCodePicker({void Function(CountryCode)? onChanged}) {
  return CountryCodePicker(
    onChanged: onChanged,
    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
    initialSelection: '+971',
    hideMainText: true,
    favorite: const ['+971', 'EG'],
    countryFilter: const ['+971', 'EG'],
    // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
    // flagDecoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(7),
    // ),
  );
  // return Padding(
  //   padding: const EdgeInsets.only(left: 15),
  //   child: Image.asset(
  //     "assets/images/emirates_flag.png",
  //     width: 30,
  //     height: 20,
  //     fit: BoxFit.fitWidth,
  //   ),
  // );
}
