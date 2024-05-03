import 'package:flutter/material.dart';

import '../../../../core/assets/assets_gen.dart';
import '../../../../core/constant/size.dart';

class BannerHorizontal extends StatelessWidget {
  const BannerHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fullHeight * .2,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Container(
              width: fullWidth * .87,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    Assets.image.banner1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Container(
              width: fullWidth * .87,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    Assets.image.banner2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }
}
