import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_app_jonathan_4sa/domain/entities/message.dart";
import "package:yes_no_app_jonathan_4sa/presentation/providers/chat_provider.dart";
import "package:yes_no_app_jonathan_4sa/presentation/widgets/chat/her_message_bubble.dart";
import "package:yes_no_app_jonathan_4sa/presentation/widgets/chat/my_message_bubble.dart";
import "package:yes_no_app_jonathan_4sa/presentation/widgets/shared/message_field_box.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://img.goodfon.com/original/2400x1350/1/65/sydney-sweeney-devushka-vzgliad-litso-makiiazh-braslet.jpg"),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sydney Sweeney😍", // Nombre de la persona
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "En línea", // Estado "En línea"
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(
                          message: message,
                        );
                },
              ),
            ),

            // Caja de texto
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}