import '../../../../core/usecases/usecase.dart';
import '../entities/contact_entity.dart';
import '../repository/contact_repository.dart';

class RemoveFavouriteContactUseCase implements UseCase<void, ContactEntity> {
 
  final ContactRepository _contactRepository;

  const RemoveFavouriteContactUseCase(this._contactRepository);


  @override
  Future<void> call(ContactEntity params)  {
    return _contactRepository.removeFavoriteContact(params);
  }

}