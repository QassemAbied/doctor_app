import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/home/data/repos/repos.dart';
import '../../../../core/network/api_result.dart';
import '../../data/models/home_models.dart';
import 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepo homeRepo;
//   HomeCubit(this.homeRepo) : super(const HomeState.initial());
//
//   List<DataHomeModels?>? dataHomeModels=[];
//
//   void emitHomeCubit()async{
//     emit(const HomeState.loading());
//     final response= await homeRepo.home();
//     response.when(
//         success: (homeModel){
//            dataHomeModels = homeModel.data??[];
//            getDoctorsList(categoryId:dataHomeModels?.first?.id);
//           emit(HomeState.success(dataHomeModels));
//         },
//         failure: (error){
//           emit(HomeState.error(error: error.apiErrorModel.message ??''),);
//         }
//     );
//   }
//
//   void getDoctorsList({required int? categoryId}){
//     List<DoctorsDataModels?>? doctors= filtertDoctorsById(categoryId);
//
//     if(doctors !=null && doctors.isNotEmpty){
//       emit(HomeState.doctorSuccess(doctors));
//     }else{
//       emit(HomeState.doctorError(error: ErrorHandler.handle('error')));
//     }
// }
//  filtertDoctorsById(categoryId){
//     return dataHomeModels?.firstWhere((category)=>
//       category?.id== categoryId)?.doctors;
//
//
// }
// }

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(const HomeState.initial());

  List<DataHomeModels> categories = [];
  List<DoctorsDataModels> allDoctors = [];
  List<DoctorsDataModels> searchAllDoctors = [];

  void loadHome() async {
    emit(const HomeState.loading());

    final response = await homeRepo.home();
    response.when(
      success: (homeModel) {
        categories = (homeModel.data ?? [])
            .whereType<DataHomeModels>()
            .toList();

        allDoctors = categories
            .expand((e) => e.doctors ?? [])
            .whereType<DoctorsDataModels>()
            .toList();

        searchAllDoctors = allDoctors;
        emit(HomeState.success(allDoctors));
      },
      failure: (error) {
        emit(HomeState.error(error: error.apiErrorModel.message ?? 'Error'));
      },
    );
  }


  void filterByCategory(int? categoryId) {
    if (categoryId == null) {
      searchAllDoctors = allDoctors;
    } else {
      searchAllDoctors =
          categories
              .firstWhere((c) => c.id == categoryId)
              .doctors
              ?.whereType<DoctorsDataModels>()
              .toList() ??
          [];
    }

    emit(HomeState.success(searchAllDoctors));
  }

  void searchDoctor(String query) {
    if (query.isEmpty) {
      emit(HomeState.success(searchAllDoctors));
      return;
    }
    final filter = searchAllDoctors
        .where(
          (e) => e.name?.toLowerCase().contains(query.toLowerCase()) ?? false,
        )
        .toList();
    emit(HomeState.success(filter));
  }
}
