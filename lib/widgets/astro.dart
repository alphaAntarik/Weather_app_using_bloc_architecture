import 'package:flutter/material.dart';

class Astro extends StatelessWidget {
  final String image;
  final String time;
  final int? isday;

  const Astro(
      {super.key,
      required this.image,
      required this.time,
      required this.isday});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.white.withOpacity(0.5)
           , // White fill color
        border: Border.all(
          color:  Color(0xFF3F3F3F)
              , // Black border color
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            image,
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            time,
            style:
                // TextStyle(
                //   fontFamily:
                Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: MediaQuery.of(context).size.height * 0.017,
                    fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
