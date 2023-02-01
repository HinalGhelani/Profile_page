import 'dart:io';
import 'package:flutter/cupertino.dart';

class Global{

  static TextEditingController nameC = TextEditingController();
  static TextEditingController phoneC = TextEditingController();
  static TextEditingController emailC = TextEditingController();
  static TextEditingController birthDate = TextEditingController();
  static TextEditingController genderC = TextEditingController();
  static TextEditingController locateC = TextEditingController();
  static TextEditingController nationC = TextEditingController();
  static TextEditingController religionC = TextEditingController();
  static TextEditingController languageC = TextEditingController();
  static TextEditingController bioC = TextEditingController();

  static List l =[];

  static File? image;
  static String name = '';
  static String phone = '';
  static String email = '';
  static String dob = '';
  static String gender = '';
  // static dynamic gender;
  static String locate = '';
  static String nation = '';
  static String religion = '';
  static String l1 = '';
  static String l2 = '';
  static String l3 = '';
  static String bio = '';
  static int i = 0;
  static bool first = false;
  static bool second = false;
  static bool third = false;
}