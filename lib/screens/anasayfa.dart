import 'package:flutter/material.dart';
import 'package:massageme_proje/screens/giris_sayfa.dart';
import 'package:massageme_proje/screens/kayit_olmak.dart';
import 'package:massageme_proje/widgets/my_button.dart';



class Anasayfa extends StatefulWidget {
  static const String screenRoute='anasayfa'; //static yardimiyle sadece property olan screenRoute çararak , class'a oluşturmak yerine 

 const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          SizedBox(
            height: 180,
            child: Image.asset('images/logo.png'),
            
          ),
          const Text('MessageMe',
          style: TextStyle(fontSize:40,
           fontWeight:FontWeight.w900,
          color: Color(0xff2e386b),
         
          ), 
           ),
        
          const SizedBox(height: 30),
          MyButton(
            color: Colors.yellow[900]!,
            title: 'Giriş',
            onPressed: (){
              Navigator.pushNamed(context, GirisSayfa.screenRoute);
            },
          ),
          MyButton(
            color: Colors.blue[800]!,
           title: 'Kayit Olmak',
            onPressed: (){
              Navigator.pushNamed(context, KayitOlmak.screenRoute);
            },
            )
        ],
        ),
      ),
    );
  }
}

