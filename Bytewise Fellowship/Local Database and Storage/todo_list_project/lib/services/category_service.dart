import 'package:todo_list_project/models/category.dart';
import 'package:todo_list_project/repositories/repository.dart';

class CategoryService {
  Repository? _repository;
  CategoryService() {
    _repository = Repository();
  }
  // CategoryService(this._repository);
  saveCategory(Category category) async {
    return await _repository!.insertData('categories', category.categoryMap());
  }
}
