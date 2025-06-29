import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/models/user_model.dart';

class MessageService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({required int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          final data = message.data() as Map<String, dynamic>;
          print(data);
          return MessageModel.fromJson(data);
        }).toList();

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt.compareTo(b.createdAt),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    required UserModel user,
    required bool isFromUser,
    required String message,
    required ProductModel product,
  }) async {
    try {
      await firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      }).then(
        (value) => print('Pesan Berhasil Dikirim!'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim!');
    }
  }
}
