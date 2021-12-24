import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/login/login_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  static const routeName = '/first_page';

  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 33,
            child: Image.asset(
              'assets/logo_cookmate_01.png',
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 230,
            left: 33,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cooking a',
                  style: whiteTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  'Delicious Food',
                  style: orangeTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  'Easily!',
                  style: whiteTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 160,
            left: 33,
            child: Text(
              'CookingMate App bisa memberikanmu \nrekomendasi resep mudah, berdasarkan kategori \nresep yang ingin kamu buat.',
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 12,
              ),
            ),
          ),
          Positioned(
            bottom: 94,
            left: 34,
            right: 29,
            child: SizedBox(
              width: 297,
              height: 39,
              child: ElevatedButton(
                child: Text(
                  'Selanjutnya',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
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
    );
  }
}
