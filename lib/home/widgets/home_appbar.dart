import 'package:fashura/util/colors.dart';
import 'package:fashura/util/widget/appbar.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var username = "admin";
    return TAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 16),
              Text("Fashura",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: TColors.white, fontWeightDelta: 0)),
              Text("Selamat Datang, $username",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white, fontWeightDelta: -1))
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: const Image(
              image: AssetImage('assets/temp/ava1.png'),
              fit: BoxFit.fill,
              height: 50,
              width: 50,
            ),
          )
        ],
      ),
    );
  }
}
