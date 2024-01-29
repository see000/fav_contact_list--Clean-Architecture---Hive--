import '../../../../core/usecases/usecase.dart';
import '../entities/contact_entity.dart';
import '../repository/contact_repository.dart';

class AddFavouriteContactUseCase extends UseCase<void, ContactEntity> {
  final ContactRepository _contactRepository;

  AddFavouriteContactUseCase(this._contactRepository);

  @override
  Future<void> call(ContactEntity params) async {
    _contactRepository.addFavouriteContact(params);
  }

}