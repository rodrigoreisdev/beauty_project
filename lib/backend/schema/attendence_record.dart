import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'attendence_record.g.dart';

abstract class AttendenceRecord
    implements Built<AttendenceRecord, AttendenceRecordBuilder> {
  static Serializer<AttendenceRecord> get serializer =>
      _$attendenceRecordSerializer;

  @nullable
  String get uid;

  @nullable
  DateTime get date;

  @nullable
  String get anwser;

  @nullable
  String get photo;

  @nullable
  String get subject;

  @nullable
  String get age;

  @nullable
  String get weight;

  @nullable
  String get height;

  @nullable
  String get question1;

  @nullable
  String get question2;

  @nullable
  String get question3;

  @nullable
  String get question4;

  @nullable
  String get question5;

  @nullable
  String get question6;

  @nullable
  String get question7;

  @nullable
  String get question8;

  @nullable
  String get question9;

  @nullable
  String get question10;

  @nullable
  String get question11;

  @nullable
  String get name;

  @nullable
  String get phone;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AttendenceRecordBuilder builder) => builder
    ..uid = ''
    ..anwser = ''
    ..photo = ''
    ..subject = ''
    ..age = ''
    ..weight = ''
    ..height = ''
    ..question1 = ''
    ..question2 = ''
    ..question3 = ''
    ..question4 = ''
    ..question5 = ''
    ..question6 = ''
    ..question7 = ''
    ..question8 = ''
    ..question9 = ''
    ..question10 = ''
    ..question11 = ''
    ..name = ''
    ..phone = ''
    ..email = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendence');

  static Stream<AttendenceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AttendenceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AttendenceRecord._();
  factory AttendenceRecord([void Function(AttendenceRecordBuilder) updates]) =
      _$AttendenceRecord;

  static AttendenceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAttendenceRecordData({
  String uid,
  DateTime date,
  String anwser,
  String photo,
  String subject,
  String age,
  String weight,
  String height,
  String question1,
  String question2,
  String question3,
  String question4,
  String question5,
  String question6,
  String question7,
  String question8,
  String question9,
  String question10,
  String question11,
  String name,
  String phone,
  String email,
}) =>
    serializers.toFirestore(
        AttendenceRecord.serializer,
        AttendenceRecord((a) => a
          ..uid = uid
          ..date = date
          ..anwser = anwser
          ..photo = photo
          ..subject = subject
          ..age = age
          ..weight = weight
          ..height = height
          ..question1 = question1
          ..question2 = question2
          ..question3 = question3
          ..question4 = question4
          ..question5 = question5
          ..question6 = question6
          ..question7 = question7
          ..question8 = question8
          ..question9 = question9
          ..question10 = question10
          ..question11 = question11
          ..name = name
          ..phone = phone
          ..email = email));
