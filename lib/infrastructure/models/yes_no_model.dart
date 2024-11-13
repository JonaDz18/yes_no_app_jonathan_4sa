//El modelo define qué datos debe tener la aplicación. Investigar MVC = Modelo = información
//Vista = lo que vemos, Controlador = como funciona
//Patron de diseño de software

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app_jonathan_4sa/domain/entities/message.dart';

class YesNoModel {
  //Atributos de clase
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  //factoryno necesariamente crea una nueva instancia
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
      //Condicional ternario para darle valor a los mensajes
      text: answer == "yes"
          ? "Yes"
          : answer == "no"
              ? "No"
              : "Quizás",
      //Siempre va a ser ella
      fromWho: FromWho.hers,
      //Será el gif
      imageUrl: image);
}