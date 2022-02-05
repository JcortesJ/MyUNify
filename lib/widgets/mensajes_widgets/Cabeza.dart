import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrones inicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Cabeza(),
    );
  }
}
*/
class Cabeza extends StatelessWidget {

const Cabeza({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.1,
      padding:const EdgeInsets.only(left: 15),
      decoration: 
        BoxDecoration(
          color: Colores.colorComplementario,
          boxShadow:[ 
            BoxShadow(
              color: Colores.colorNaranjaClaro.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0,3)
            )
          ]
        ),
      child: 
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:const [        
          Divider(
            color: Colors.white
          ),                     
          Text(
            'Tus amigos quieren parchar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Plano'
            )
          )
        ],
      
      )
      
      

    );
    
  }
}

/*
import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrones inicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Cabeza(),
    );
  }
}
*/
class Cabeza extends StatelessWidget {

const Cabeza({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
    width: size.width,
    height: size.height*0.21,
    padding:const EdgeInsets.only(left: 15),
    decoration: 
      BoxDecoration(
        color: Colores.colorRosado,
        boxShadow:[ 
          BoxShadow(
            color: Colores.colorNaranjaClaro.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0,3)
          )
        ]
      ),
    child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [          
          AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_sharp),
              onPressed: (){},
            ),
            elevation: 0,
            backgroundColor: Colores.colorRosado
          ),

          const SizedBox(height: 5),

          const Text(
            "MENSAJES",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Subs'
            )            
          ),
          const Divider(
            color: Colors.white,
            //height: 3,
          ),
          const Text(
            'Tus amigos quieren parchar',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Plano'
            )
          )
        ],
      
      )

    );
    
  }
}
 */