
import 'package:get_storage/get_storage.dart';

class YjCache {
	static final YjCache _instance = YjCache._internal();

	factory YjCache() {
		return _instance;
	}

	YjCache._internal();

	final GetStorage _storage = GetStorage();

	Future<void> init() async {
		await GetStorage.init();
	}
// 保存数据
	void write(String key, dynamic value) {
		_storage.write(key, value);
	}

	// 读取数据
	T read<T>(String key) {
		return _storage.read(key) as T;
	}

	// 删除数据
	void remove(String key) {
		_storage.remove(key);
	}

	// 检查数据是否存在
	bool hasData(String key) {
		return _storage.hasData(key);
	}

	// 清空存储
	Future<void> clear() async {
		await _storage.erase();
	}
}