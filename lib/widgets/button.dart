import 'package:flutter/material.dart';
import 'package:restaurant_app/common/size.dart';

/// Class Komponen Tombol.
class Button extends StatelessWidget {
  /// Untuk Menyimpan Warna colorButton (warna Tombol),colorText (warna Teks),
  /// outLine(warna outline tombol)
  final Color colorButton, colorText, outLine;

  /// isi tulisan pada tombol
  final String isi;

  /// percents untuk menyimpan nilai lebar layar(lebar Mediaquery.of(context)* percents)
  /// height untuk menyimpan nilai tinggi layar
  /// radius untuk menyimpan nilai BorderRadius (nilai BorderRadius.circular(radius))
  /// size untuk menyimpan nilai fontsize
  final double percents, height, radius, size;

  /// tap untuk menyimpan fungsi
  final VoidCallback tap;

  /// Constructor untuk Kelas Button dengan inisiasi nilai Colors outline nilai default Colors.transparent ,
  /// Colors colorText,Colors colorButton, double height ,double size dengan nilai default 14,double percents,
  /// double height,double radius,VoidcallBack tap,
  const Button({
    Key? key,
    this.outLine = Colors.transparent,
    required this.isi,
    this.size = 14,
    required this.tap,
    required this.colorButton,
    required this.colorText,
    required this.percents,
    required this.height,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: displayWidth(context) * percents,
        height: height,
        child: Center(
          child: Text(
            isi.isEmpty ? 'Default Text' : isi,
            style: TextStyle(
              color: colorText,
              fontSize: size,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: outLine),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: colorButton,
        ),
      ),
    );
  }
}

class MyListButton extends StatelessWidget {
  const MyListButton({
    Key? key,
    VoidCallback? onTap,
    required String icon,
    required String label,
    Color labelColor = Colors.black,
  })  : _onTap = onTap,
        // _icon = icon,
        _label = label,
        _labelColor = labelColor,
        super(key: key);

  final VoidCallback? _onTap;
  // final String _icon;
  final String _label;
  final Color _labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: _onTap,
        borderRadius: BorderRadius.circular(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Text(
                  _label,
                  style: TextStyle(
                    color: _labelColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade300),
          ],
        ),
      ),
    );
  }
}

class MySmallIconButton extends StatelessWidget {
  const MySmallIconButton(
      {Key? key,
      VoidCallback? onTap,
      required Widget icon,
      bool rounded = false})
      : _onTap = onTap,
        _icon = icon,
        _rounded = rounded,
        super(key: key);

  final VoidCallback? _onTap;
  final Widget _icon;
  final bool _rounded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: 20,
        height: 20,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(_rounded ? 10 : 4),
        ),
        child: FittedBox(
          child: _icon,
        ),
      ),
    );
  }
}
