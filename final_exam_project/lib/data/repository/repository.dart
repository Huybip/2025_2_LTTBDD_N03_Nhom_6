import 'package:final_exam_project/data/source/source.dart';

import '../model/song.dart';

abstract interface class Repository {
  Future<List<Song>> loadData();
}

class DefaultRepository implements Repository {
  final _localDataSource = LocalDataSource();
  final _remoteDataSource = RemoteDataSource();

  @override
  Future<List<Song>> loadData() async {
    // Thử lấy từ remote trước.
    try {
      final remoteSongs = await _remoteDataSource.loadData();
      if (remoteSongs != null && remoteSongs.isNotEmpty) {
        return List<Song>.unmodifiable(remoteSongs);
      }
    } catch (_) {
      // Bỏ qua, sẽ fallback sang local.
    }

    // Fallback sang local (assets/songs.json).
    try {
      final localSongs = await _localDataSource.loadData();
      if (localSongs != null) {
        return List<Song>.unmodifiable(localSongs);
      }
    } catch (_) {
      // Nếu local cũng lỗi thì trả về list rỗng.
    }

    return const <Song>[];
  }
}
