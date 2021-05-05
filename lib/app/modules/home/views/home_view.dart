import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 60, left: 16, right: 16),
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          child: Form(
            key: controller.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              Text('Form Validation'),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                onSaved: (value) {
                  controller.email = value!;
                },
                validator: (value) {
                  return controller.validateEmail(value!);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: controller.passwordController,
                onSaved: (value) {
                  controller.password = value!;
                },
                validator: (value) {
                  return controller.validatePassword(value!);
                },
              ),
              SizedBox(height: 30),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: context.width),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    controller.checkLogin();
                  },
                  child: Text('Login'),
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
