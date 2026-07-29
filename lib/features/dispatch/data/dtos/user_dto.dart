import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sgsd_core/features/dispatch/data/mappers/task_destinations.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/delivery_status.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String name,
    required String email,
    required String status,
  }) = _UserDto;

  const UserDto._();

  factory UserDto.fromJson(Map<String, Object?> json) =>
      _$UserDtoFromJson(json);

  DispatchItem toEntity() {
    return DispatchItem(
      id: id,
      recipientName: name,
      recipientEmail: email,
      destination: destinationForUserId(id),
      status: status == 'active'
          ? DeliveryStatus.pending
          : DeliveryStatus.delivered,
    );
  }
}
