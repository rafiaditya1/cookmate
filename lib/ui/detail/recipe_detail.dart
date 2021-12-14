import 'package:cookmate/theme/theme.dart';
import 'package:cookmate/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  static const routeName = '/recipe_detail';

  const RecipeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/nasgor.jpeg',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                  )
                ],
              ),
            ),
            ListView(
              children: [
                SizedBox(
                  height: 329,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Resep Ayam Bacem Khas \nYogyakarta, Menu Sehari-Hari \nyang Nikmat',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/chef.png'),
                                    SizedBox(width: 10),
                                    Text(
                                      'Maddie',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 13, fontWeight: medium),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.date_range_rounded,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Mei 17, 2020',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 374,
                                    height: 90,
                                    color: orangeColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset('assets/service.png'),
                                              SizedBox(height: 5),
                                              Text(
                                                '4 Porsi',
                                                style: whiteTextStyle.copyWith(
                                                  fontWeight: light,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.timer_rounded,
                                                color: whiteColor,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                '1 Jam',
                                                style: whiteTextStyle.copyWith(
                                                  fontWeight: light,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Image.asset(
                                                'assets/soup_kitchen.png',
                                                color: whiteColor,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                '4 Porsi',
                                                style: whiteTextStyle.copyWith(
                                                  fontWeight: light,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Deskripsi',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Meski makanan yang digoreng seolah lebih \npopuler di Indonesia, maka tidak heran kalau \nmasih ada yang bertanya-tanya soal yang satu \nini. Kok, hasilnya cokelat begini tapi dimasaknya \nbagaimana, ya. Sementara lezatnya tidak kalah dengan \nmakanan yang digoreng atau dibakar. Itulah \nkeunikan gaya masak yang satu ini.',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: light,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Bahan - bahan',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    width: 374,
                                    height: 220,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(1.0),
                                          blurRadius: 23,
                                          spreadRadius: 5,
                                          offset:
                                              Offset(0, 5), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset('assets/bango.png'),
                                              SizedBox(height: 5),
                                              Text(
                                                'Bango Kecap Manis',
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              ElevatedButton(
                                                child: Text(
                                                  'Beli Online',
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                    fontWeight: bold,
                                                    fontSize: 9,
                                                  ),
                                                ),
                                                onPressed: () {},
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(orangeColor),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      side: BorderSide(
                                                          color: orangeColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Image.asset('assets/royco.png'),
                                              SizedBox(height: 5),
                                              Text(
                                                'Royco Kaldu Ayam',
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              ElevatedButton(
                                                child: Text(
                                                  'Beli Online',
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                    fontWeight: bold,
                                                    fontSize: 9,
                                                  ),
                                                ),
                                                onPressed: () {},
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(orangeColor),
                                                  shape:
                                                      MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      side: BorderSide(
                                                          color: orangeColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Ayam \nKecap \nbawang putih \nlengkuas \n3 \n4 ',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: light,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  'Langkah - langkah',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: semiBold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '1 aaaaaaaaa \n2 bbbbbbbbbb \n3 ccccccccccccc \n4 ddddddddd',
                                  style: blackTextStyle.copyWith(
                                    fontWeight: light,
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
