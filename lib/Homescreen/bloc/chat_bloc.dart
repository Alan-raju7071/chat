import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
    List<String> obj = [];
  ChatBloc() : super(ChatInitial()) {
    on<Ontaper>((event, emit) {
       obj.add(event.message);
      
      emit(Tapper(ontap: List.from(obj)));
      
      
    });
  }
}
