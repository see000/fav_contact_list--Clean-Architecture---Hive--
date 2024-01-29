import '../../../../core/usecases/usecase.dart';
import '../entities/contact_entity.dart';
import '../repository/contact_repository.dart';

class GetFavouriteContactUseCase implements UseCase<List<ContactEntity>, void> {
 
  final ContactRepository _contactRepository;

  const GetFavouriteContactUseCase(this._contactRepository);


  @override
  Future<List<ContactEntity>> call(void params)  {
    return _contactRepository.getLocalFavouriteContacts();
  }

}