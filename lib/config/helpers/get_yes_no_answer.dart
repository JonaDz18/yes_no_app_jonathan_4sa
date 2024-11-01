
import 'package:dio/dio.dart';
import 'package:yes_no_app_jonathan_4sa/domain/entities/message.dart';

class GetYesNoAnswer {
  //Se crea objeto de la clase Dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //Obtener la respuesta
  Future<Message> getAnswer() async {
    //Almacebar la petición GET en una variable
    final Response = await _dio.get("https://yesno.wtf/api");

    //Generar el error
    throw UnimplementedError();


  }
}

