import 'package:flutter/material.dart';

class ChooseSupervisor extends StatelessWidget {
  const ChooseSupervisor({Key? key, required this.photos}) : super(key: key);

  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 2,
      height: size.height,
      child: GridView.builder(
        padding: const EdgeInsets.all(35),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 35,
          crossAxisSpacing: 35,
          crossAxisCount: 2,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    image: NetworkImage(
                      photos[index],
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}
