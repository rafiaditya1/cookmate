import 'package:cookmate/data/model/search_recipe.dart';
import 'package:cookmate/provider/detail_recipe_provider.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatefulWidget {
  static const routeName = '/recipe_detail';
  final String id;
  const RecipeDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState(id: id);
}

class _RecipeDetailState extends State<RecipeDetail> {
  final String id;
  _RecipeDetailState({required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRecipeProvider>(
      create: (_) => DetailRecipeProvider(context, id: id),
      child: Scaffold(
        body: Consumer<DetailRecipeProvider>(builder: (context, state, _) {
          if (state.state == ResultStateDetailRecipe.Loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.state == ResultStateDetailRecipe.HasData) {
            final resep = state.result.results;
            return Stack(
              children: [
                Image.network(
                  resep.thumb.toString(),
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  fit: BoxFit.cover,
                ),
                ListView(
                  children: [
                    SizedBox(
                      height: 250,
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
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        resep.title,
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
                                            resep.author.user,
                                            style: blackTextStyle.copyWith(
                                                fontSize: 13,
                                                fontWeight: medium),
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
                                            resep.author.datePublished,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                        'assets/service.png'),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      resep.dificulty,
                                                      style: whiteTextStyle
                                                          .copyWith(
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
                                                      resep.times,
                                                      style: whiteTextStyle
                                                          .copyWith(
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
                                                      resep.servings,
                                                      style: whiteTextStyle
                                                          .copyWith(
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
                                        resep.desc,
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
                                      /*ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                          width: 374,
                                          height: 220,
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(1.0),
                                                blurRadius: 23,
                                                spreadRadius: 5,
                                                offset: Offset(
                                                    0, 5), // Shadow position
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            *//*child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                        'assets/bango.png'),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Bango Kecap Manis',
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontWeight: bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      child: Text(
                                                        'Beli Online',
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                          fontWeight: bold,
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    orangeColor),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            side: BorderSide(
                                                                color:
                                                                    orangeColor),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                        'assets/royco.png'),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      'Royco Kaldu Ayam',
                                                      style: blackTextStyle
                                                          .copyWith(
                                                        fontWeight: bold,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      child: Text(
                                                        'Beli Online',
                                                        style: whiteTextStyle
                                                            .copyWith(
                                                          fontWeight: bold,
                                                          fontSize: 9,
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    orangeColor),
                                                        shape: MaterialStateProperty
                                                            .all<
                                                                RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                            side: BorderSide(
                                                                color:
                                                                    orangeColor),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),*//*
                                          ),
                                        ),
                                      ),*/
                                      SizedBox(height: 10),
                                      Text(
                                        resep.ingredient.join('\n'),
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
                                        resep.step.join('\n'),
                                        style: blackTextStyle.copyWith(
                                          fontWeight: light,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      const FavoriteButton(),
                    ],
                  ),
                ),
              ],
            );
          } else if (state.state == ResultStateDetailRecipe.NoData) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultStateDetailRecipe.Error) {
            return Center(
              child: Text(state.message),
            );
          } else if (state.state == ResultStateDetailRecipe.NoConnection) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style:
                    const TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    child: const Text('Refresh'),
                    onPressed: () {
                      state.refresh();
                    },
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(''),
            );
          }
        }),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);


  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  late final Result resep;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}

