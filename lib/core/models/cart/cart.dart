import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:servplatform/core/models/serializers.dart';

part 'cart.g.dart';

/// An example Service model that should be serialized.
///   - @nullable: means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
abstract class Cart implements Built<Cart, ServiceBuilder> {
  @nullable
  int get id;

  String get cart_key;
  String get provider_key;
  String get service_key;
  String get url;
  String get location;
  String get eta;
  String get discount_options;
  String get delivery_note;
  String get order_key;
  String get bill_summary_collection;
  String get payment_methods;
  String get promo_codes;
  String get tip;
  
  String get cart;
  String get percentage_match;

  Map<String, dynamic> toMap() {
    return json.decode(serializers.serializeWith(Cart.serializer, this));
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Cart.serializer, this));
  }

  static Cart fromJson(String jsonString) {
    return serializers.deserializeWith(
      Cart.serializer,
      json.decode(jsonString),
    );
  }

  static Cart fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Cart.serializer,
      map,
    );
  }

  Cart._();
  static Serializer<Cart> get serializer => _$cartSerializer;
  factory Cart([void Function(ServiceBuilder) updates]) = _$Cart;
}