import 'package:equatable/equatable.dart';

class Wine extends Equatable {
  final String? id;
  final String? userid;
  final String? wineName;
  final String? producerName;
  final String? districtName;
  final int? vintage;
  final int? points;
  final DateTime? createdDate;
  final DateTime? modifiedDate;

  const Wine({
    this.id,
    this.userid,
    this.wineName,
    this.producerName,
    this.districtName,
    this.vintage,
    this.points,
    this.createdDate,
    this.modifiedDate,
  });

  factory Wine.fromMap(Map<String, dynamic> map) {
    return Wine(
      id: map['id'] != null ? map['id'] as String : null,
      userid: map['userid'] != null ? map['userid'] as String : null,
      wineName: map['wineName'] != null ? map['wineName'] as String : null,
      producerName:
          map['producerName'] != null ? map['producerName'] as String : null,
      districtName:
          map['districtName'] != null ? map['districtName'] as String : null,
      vintage: map['vintage'] != null ? map['vintage'] as int : null,
      points: map['points'] != null ? map['points'] as int : null,
      createdDate: map['createdDate'] != null
          ? DateTime.parse(map['createdDate'])
          : null,
      modifiedDate: map['modifiedDate'] != null
          ? DateTime.parse(map['modifiedDate'])
          : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userid,
      wineName,
      producerName,
      districtName,
      vintage,
      points,
    ];
  }
}
