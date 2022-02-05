import 'package:flutter/material.dart';
import 'package:myunify/widgets/generales/Colores.dart';
import 'package:myunify/widgets/mensajes_widgets/Rechazar.dart';
import 'package:myunify/widgets/mensajes_widgets/aceptar.dart';

class Msgsolicitud extends StatelessWidget {
  
  const Msgsolicitud({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    // ignore: todo
    //TODO ESTA DENTRO DE UN COLUMN PARA QUE SE VEA EL ANCHO DEL CONTAINER
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: size.width*0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colores.colorNaranja,
          ),
          child: Row(
            children: [
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.person_add_alt_1,
                            color: Colors.black
                          )
                        ),
                        TextSpan(
                          text: " Solicitud de amistad",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Subs'
                          ),
                        )
                      ]
                    ),
                  ),
                  const Text(
                    //Añadir nombre desde el constructor
                    'Tales quiere ser de tu parche',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Plano'
                    )
                  ),

                  const Text(
                    'ñslañsñañalñalñsalñ' ,//Añadir descripcion
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Plano'
                    )
                  ),

                  Row(
                    children: [
                      Aceptar(),
                      SizedBox(width: 3),
                      Rechazar(),
                    ],
                  )
                ]

              ),
              const SizedBox(width: 7),
              //SizedBox(width: 10),
              Container(
                height: 80,
                width: 80,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.black
                ) ,
                child: GestureDetector(
                  onTap: (){print('hola');},
                  child: const Icon(
                    Icons.person_pin_sharp,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                    
                
              ),
              
                //Añadir foto de perfil del man
            ]
          )

        ),
      ],
    );
  }
}

/*
RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: "Click ",
      ),
      WidgetSpan(
        child: Icon(Icons.add, size: 14),
      ),
      TextSpan(
        text: " to add",
      ),
    ],
  ),
)*/