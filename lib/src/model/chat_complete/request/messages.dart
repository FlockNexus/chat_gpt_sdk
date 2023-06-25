import 'package:chat_gpt_sdk/src/client/exception/mission_name_exception.dart';

import '../enum/role.dart';

class Messages {
  ///The role of the messages author. One of , , ,
  ///or .system user assistant function
  ///[role]
  final Role role;

  ///The contents of the message. is required
  ///for all messages except assistant messages
  /// with function calls.content
  /// [content]
  final String? content;

  ///The name of the author of this message.
  /// is required if role is , and it should be
  /// the name of the function whose response is in the .
  /// May contain a-z, A-Z, 0-9, and underscores,
  /// with a maximum length of 64 characters.name function content
  /// [name]
  final String? name;

  ///The name and arguments of a function
  /// that should be called, as generated by the model.
  /// [functionCall]
  final Map<String, dynamic>? functionCall;

  Messages({required this.role, this.content, this.name, this.functionCall});

  ///normal model
  Map<String, dynamic> toJson() => Map.of(
        {
          "role": role.name,
          "content": content,
        },
      );

  ///function model
  Map<String, dynamic> toJsonFunctionStruct() {
    if (name == null || name == "") {
      throw MissionNameException();
    }

    return Map.of(
      {
        "role": role.name,
        "content": content,
        "name": name,
        "function_call": functionCall,
      },
    );
  }
}