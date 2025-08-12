//generate mock

// Package imports:
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';

// Project imports:
import 'package:puvadon_jenosize/src/core/navigations/navigation_core.dart';
import 'package:puvadon_jenosize/src/core/secure_storage_core.dart';

@GenerateNiceMocks(<MockSpec<dynamic>>[
  MockSpec<Dio>(),
  MockSpec<Navigation>(),
  MockSpec<SecureStorageImpl>(),
])
// Mock data
const String expectString = 'mock';
const String expectPhoneNumber = '0823456789';
const String expectOTP = '123456';
const double expectDouble = 1.0;
const String expectLatitude = '13.7563';
const String expectLongitude = ' 100.5018';
const int expectInt = 1;
const bool expectBool = true;

final Map<String, String> mockEnv = <String, String>{'BASE_URL': expectString};
