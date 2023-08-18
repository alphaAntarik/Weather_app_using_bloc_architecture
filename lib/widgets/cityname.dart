import 'package:flutter/material.dart';

class CityName extends StatelessWidget {
  final String? name;
  final String? image;

  const CityName({super.key, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name!,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.05,
                fontWeight: FontWeight.w500),
          ),
          Stack(
            children: [
              Image.network(
                image!,
              ),
              ColorFiltered(
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.saturation),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
