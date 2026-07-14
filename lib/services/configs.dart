import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomConfig {
  // LimeLight Copy Store - read from environment with fallbacks
  static String get shopifyStoreFrontAPIAccessToken =>
      dotenv.env['SHOPIFY_STOREFRONT_API_ACCESS_TOKEN'] ?? '';

  static String get shopifyAdminAPIAccessToken =>
      dotenv.env['SHOPIFY_ADMIN_API_ACCESS_TOKEN'] ?? '';

  static String get shopifyAppName => dotenv.env['SHOPIFY_APP_NAME'] ?? '';
  static String get shopifyStoreLink => dotenv.env['SHOPIFY_STORE_LINK'] ?? '';
  static String get shopifyApiVersion =>
      dotenv.env['SHOPIFY_API_VERSION'] ?? '';

  static String get braintreeTokenizationKey =>
      dotenv.env['BRAINTREE_TOKENIZATION_KEY'] ?? '';
  static String get braintreeClientToken =>
      dotenv.env['BRAINTREE_CLIENT_TOKEN'] ?? '';

  String generateIdempotencyKey() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}

class CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove any non-digits
    newText = newText.replaceAll(RegExp(r'[^\d]'), '');

    // Add a space after every 4 digits
    newText = newText.replaceAllMapped(
        RegExp(r'.{4}'), (match) => '${match.group(0)} ');

    // If the text is longer than 19 characters (16 digits + 3 spaces),
    // truncate the excess characters
    if (newText.length > 19) {
      newText = newText.substring(0, 19);
    }

    // Create a new TextEditingValue with the formatted text and the selection
    return TextEditingValue(
      text: newText,
      selection: newValue.selection,
    );
  }
}

class CreditCardNumberFormatter1 extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove any non-digits
    newText = newText.replaceAll(RegExp(r'[^\d]'), '');

    // Add a space after every 4 digits
    newText = newText
        .replaceAllMapped(RegExp(r'.{1,4}'), (match) => '${match.group(0)} ')
        .trim();

    // Determine the new cursor position
    int cursorPosition = newValue.selection.baseOffset;
    int oldLength = oldValue.text.length;
    int newLength = newText.length;
    int diff = newLength - oldLength;
    if (diff > 0 && cursorPosition == oldLength) {
      // If new characters were added and the cursor was at the end of the old text,
      // move the cursor to the end of the new text
      cursorPosition = newLength;
    } else if (diff < 0 && cursorPosition == newLength + 1) {
      // If characters were deleted and the cursor was at the end of the old text,
      // move the cursor to the end of the new text
      cursorPosition = newLength;
    } else if (cursorPosition % 5 == 0 && diff > 0) {
      // If new characters were added and the cursor is at a position where a space will be added,
      // move the cursor one position to the right
      cursorPosition += 1;
    } else if (cursorPosition % 5 == 0 && diff < 0) {
      // If characters were deleted and the cursor is at a position where a space was removed,
      // move the cursor one position to the left
      cursorPosition -= 1;
    }

    // Create a new TextEditingValue with the formatted text and the selection
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
