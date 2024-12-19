import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/features/authentication/controller/auth_controller.dart';

class Loginpage extends HookConsumerWidget {
  static const routePath = '/register';

  const Loginpage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// callback to execute when the signup link clicked

    /// Callback to execute when the login button clicked
    void onLoginButtonClicked() {
      final email = emailController.text;
      final password = passwordController.text;

      ref.read(authControllerProvider.notifier).login(email, password);
    }

    // void onlog() {
    //   final email = emailController.text;
    //   final password = passwordController.text;

    //   ref
    //       .read(authControllerProvider.notifier)
    //       .signUpNewUser(email: email, password: password);
    // }

    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(47, 128, 237, 255),
          image: DecorationImage(
              image: AssetImage("assets/images/background/login.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const Expanded(
              flex: 5,
              child: SizedBox(),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Student id',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          color: Colors.blue),
                    ),
                    Container(
                      height: 40,
                      width: 309,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none, // Removes the underline
                            hintText: 'Enter Your id',
                            hintStyle: TextStyle(
                              color: Colors.grey
                                  .withOpacity(0.6), // Reduces transparency
                            ), // Optional hint text
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          color: Colors.blue),
                    ),
                    Container(
                        height: 40,
                        width: 309,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none, // Removes the underline
                              hintText: 'Enter Your password',
                              hintStyle: TextStyle(
                                color: Colors.grey
                                    .withOpacity(0.6), // Reduces transparency
                              ), // Optional hint text
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
            const Expanded(flex: 3, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onLoginButtonClicked,
                  child: Container(
                    height: 60,
                    width: 144,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Nunito',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                // InkWell(
                //   onTap: onlog,
                //   child: Container(
                //     height: 60,
                //     width: 144,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5),
                //         border: Border.all(color: Colors.white, width: 2)),
                //     child: const Center(
                //       child: Text(
                //         'log',
                //         style: TextStyle(
                //             fontSize: 24,
                //             fontFamily: 'Nunito',
                //             color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            const Expanded(flex: 1, child: SizedBox())
          ],
        ),
      ),
    );
  }
}
