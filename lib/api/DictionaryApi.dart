import 'package:clean_dictionary/models/result_model.dart';
import 'package:clean_dictionary/service/ApiBaseHelper.dart';

class DictionaryApi {
  ApiBaseHelper _helper = ApiBaseHelper();
  Future<List<ResultModel>> fetchAll(String word) async {
    final response = await _helper.get(word);
    return response;
  }
}
