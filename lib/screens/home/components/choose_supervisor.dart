import 'package:csa_usage_history/screens/home/components/supervisor_photo.dart';
import 'package:flutter/material.dart';

class ChooseSupervisor extends StatelessWidget {
  const ChooseSupervisor({Key? key, required this.photos}) : super(key: key);

  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final double itemWidth = size.width / 4;
    final double itemHeight = size.height / 3;

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return SupervisorPhoto(
            photo: photos[index],
          );
        },
      ),
    );
  }
}
