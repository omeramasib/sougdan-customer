import 'package:flutter/material.dart';
import '../../../Helper/Color.dart';

class SelectedPhoto extends StatelessWidget {
  final int? numberOfDots;
  final int? photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 3.0, end: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
          color: colors.primary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5.0, end: 5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.0,
              blurRadius: 2.0,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots!; i++) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
