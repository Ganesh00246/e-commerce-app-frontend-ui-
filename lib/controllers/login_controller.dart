import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecoapp/model/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class LoginController extends GetxController {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  late CollectionReference userCollection;
  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController registerNumberCtrl = TextEditingController();
  TextEditingController loginNumberCtrl = TextEditingController();
  OtpFieldControllerV2 otpContoller = OtpFieldControllerV2();
  bool otpFieldShow = false;
  int? otpSend;
  int? otpEnter;

  @override
  void onInit() {
    userCollection = firebase.collection('users'); // Corrected this line
    super.onInit();
  }

  addUser() {
    try {
     if(otpSend == otpEnter){
       DocumentReference doc = userCollection.doc();
       User user = User(
         id: doc.id,
         name: registerNameCtrl.text,
         number: int.parse(registerNumberCtrl.text),
       );
       final userJson = user.toJson();
       doc.set(userJson);
       Get.snackbar('Success', 'User added successfully', colorText: Colors.green);
       registerNameCtrl.clear();
       registerNumberCtrl.clear();
       otpContoller.clear();
     }else{
       Get.snackbar('Error', 'Enter Correct otp ', colorText: Colors.red);

     }

    } catch (e) {
      Get.snackbar('Fail', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  sendOtp(){
    try {
      if(registerNumberCtrl.text.isEmpty || registerNameCtrl.text.isEmpty){
        Get.snackbar('Error', 'Please Fill The TextField',colorText: Colors.red);
        return ;
      }
      final random = Random();
      int otp = 1000 + random.nextInt(9000);
      print(otp);
      if(otp != null){
            otpFieldShow =true;
            otpSend = otp;
            Get.snackbar('Sucess', 'Otp sended sucessfully',colorText: Colors.green);
          }else{
            Get.snackbar('Fail', 'Otp not send retry !!',colorText: Colors.red);
          }
    } catch (e) {
      print(e);
    } finally{
      update();
    }

  }
}
