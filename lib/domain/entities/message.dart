//Identidad atómica: la unidad más pequeña de un sistema.
enum FromWho {me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromwho;

  Message({required this.text, this.imageUrl, required this.fromwho});
}