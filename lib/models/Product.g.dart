// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
      coloredImg: (json['coloredImg'] as List<dynamic>?)
              ?.map(
                  (e) => (e as List<dynamic>).map((e) => e as String).toList())
              .toList() ??
          const [],
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      isFavourite: json['isFavourite'] as bool? ?? false,
      isPopular: json['isPopular'] as bool? ?? false,
      category: json['category'] as String? ?? '',
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'colors': instance.colors,
      'coloredImg': instance.coloredImg,
      'rating': instance.rating,
      'price': instance.price,
      'isFavourite': instance.isFavourite,
      'isPopular': instance.isPopular,
      'category': instance.category,
    };
