import 'package:flutter/material.dart';
import 'package:yes_no_app_jonathan_4sa/config/helpers/get_yes_no_answer.dart';
import '../../domain/entities/message.dart';
import 'dart:developer' as developer;



class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: "Hola Ader", fromWho: FromWho.me),
    Message(text: "¿Lloras porque reprobaste tópicos?", fromWho: FromWho.me)


    

  ];
  //Controlador para manejar la posición del scroll
  final ScrollController chatScrollController = ScrollController();

  //Instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();

  //Variable para la última hora de mensaje
  DateTime lastMessageTime = DateTime.now();


  //Enviar un mensaje
  Future<void> sendMessage(String text) async {
  // Verifica si el texto está vacío antes de enviar el mensaje
    if (text.trim().isEmpty) return;
    //Avanza unos minutos en la última hora del mensaje
    lastMessageTime = lastMessageTime.add(const Duration(minutes: 1));
    //El mensaje siempre va a ser "me" porque yo lo envío
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a la Lista "messageList"
    messageList.add(newMessage);
    if (text.endsWith("?")) {
      herReply();
      // Usa developer.log para registrar la cantidad de mensajes en la consola
    developer.log("Cantidad de mensajes: ${messageList.length}", name: 'ChatProvider');
    }
    //Notifica si algo de provider cambió para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
  }
    

    //Mover el scroll al último mensaje
    Future<void> moveScrollToBottom() async{
      if (chatScrollController.hasClients) {
      //Un pequeño atraso en la animación para garantizar que siempre se verá aún cuando se envíen mensajes cortos y rápidos
      await Future.delayed(const Duration(seconds: 1));
      chatScrollController.animateTo(
        //Offset: posición de la animación
        //maxScrollExtent determina a lo máximo que el scroll puede dar
        chatScrollController.position.maxScrollExtent, 
        //Duración de la animación
        duration: const Duration(milliseconds: 300), 
        //"Rebote" al final de la animación 
        curve: Curves.easeOut);
      }
    }
    
      Future<void> herReply() async{
        await Future.delayed(const Duration(seconds: 2)); //Retardo de 2 segundos
        //Obtener el mensaje de la petición
        final herMessage = await getYesNoAnswer.getAnswer();
        //Añadir el mensaje de mi crush a la lista
        messageList.add(herMessage);
        //Notifica si algo de provider cambió para el estado
        notifyListeners();
        //Mueve el scroll hasta el último mensaje recibido
        moveScrollToBottom();
      }  
}