import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/size.dart';
import 'package:restaurant_app/common/sizebox.dart';
import 'package:restaurant_app/data/provider/RestaurantProvider.dart';
import 'package:restaurant_app/widgets/button.dart';

/// Untuk memunculkan dialog dengan 1 tombol confirm. Dalam fungsi
/// ini terdapat 1 required parameter, yaitu BuildContext dam 5
/// named parameter (required dan opsional)
showSingleActionDialog(
  BuildContext context, {
  // Judul dari dialog
  required String titleText,
  // Teks konten dari dialog
  required String contentText,
  // Fungsi yang akan dijalankan jika tombol aksi ditekan
  VoidCallback? actionOnPressed,
  // Teks dari tombol aksi. Secara default bertuliskan 'OK'
  String actionText = 'OK',
  // Agar dialog bisa ditutup dengan menekan overlay transparan
  // yang ada disekitar dialog. Secara default bernilai true
  bool barrierDismissible = true,
}) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Theme.of(context).backgroundColor,
    title: Text(
      titleText,
    ),
    content: Text(
      contentText,
    ),
    actions: [
      TextButton(
        child: Text(
          actionText,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        onPressed: actionOnPressed,
      ),
    ],
  );

  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

/// Untuk memunculkan dialog dengan circular loading indicator.
/// Dalam fungsi ini hanya terdapat 1 required parameter, yaitu
/// BuildContext
showLoadingDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Theme.of(context).backgroundColor,
    title: const Text(
      'Mohon tunggu',
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    ),
  );

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () {
            return Future.delayed(Duration.zero, () {
              return false;
            });
          },
          child: alert);
    },
  );
}

showDialogReview(
  BuildContext context, {
  VoidCallback? cancelButton,
  VoidCallback? sendButton,
  required String id,
}) {
  AlertDialog alert = AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor,
      title: const Text(
        'Buat Review',
      ),
      content: FormReview(idRestaurant: id));

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => alert,
  );
}

class FormReview extends StatefulWidget {
  const FormReview({Key? key, required this.idRestaurant}) : super(key: key);
  final String idRestaurant;
  @override
  State<FormReview> createState() => _FormReviewState();
}

class _FormReviewState extends State<FormReview> {
  String nama = '';
  String review = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHalfHeight(context, number: 0.4),
      width: displayWidth(context) - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            onChanged: (value) {
              setState(() {
                nama = value;
              });
            },
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Nama Reviewer',
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              filled: true,
              fillColor: Theme.of(context).backgroundColor,
            ),
          ),
          TextFormField(
            onChanged: (value) {
              setState(() {
                review = value;
              });
            },
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'Review Restoran',
              labelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
              filled: true,
              fillColor: Theme.of(context).backgroundColor,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Button(
                  isi: "Batal",
                  tap: () {
                    Navigator.pop(context);
                  },
                  colorButton: Colors.yellow.shade900,
                  colorText: Colors.white,
                  percents: 0,
                  height: displayHeight(context) / 20,
                  radius: 10,
                ),
              ),
              Horizontals(10),
              Consumer<RestaurantProvider>(
                builder: (context, provider, child) => Expanded(
                  child: Button(
                    isi: "Kirim",
                    tap: nama.isEmpty || review.isEmpty
                        ? () {
                            print('kosong');
                          }
                        : () async {
                            print(nama);
                            print(review);
                            await provider.postReviewonRestaurant(
                                context, widget.idRestaurant, nama, review);
                          },
                    colorButton: nama.isEmpty || review.isEmpty
                        ? Colors.yellow.shade300
                        : Colors.yellow.shade800,
                    colorText: Colors.white,
                    percents: 0,
                    height: displayHeight(context) / 20,
                    radius: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
