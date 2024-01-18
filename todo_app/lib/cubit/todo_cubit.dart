import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title, String desc) {

    if (title.isEmpty){
      addError('Title can not be empty');
      return ;
    }
    final todo =
        Todo(title: title, description: desc, createdAt: DateTime.now());
    //This will not give any changes because if the state is equal to current state then 
    //emit do not notify the listeners
    // state.add(todo);
    // emit(state);

    // This line will keep the previous todos as it is and add a new one
    emit([...state, todo]);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('TodoCubit - $error');
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print(change);
  }
}
