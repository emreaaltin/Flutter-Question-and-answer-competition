import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emre Altın',
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: BilgiTesti(),
        ),
      ),
    );
  }
}

List<Widget> ifadeler = [];
int soruindex = 0;
List<Soru> soruBankasi = [
  Soru(soruMetni: "Dünya Düzdür", soruYaniti: false),
  Soru(soruMetni: "Son Dünya Kupasını Fransa Kazanmıştır", soruYaniti: true),
  Soru(soruMetni: "Türkiyenin Para Birimi Türk Lirasıdır", soruYaniti: true),
  Soru(soruMetni: "Türkiyeden Ukrayna'ya Gitmek Vizelidir", soruYaniti: false),
  Soru(
      soruMetni: "İlk Uzaya Çıkan İnsan Dimitri Sperno'dur", soruYaniti: false),
  Soru(
      soruMetni: "Türkiye'nin Hiç Dünya Kupası Şampiyonluğu Yoktur",
      soruYaniti: true),
  Soru(
      soruMetni: "Kablosuz Mouseler 2011 Yılında İcat Edilmiştir",
      soruYaniti: false),
];

class BilgiTesti extends StatefulWidget {
  const BilgiTesti({super.key});

  @override
  State<BilgiTesti> createState() => _BilgiTestiState();
}

class _BilgiTestiState extends State<BilgiTesti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 9, 22),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "Bilgi Yarışması",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.menu,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bilgi Yarışması",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                soruBankasi[soruindex].soruMetni,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: ifadeler,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        ifadeler.remove(dogruSecim);
                        ifadeler.remove(yanlisSecim);
                        print(soruindex);
                        soruBankasi[soruindex].soruYaniti == true
                            ? ifadeler.add(dogruSecim)
                            : ifadeler.add(yanlisSecim);
                      });
                    },
                    icon: Icon(Icons.thumb_up),
                    label: Text("Doğru !"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        ifadeler.remove(dogruSecim);
                        ifadeler.remove(yanlisSecim);
                        print(soruindex);
                        if (soruBankasi[soruindex].soruYaniti == false) {
                          ifadeler.add(dogruSecim);
                        } else {
                          ifadeler.add(yanlisSecim);
                        }
                      });
                    },
                    icon: Icon(Icons.thumb_down),
                    label: Text("Yanlış !"),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    soruindex++;
                  });
                },
                icon: Icon(Icons.next_plan),
                label: Text("Sonraki Soru"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Soru {
  String soruMetni;
  bool soruYaniti;
  Soru({required this.soruMetni, required this.soruYaniti});
}
