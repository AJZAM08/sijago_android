import 'package:flutter/material.dart';

class ListUbah extends StatelessWidget {
  const ListUbah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 130,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(232, 239, 253, 100),
                  child: Icon(Icons.warning_amber_rounded,
                  size: 27,
                  color: Color.fromRGBO(114, 161, 255, 1),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Text(
                    'Profile Risiko',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 126, 126, 126)
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Color.fromARGB(255, 179, 179, 179),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(232, 239, 253, 100),
                  child: Icon(Icons.access_time,
                  size: 25,
                  color: Color.fromRGBO(114, 161, 255, 1),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Text(
                    'Goal planner',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 126, 126, 126)
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Color.fromARGB(255, 179, 179, 179),
                  ),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
