import 'package:my_app/features/auth/domain/repositories/user_repository.dart';
import 'package:my_app/features/auth/domain/models/user_model.dart';

abstract class UserUseCases {
  Future<UserModel> getUser(String id);
  Future<List<UserModel>> getUsers();
}

class UserUseCasesImpl implements UserUseCases {
  final UserRepository userRepository;

  const UserUseCasesImpl({this.userRepository = const UserRepositoryImpl()});

  @override
  Future<List<UserModel>> getUsers() async {
    final result = await userRepository.getUsers();
    List<UserModel> users = [];
    if (result.isNotEmpty) {
      users = result
          .map<UserModel>(
            (e) => UserModel(
              address: AddressModel(
                city: e.address?.city ?? '',
                geo: GeoModel(
                  lat: e.address?.geo?.lat ?? '',
                  lng: e.address?.geo?.lng ?? '',
                ),
                street: e.address?.street ?? '',
                suite: e.address?.suite ?? '',
                zipcode: e.address?.zipcode ?? '',
              ),
              company: CompanyModel(
                bs: e.company?.bs ?? '',
                catchPhrase: e.company?.catchPhrase ?? '',
                name: e.company?.name ?? '',
              ),
              id: e.id ?? 0,
              email: e.email ?? '',
              name: e.name ?? '',
              phone: e.phone ?? '',
              username: e.username ?? '',
              website: e.website ?? '',
            ),
          )
          .toList();
    }
    return users;
  }

  @override
  Future<UserModel> getUser(String id) async {
    final result = await userRepository.getUser(id);
    UserModel user;
    user = UserModel(
      address: AddressModel(
        city: result.address?.city ?? '',
        geo: GeoModel(
          lat: result.address?.geo?.lat ?? '',
          lng: result.address?.geo?.lng ?? '',
        ),
        street: result.address?.street ?? '',
        suite: result.address?.suite ?? '',
        zipcode: result.address?.zipcode ?? '',
      ),
      company: CompanyModel(
        bs: result.company?.bs ?? '',
        catchPhrase: result.company?.catchPhrase ?? '',
        name: result.company?.name ?? '',
      ),
      id: result.id ?? 0,
      email: result.email ?? '',
      name: result.name ?? '',
      phone: result.phone ?? '',
      username: result.username ?? '',
      website: result.website ?? '',
    );
    return user;
  }
}
