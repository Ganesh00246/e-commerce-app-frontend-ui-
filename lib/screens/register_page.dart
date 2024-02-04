import 'package:ecoapp/controllers/login_controller.dart';
import 'package:ecoapp/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      assignId: true,
      builder: (ctrl) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
            ),
            padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Create Your Account !!",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 28),),
                const SizedBox(height: 20,),
                TextField(
                  controller: ctrl.registerNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    hintText: 'Enter you name',
                    label: Text("User name"),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: ctrl.registerNumberCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    prefixIcon: Icon(Icons.password),
                    hintText: 'Enter Phone number',
                    label: Text("Phone number"),
                  ),
                ),
                const SizedBox(height: 20,),
                OtpTextField(otpContoller: ctrl.otpContoller,visible: ctrl.otpFieldShow,onComplete: (otp){
                ctrl.otpEnter = int.tryParse(otp ?? '0000');

                },),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))
                    ),
                    onPressed: () {
                      if(ctrl.otpFieldShow){
                        ctrl.addUser();

                      }else{
                        ctrl.sendOtp();
                      }

                    }, child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(ctrl.otpFieldShow? 'Register':'Send OTP'),
                )),
                const SizedBox(height: 9,),
                TextButton(
                    onPressed: () {

                    },
                    child: Text("Login"))
              ],
            ),
          ),
        );
      },
    );
  }
}
