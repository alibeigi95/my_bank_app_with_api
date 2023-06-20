import 'package:get/get.dart';
import 'package:my_bank_app_network/src/infrastructure/routes/route_names.dart';
import '../../pages/add_record/commons/add_record_biding.dart';
import '../../pages/add_record/views/add_record.dart';
import '../../pages/edit_record/commons/edite_record_binding.dart';
import '../../pages/edit_record/views/edite_record.dart';
import '../../pages/login/commons/login_binding.dart';
import '../../pages/login/views/login.dart';
import '../../pages/my_bank_home/commons/my_bank_home_page_binding.dart';
import '../../pages/my_bank_home/views/home_page_records_list.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
      name: RouteName.loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: RouteName.myBankHomePage,
        page: () => const HomePageRecordsList(),
        binding: HomePageRecordListBinding(),
        children: [
          GetPage(
            name: RouteName.addBankRecord,
            page: () => const AddRecord(),
            binding: AddRecordBinding(),
          ),
          GetPage(
            name: RouteName.editBankRecord,
            page: () => const EditRecord(),
            binding: EditRecordBinding(),
          ),

        ]
    ),
  ];
}
