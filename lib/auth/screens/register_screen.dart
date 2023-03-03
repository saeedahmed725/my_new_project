import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_from_field.dart';
import 'Second_Screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visibilityPassword = false;
  bool visibilityConfirmPassword = false;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController password =  TextEditingController();
  TextEditingController confirmPassword =  TextEditingController();

  String? textValidation({required String value}) {
    if (value.isEmpty) {
      return 'Field is required';
    } else {
      return null;
    }
  }

  String? emailValidation({required String value}) {
    if (value.contains('@')) {
      return null;
    } else {
      return 'Email invalid';
    }
  }

  String? passwordValidation({required String value}) {
    if (value.length < 8) {
      return 'Password is short';
    } else {
      return null;
    }

  }

  String? confirmPasswordValidation({required String value}) {
    if (value.length < 8) {
      return "Password is short";
    } if  (value != password.text ) {
      return "Not Match";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("images/Shape.jpg"),
                const Text("Register",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CustomTextField(
                      hintText: "Enter Your Name",
                      labelText: "Full Name",
                      prefixIcon: const Icon(Icons.person),
                      keyboardType: TextInputType.name,
                      validator: (value) =>
                          textValidation(
                              value: value!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: "Enter Your Phone Number",
                      labelText: "Phone",
                      prefixIcon: const Icon(Icons.phone),
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          textValidation(
                              value: value!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: "Enter Your Email",
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          emailValidation(value: value!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: "Enter Your Password",
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visibilityPassword = !visibilityPassword;
                            });
                          },
                          icon: visibilityPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      obscureText: visibilityPassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: password,
                      validator: (value) => passwordValidation(value: value!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      hintText: "Enter Your Password",
                      labelText: "Confirm Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visibilityConfirmPassword =
                              !visibilityConfirmPassword;
                            });
                          },
                          icon: visibilityConfirmPassword
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      obscureText: visibilityConfirmPassword,
                      keyboardType: TextInputType.visiblePassword,
                      controller: confirmPassword,
                      validator: (value) => confirmPasswordValidation(value: value!),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      text: "Register",
                      color: Colors.purple,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondScreen()));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: "Login",
                      TextColor: Colors.black,
                      border: Border.all(color: Colors.black45, width: 1.5),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (
                                context) => const SecondScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
