import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/home/main_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textController = TextEditingController();
  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Image.asset(
              'assets/logo_cookmate_01.png',
              height: 40,
              fit: BoxFit.cover,
            ),
            Text(
              'Selamat Datang di Cookmate',
              style: orangeTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Siapakah Nama Anda ?',
                  style: orangeTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  width: 320,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      width: 1,
                      color: greyColor,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                        hintText: 'Masukkan nama anda',
                        hintStyle: greyTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 12,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 14),
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 187,
                height: 39,
                child: ElevatedButton(
                  child: Text(
                    'Masuk',
                    style: whiteTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      name = textController.text;
                    });

                    if (name != '') {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return MainScreen(
                          name: name,
                        );
                      }));
                    } else {
                      return;
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(orangeColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33.0),
                        side: BorderSide(color: orangeColor),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
