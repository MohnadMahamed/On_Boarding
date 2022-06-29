import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void saveAlert({context}) {
  final AlertDialog alart = AlertDialog(
    content: Container(
      height: 50.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(150.0)),
      child: Column(
        children: const [Text('Some instructions...')],
      ),
    ),
  );
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return alart;
      });

  // Widget defultformFelid(
  //         {var nameController,
  //         var textInputType,
  //         required Function validate,
  //         bool? isPassword}) =>
  //     SizedBox(
  //       height: 40.0,
  //       width: double.infinity,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20),
  //         child: TextFormField(
  //           style: const TextStyle(
  //             color: Colors.black,
  //             fontSize: 20.0,
  //           ),
  //           obscureText: isPassword!,
  //           controller: nameController,
  //           keyboardType: textInputType,
  //           validator: validate(),
  //           // validator: (String? value) {
  //           //   if (value!.isEmpty) {
  //           //     return 'Please input your Email';
  //           //   }

  //           //   return null;
  //           // },
  //           decoration: InputDecoration(
  //             filled: true,
  //             fillColor: Colors.white10,
  //             hintText: 'Eg.example@email.com',
  //             hintStyle: const TextStyle(color: Colors.black54, fontSize: 18.0),
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(5.0),
  //               borderSide: const BorderSide(width: 0.0, color: Colors.grey),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
}
