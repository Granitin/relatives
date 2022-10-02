import 'package:flutter/material.dart';
import 'package:relatives/assets/assets.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Color.fromRGBO(75, 58, 48, 1.0);

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
          children: [
            const TopMenu(),
            const Image(image: mainTree),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mainColor),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Войти в приложение',
                    style: GoogleFonts.pacifico(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
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
            'Моё',
            style: GoogleFonts.pacifico(
              fontSize: 30,
              color: mainColor,
            ),
          ),
        ),
        LayoutId(
          id: 2,
          child: Text(
            'семейное',
            style: GoogleFonts.pacifico(
              fontSize: 30,
              color: mainColor,
            ),
          ),
        ),
        LayoutId(
          id: 3,
          child: Text(
            'дерево',
            style: GoogleFonts.pacifico(
              fontSize: 30,
              color: mainColor,
            ),
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
      positionChild(1, const Offset(50, 75));
      positionChild(2, const Offset(140, 100));
      positionChild(3, const Offset(270, 125));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
