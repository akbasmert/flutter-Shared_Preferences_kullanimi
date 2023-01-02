import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    super.initState();
   // test();
    sayacKontrol();


  }
  Future<void> test() async{
    //Tanımlama
    var sp = await SharedPreferences.getInstance();


    //veri kaydı

    sp.setString("ad", "Ahmet");
    sp.setInt("yas", 23);
    sp.setDouble("boy", 1.74);
    sp.setBool("bekar", true);

    //veri okuma

    String gelenAd = sp.getString("ad") ?? "isim yok";
    print("gelen ad: $gelenAd");

    var arkadasListesi = <String>[];
    arkadasListesi.add("eda");
    arkadasListesi.add("ali");
    sp.setStringList("liste", arkadasListesi);


    //silme
   // sp.remove("ad");
    //veri okuma

    String gelenAda = sp.getString("ad") ?? "isim yok";

    int gelenYas = sp.getInt("yas") ?? 0;
    double gelenBoy = sp.getDouble("boy") ?? 0.0;
    bool gelenBekar = sp.getBool("bekar") ?? false;
    var gelenListe = sp.getStringList("liste") ?? <String>[];

    print("gelen ad: $gelenAda");
    print("gelen yas $gelenYas");
    print("gelen yas $gelenBoy");
    print("gelen yas $gelenBekar");
    for(var a in gelenListe){
      print("arkadas $a");
    }

  }


  int sayac = 0;

  Future<void> sayacKontrol() async{
    var sp = await SharedPreferences.getInstance();
    sayac = sp.getInt("sayac")??0;
    setState(() {
      sayac+=1;
    });
    sp.setInt("sayac", sayac);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(sayac.toString(),style: TextStyle(
              fontSize: 100
            ),
            ),


          ],
        ),
      ) ,

    );
  }
}
