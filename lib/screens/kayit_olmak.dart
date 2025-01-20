import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:massageme_proje/screens/chat_screen.dart';
import 'package:massageme_proje/widgets/my_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class KayitOlmak extends StatefulWidget {
    static const String screenRoute='kayit_olmak';

  const KayitOlmak({super.key});

  @override
  State<KayitOlmak> createState() => _KayitOlmakState();
}

class _KayitOlmakState extends State<KayitOlmak> {
  final _auth=FirebaseAuth.instance;

  late String email;
  late String password;

  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
  body: ModalProgressHUD(
    inAsyncCall: showSpinner,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 180,
            child: Image.asset('images/logo.png'),
          ),
          const SizedBox(height: 50),
          TextField(
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            onChanged: (value) {
              email=value;
            },
            decoration:const InputDecoration(
            hintText: 'E-posta girin',
             contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20
             ),
             border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
             ),
             enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange,
             width: 1 ),
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
             ),
             focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue,
             width: 2 ),
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
             ),
            ),
    
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              password=value;
            },
            decoration:const InputDecoration(
            hintText: 'Şifre girin',
             contentPadding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20
             ),
             border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
             ),
             enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange,
             width: 1 ),
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
             ),
             focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue,
             width: 2 ),
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
             ),
            ),
    
          ),
          const SizedBox(height: 10),
          MyButton(color: Colors.blue[700]!,
           title: 'kayıt olmak',
            onPressed:()async{
              setState(() {
                     showSpinner=true;

              });
            
             try {
               final newUser = await _auth.
               createUserWithEmailAndPassword(
             email: email, password: password);
             Navigator.pushNamed(context, ChatScreen.screenRoute);
              setState(() {
                showSpinner=false;
              });
               
             } catch (e) {
              print(e);
               
             }
    
            },
            )
        ],
      ),
    ),
  ),
);

  }
}
