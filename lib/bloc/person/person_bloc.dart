import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xcbt/data/models/person_mdl.dart';

// import '../../data/datasource/person_dts.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  // final PersonDatasource _personDS;

  PersonBloc() : super(PersonInitial(person: [])) {
    // on<AddPerson>(_addPerson);
    // on<DeletePerson>(_deletePerson);
    on<LoadPersonEvent>((event, emit) async {
      emit(PersonLoadingState(person: []));
    });
  }
  
  // void _addPerson(AddPerson event, Emitter<PersonState> emit) {
  //   state.person.add(event.person);
  //   emit(PersonUpdate(person: state.person));
  // }

  // void _deletePerson(DeletePerson event, Emitter<PersonState> emit) {
  //   state.person.remove(event.person);
  //   emit(PersonUpdate(person: state.person));
  // }
}
