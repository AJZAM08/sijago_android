import 'package:flutter/material.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/textsytle.dart';

class ProductList extends StatelessWidget {
  final String merk;
  final String risk;
  final String harga;
  final IconData icon;
  final Color? textColor;
  final Color? iconColor;
  // final String image;
  final String percent;
  const ProductList({
    super.key,
    required this.merk,
    required this.risk,
    required this.harga,
    required this.icon,
    // required this.image,
    required this.percent,
    this.textColor = AppColors.green,
    this.iconColor = AppColors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: CircleAvatar(),
        )),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                merk,
                style: myTextStyle(
                  color: AppColors.black150,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                risk,
                style: myTextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black150,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                harga,
                style: myTextStyle(
                  color: AppColors.black150,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    icon,
                    size: 18,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    percent,
                    style: myTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
