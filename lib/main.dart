import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi_list_view/detay_sayfa.dart';
import 'package:yemek_uygulamasi_list_view/yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Yemekler>>yemekleri_getir() async{

    var yemek_listesi=<Yemekler>[];
    var y1=Yemekler(1,"Köfte", "kofte.png", 100);
    var y2=Yemekler(2,"Ayran", "ayran.png", 15.25);
    var y3=Yemekler(3,"Fanta", "fanta.png", 30);
    var y4=Yemekler(4,"Makarna", "makarna.png", 150.50);
    var y5=Yemekler(5,"Kadayıf", "kadayif.png", 130.75);
    var y6=Yemekler(6,"Baklava", "baklava.png", 200);

    yemek_listesi.add(y1);
    yemek_listesi.add(y2);
    yemek_listesi.add(y3);
    yemek_listesi.add(y4);
    yemek_listesi.add(y5);
    yemek_listesi.add(y6);

    return yemek_listesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("YEMEKLER"),
      ),
      body: FutureBuilder<List<Yemekler>>(

        future: yemekleri_getir(),
        builder: (context,snapshot){

          if(snapshot.hasData){

            var yemek_listesi=snapshot.data;
            return ListView.builder(
              itemCount: yemek_listesi !.length,
              itemBuilder: (context,indeks){
                var yemek=yemek_listesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Detay_Sayfa(yemek:yemek)));
                  },
                  child: Card(
                    child: Row(
                  
                      children: [
                      SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset("resimler/${yemek.yemek_resim_ad}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(yemek.yemek_ad,style: TextStyle(fontSize: 25),),
                            SizedBox(
                  
                              height: 50,
                  
                            ),
                            Text("${yemek.yemek_fiyat} \u{20BA} ",style: TextStyle(color:Colors.indigo,fontSize: 20),),
                          ],
                        ),
                      Spacer(),
                        Icon(Icons.arrow_circle_right),
                  
                      ],
                    ),
                  ),
                );
              },
            );
          }

          else{
            return Center();
          }
        },
      ),

    );
  }
}
