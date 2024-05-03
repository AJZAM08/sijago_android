import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/textsytle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget leading;

  @override
  final Size preferredSize;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading = const SizedBox(),
    this.actions,

    this.preferredSize = const Size.fromHeight(80.0), // Tinggi default AppBar
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        color: AppColors.whiteBg
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Menampilkan judul AppBar
            Row(
              children: [
                leading,
                const SizedBox(width: 10,),
                Text(
                  title ?? '',
                  style: myTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary
                  ),
                ),
              ],
            ),
            // Menampilkan aksi (jika ada)
            Row(children: actions ?? []),
          ],
        ),
      ),
    );
  }
}
