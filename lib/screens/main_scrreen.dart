import 'package:flutter/material.dart';
import 'package:relatives/assets/assets.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        Column(
          children: const [
            TopMenu(),
            Image(image: mainTree),
          ],
        ),
      ]),
    );
  }
}

class TopMenu extends StatelessWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: OunMultiChildLayoutDelegate(),
      children: [
        LayoutId(
          id: 1,
          child: Text(
            'Pacifico',
            style: GoogleFonts.pacifico(fontSize: 20, color: Colors.brown),
          ),
        ),
        LayoutId(
          id: 2,
          child: Container(
            width: 50,
            height: 20,
            color: Colors.blue,
          ),
        ),
        LayoutId(
          id: 3,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('do this'),
          ),
        ),
      ],
    );
  }
}

class OunMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) => constraints.constrain(
        const Size(double.infinity, 200),
      );

  @override
  void performLayout(Size size) {
    if (hasChild(1) && hasChild(2) && hasChild(3)) {
      layoutChild(1, BoxConstraints.loose(size));
      layoutChild(2, BoxConstraints.loose(size));
      layoutChild(3, BoxConstraints.loose(size));
      positionChild(1, const Offset(20, 100));
      positionChild(2, const Offset(150, 120));
      positionChild(3, const Offset(250, 150));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
