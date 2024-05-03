import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/assets_gen.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/textsytle.dart';

class ReksaDanaBox extends StatelessWidget {
  const ReksaDanaBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: fullHeight * .07,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 233, 186),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.icon.question,
                width: 35,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  'Klik disini untuk memahami istilah-istilah reksa dana sebelum bertransaksi',
                  style: myTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black150,
                  ),
                  maxFontSize: 12,
                  minFontSize: 7,
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
