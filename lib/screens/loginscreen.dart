import 'package:ecoapp/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      assignId: true,
      builder: (ctrl) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.blueGrey[50]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome Back !', style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 29,
                ),),
                const SizedBox(height: 20,),
                TextField(
                  controller: ctrl.loginNumberCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    hintText: 'Mobile number',
                    label: Text('Mobile number'),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Login', style: TextStyle(fontSize: 16),),
                    )),
                const SizedBox(height: 8,),
                TextButton(
                    onPressed: () {}, child: Text('Register new Account'))
              ],
            ),
          ),
        );
      },
    );
  }
}
