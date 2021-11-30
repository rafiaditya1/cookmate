import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
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
                  'Daftar',
                  style: whiteTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {},
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
          Positioned(
            bottom: 40,
            left: 34,
            right: 29,
            child: SizedBox(
              width: 297,
              height: 39,
              child: ElevatedButton(
                child: Text(
                  'Masuk',
                  style: orangeTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(whiteColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33.0),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
