import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormGlobal extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  const TextFormGlobal({
    super.key,
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure,
    required List<PhoneNumberFormatter> inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(159, 182, 156, 1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(
                left: 8.0,
                right:
                    8.0), // Добавляем горизонтальный отступ слева и справа от иконки
            child: Icon(Icons.phone),
          ),
          prefixIconConstraints: const BoxConstraints(
            // Устанавливаем высоту иконки равной высоте текстового поля
            minHeight: double.infinity,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0), // Добавляем вертикальный отступ в 8 пикселей
          hintStyle: const TextStyle(
            height: 1,
            color: Colors.white,
          ),
        ),
        inputFormatters: [PhoneNumberFormatter()],
      ),
    );
  }
}

// Класс для форматирования номера телефона
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final phoneNumber = newValue.text;

    if (phoneNumber.isEmpty) {
      return newValue;
    }

    var cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    const maxLength = 11;

    if (cleanedPhoneNumber.length < maxLength) {
      return newValue.copyWith(
        text: cleanedPhoneNumber,
        selection: TextSelection.collapsed(offset: cleanedPhoneNumber.length),
      );
    }

    String formattedPhoneNumber = '7${cleanedPhoneNumber.substring(1, 4)}'
        '${cleanedPhoneNumber.substring(4, 7)}'
        '${cleanedPhoneNumber.substring(7, 9)}'
        '${cleanedPhoneNumber.substring(9, cleanedPhoneNumber.length)}';

    return newValue.copyWith(
      text: formattedPhoneNumber,
      selection: TextSelection.collapsed(offset: formattedPhoneNumber.length),
    );
  }
}
