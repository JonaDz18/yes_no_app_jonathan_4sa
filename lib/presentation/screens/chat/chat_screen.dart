import 'package:flutter/material.dart';
import 'package:yes_no_app_jonathan_4sa/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_jonathan_4sa/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_jonathan_4sa/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://cdn.prod.www.spiegel.de/images/3f9aaec2-735c-4bbf-8919-ee2d219e1188_w256_r1_fpx55.32_fpy44.98.jpg"),
          ),
        ),
        title: const Text("Sydney Sweeney😍"),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child:ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ( index % 2 == 0)
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
              },) ),

            /// Caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}