import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_badriyya/features/authentication/view/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  static const routePath = '/welcomepage';

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(47, 128, 237, 255),
            image: DecorationImage(
                image:
                    AssetImage("assets/images/background/authentication.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const Expanded(
              flex: 15,
              child: SizedBox(),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BADRIYYA',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Petrona',
                          color: Colors.blue[600]),
                    ),
                    const Text(
                      'NEDIYANAD',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Petrona',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Cultivating Knowledge,\nShaping Minds',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Nunito'),
                    ),
                  ],
                )
              ],
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: 144,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: const Center(
                      child: Text('Get Started',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Nunito',
                              color: Colors.white))),
                ),
                const SizedBox(
                  width: 24,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Member Of Badriyya?',
                  style: TextStyle(fontSize: 21, color: Colors.white),
                ),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).go(Loginpage.routePath),
                  child: Container(
                    height: 60,
                    width: 144,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: const Center(
                      child: Text(
                        'Log in',
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
              ],
            ),
            const Expanded(flex: 1, child: SizedBox())
          ],
        ),
      ),
    );
  }
}
