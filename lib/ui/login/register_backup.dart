import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/login/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register_page';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 152),
            child: Text(
              'Daftar Akun',
              style: orangeTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama',
                  style: orangeTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
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
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'E - mail',
                  style: orangeTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
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
                    decoration: InputDecoration(
                        hintText: 'Masukkan email anda',
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
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kata Sandi',
                  style: orangeTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
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
                    decoration: InputDecoration(
                        hintText: 'Masukkan kata sandi anda',
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
          ),
          const SizedBox(height: 50),
          Center(
            child: SizedBox(
              width: 187,
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
          // const SizedBox(height: 18),
          // const Center(
          //   child: Text('Sudah memiliki akun? klik di sini'),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sudah memiliki akun ?',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.routeName);
                },
                child: Text(
                  'Masuk',
                  style: orangeTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
