import '../../../../core/resources/data_state.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/contact_entity.dart';
import '../repository/contact_repository.dart';

class GetContactListUseCase implements UseCase <DataState<List<ContactEntity>>, void> {
 
  final ContactRepository _contactRepository;

  const GetContactListUseCase(this._contactRepository);


  @override
  Future<DataState<List<ContactEntity>>> call(void params) {
    return _contactRepository.getContacts();
  }

}