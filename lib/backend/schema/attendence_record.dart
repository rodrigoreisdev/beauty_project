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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AttendenceRecordBuilder builder) => builder
    ..uid = ''
    ..anwser = ''
    ..photo = '';

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
}) =>
    serializers.toFirestore(
        AttendenceRecord.serializer,
        AttendenceRecord((a) => a
          ..uid = uid
          ..date = date
          ..anwser = anwser
          ..photo = photo));
