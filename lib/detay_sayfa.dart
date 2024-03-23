import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi_list_view/yemekler.dart';

class Detay_Sayfa extends StatefulWidget {

  Yemekler yemek;

  Detay_Sayfa({required this.yemek});

  @override
  State<Detay_Sayfa> createState() => _Detay_SayfaState();
}

class _Detay_SayfaState extends State<Detay_Sayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.yemek.yemek_ad),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Image.asset("resimler/${widget.yemek.yemek_resim_ad}"),
            Text("${widget.yemek.yemek_fiyat} \u{20BA}",style: TextStyle(color:Colors.indigo,fontSize: 48),),
            
            
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(

                child: Text("SİPARİŞ VER",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,

                ),
                onPressed: (){
                  print("${widget.yemek.yemek_ad} sipariş verildi");

                },

              ),
            ),
            
          ],
        ),
        
      ),

    );
  }
}
