import 'package:cookmate/data/model/detail_category.dart';
import 'package:cookmate/theme/theme.dart';
import 'package:flutter/material.dart';

class CategoryDetailCard extends StatelessWidget {
  final Result title, thumb, times, portion;
  final Function() onPressed;

  const CategoryDetailCard(
      {required this.title,
      required this.thumb,
      required this.times,
      required this.onPressed,
      required this.portion});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Expanded(
        flex: 2,
        child: Container(
          height: 130,
          width: 125,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(thumb.thumb),
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.title,
                        style: blackTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.timer,
                            size: 16,
                          ),
                          Text(
                            times.times,
                            style: orangeTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/soup_kitchen.png',
                            height: 16,
                            width: 16,
                          ),
                          Text(
                            portion.portion,
                            style: orangeTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
