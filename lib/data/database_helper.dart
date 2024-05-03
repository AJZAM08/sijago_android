import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/profile_model.dart';
import 'models/users_models.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'app_database.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            username TEXT,
            email TEXT UNIQUE,
            phoneNumber TEXT,
            password TEXT,
            referralCode TEXT,
            isVerified INTEGER
          )
        ''');
        await db.execute('''
          CREATE TABLE user_profiles(
            id INTEGER PRIMARY KEY,
            userId INTEGER,
            nik TEXT,
            fullName TEXT,
            birthDate TEXT,
            birthPlace TEXT,
            gender TEXT,
            address TEXT,
            subDistrict TEXT,
            district TEXT,
            province TEXT,
            postalCode TEXT,
            religion TEXT,
            maritalStatus TEXT
          )
        ''');
      },
      version: 1,
    );
  }

  static Future<void> insertUser(UserModel user) async {
    final db = await database;
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> insertUserProfile(UserProfileModel userProfile) async {
    final Database db = await database;
    return await db.insert('user_profiles', userProfile.toMap());
  }

  static Future<List<UserModel>> users() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return UserModel.fromMap(maps[i]);
    });
  }
}
