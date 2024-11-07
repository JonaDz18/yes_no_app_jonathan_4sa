//El modelo define qué datos debe tener la aplicación. Investigar MVC = Modelo = información
//Vista = lo que vemos, Controlador = como funciona
//Patron de diseño de software

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
}