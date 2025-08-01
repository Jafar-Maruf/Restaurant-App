import 'package:basic_restaurant_app/core/index.dart';
import 'package:basic_restaurant_app/domain/auth/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

part 'models/user_model.dart';
part 'repositories/auth_repository_impl.dart';
part 'requests/login_user_request.dart';
part 'requests/store_user_request.dart';
part 'sources/auth_firebase_service.dart';
