program saadmin;

uses
  Vcl.Forms,
  Main.View in 'Views\Main.View.pas' {FMainView},
  Base.View in 'Views\Base\Base.View.pas' {FBaseView},
  BaseList.View in 'Views\Base\BaseList.View.pas' {FBaseListView},
  BaseRegister.View in 'Views\Base\BaseRegister.View.pas' {FBaseRegisterView},
  BaseMessage.View in 'Views\Base\BaseMessage.View.pas' {FBaseMessageView},
  BaseSearch.View in 'Views\Base\BaseSearch.View.pas' {FBaseSearchView},
  BaseReport.View in 'Views\Base\BaseReport.View.pas' {FBaseReportView},
  MSG0001.View in 'Views\Messages\MSG0001.View.pas' {FMSG0001View},
  MSG0002.View in 'Views\Messages\MSG0002.View.pas' {FMSG0002View},
  MSG0003.View in 'Views\Messages\MSG0003.View.pas' {FMSG0003View},
  MSG0004.View in 'Views\Messages\MSG0004.View.pas' {FMSG0004View},
  Types.Controllers in 'Controllers\Types\Types.Controllers.pas',
  Base.View.interf in 'Views\Base\Base.View.interf.pas',
  MessagesFactory.View.Interf in 'Views\Messages\MessagesFactory.View.Interf.pas',
  Types.Views in 'Views\Types\Types.Views.pas',
  MessagesFactory.View in 'Views\Messages\MessagesFactory.View.pas',
  Facade.View.interf in 'Views\Facade.View.interf.pas',
  Facade.View in 'Views\Facade.View.pas',
  Connection.Model.Interf in 'Models\Connection\Connection.Model.Interf.pas',
  DataMFirebird.Model in 'Models\Connection\Firebird\DataMFirebird.Model.pas' {FDataMFirebird: TDataModule},
  ConnectionFactory.Model.Interf in 'Models\Connection\ConnectionFactory.Model.Interf.pas',
  ConnectionFactory.Model in 'Models\Connection\ConnectionFactory.Model.pas',
  ConnectionSettings.Model.interf in 'Models\Settings\Connection\ConnectionSettings.Model.interf.pas',
  ConnectionSettings.Model in 'Models\Settings\Connection\ConnectionSettings.Model.pas',
  SettingsFactory.Model.interf in 'Models\Settings\SettingsFactory.Model.interf.pas',
  SettingsFactory.Model in 'Models\Settings\SettingsFactory.Model.pas',
  Facade.Model.Interf in 'Models\Facade.Model.Interf.pas',
  Facade.Model in 'Models\Facade.Model.pas',
  Types.Models in 'Models\Types\Types.Models.pas',
  Connection.Controller.interf in 'Controllers\Connection\Connection.Controller.interf.pas',
  Connection.Controller in 'Controllers\Connection\Connection.Controller.pas',
  Facade.Controller.Interf in 'Controllers\Facade.Controller.Interf.pas',
  Facade.Controller in 'Controllers\Facade.Controller.pas',
  TMNGDISTRICT.Entity.Model in 'Models\Modules\Managment\Districts\Entity\TMNGDISTRICT.Entity.Model.pas',
  Districts.Model.Interf in 'Models\Modules\Managment\Districts\Districts.Model.Interf.pas',
  Districts.Model in 'Models\Modules\Managment\Districts\Districts.Model.pas',
  ManagmentFactory.Model.Interf in 'Models\Modules\Managment\ManagmentFactory.Model.Interf.pas',
  ManagmentFactory.Model in 'Models\Modules\Managment\ManagmentFactory.Model.pas',
  ModulesFacade.Model.Interf in 'Models\Modules\ModulesFacade.Model.Interf.pas',
  ModulesFacade.Model in 'Models\Modules\ModulesFacade.Model.pas',
  District.Controller.Interf in 'Controllers\Modules\Managment\District\District.Controller.Interf.pas',
  District.Controller in 'Controllers\Modules\Managment\District\District.Controller.pas',
  DistrictInsert.Controller in 'Controllers\Modules\Managment\District\Operations\DistrictInsert.Controller.pas',
  ManagmentFactory.Controller.interf in 'Controllers\Modules\Managment\ManagmentFactory.Controller.interf.pas',
  ManagmentFactory.Controller in 'Controllers\Modules\Managment\ManagmentFactory.Controller.pas',
  ModulesFacade.Controller.interf in 'Controllers\Modules\ModulesFacade.Controller.interf.pas',
  ModulesFacade.Controller in 'Controllers\Modules\ModulesFacade.Controller.pas',
  MNG0001AView in 'Views\Modules\Managment\District\MNG0001AView.pas' {FMNG0001AView},
  ManagmentFactory.View.Interf in 'Views\Modules\Managment\ManagmentFactory.View.Interf.pas',
  ManagmentFactory.View in 'Views\Modules\Managment\ManagmentFactory.View.pas',
  ModulesFacade.View.Interf in 'Views\Modules\ModulesFacade.View.Interf.pas',
  ModulesFacade.View in 'Views\Modules\ModulesFacade.View.pas',
  MNG0001BView in 'Views\Modules\Managment\District\MNG0001BView.pas' {FMNG0001BView},
  DistrictUpdate.Controller in 'Controllers\Modules\Managment\District\Operations\DistrictUpdate.Controller.pas',
  DistrictDelete.Controller in 'Controllers\Modules\Managment\District\Operations\DistrictDelete.Controller.pas',
  DistrictDuplicate.Controller in 'Controllers\Modules\Managment\District\Operations\DistrictDuplicate.Controller.pas',
  TMNGCOUNTRY.Entity.Model in 'Models\Modules\Managment\Country\Entity\TMNGCOUNTRY.Entity.Model.pas',
  Country.Model.Interf in 'Models\Modules\Managment\Country\Country.Model.Interf.pas',
  Country.Model in 'Models\Modules\Managment\Country\Country.Model.pas',
  Country.Controller.Interf in 'Controllers\Modules\Managment\Country\Country.Controller.Interf.pas',
  Country.Controller in 'Controllers\Modules\Managment\Country\Country.Controller.pas',
  CountryInsert.Controller in 'Controllers\Modules\Managment\Country\Operations\CountryInsert.Controller.pas',
  MNG0002AView in 'Views\Modules\Managment\Country\MNG0002AView.pas' {FMNG0002AView},
  MNG0002BView in 'Views\Modules\Managment\Country\MNG0002BView.pas' {FMNG0002BView},
  MNG0003AView in 'Views\Modules\Managment\State\MNG0003AView.pas' {FMNG0003AView},
  CountryUpdate.Controller in 'Controllers\Modules\Managment\Country\Operations\CountryUpdate.Controller.pas',
  CountryDelete.Controller in 'Controllers\Modules\Managment\Country\Operations\CountryDelete.Controller.pas',
  CountryDuplicate.Controller in 'Controllers\Modules\Managment\Country\Operations\CountryDuplicate.Controller.pas',
  TMNGSTATE.Entity.Model in 'Models\Modules\Managment\State\Entity\TMNGSTATE.Entity.Model.pas',
  State.Model.Interf in 'Models\Modules\Managment\State\State.Model.Interf.pas',
  State.Model in 'Models\Modules\Managment\State\State.Model.pas',
  State.Controller.Interf in 'Controllers\Modules\Managment\State\State.Controller.Interf.pas',
  State.Controller in 'Controllers\Modules\Managment\State\State.Controller.pas',
  StateInsert.Controller in 'Controllers\Modules\Managment\State\Operations\StateInsert.Controller.pas',
  StateUpdate.Controller in 'Controllers\Modules\Managment\State\Operations\StateUpdate.Controller.pas',
  StateDelete.Controller in 'Controllers\Modules\Managment\State\Operations\StateDelete.Controller.pas',
  StateDuplicate.Controller in 'Controllers\Modules\Managment\State\Operations\StateDuplicate.Controller.pas',
  MNG0003BView in 'Views\Modules\Managment\State\MNG0003BView.pas' {FMNG0003BView},
  MNG0002CView in 'Views\Modules\Managment\Country\MNG0002CView.pas' {FMNG0002CView},
  TMNGCITY.Entity.Model in 'Models\Modules\Managment\City\Entity\TMNGCITY.Entity.Model.pas',
  City.Model.Interf in 'Models\Modules\Managment\City\City.Model.Interf.pas',
  City.Model in 'Models\Modules\Managment\City\City.Model.pas',
  City.Controller.Interf in 'Controllers\Modules\Managment\City\City.Controller.Interf.pas',
  City.Controller in 'Controllers\Modules\Managment\City\City.Controller.pas',
  CityInsert.Controller in 'Controllers\Modules\Managment\City\Operations\CityInsert.Controller.pas',
  CityUpdate.Controller in 'Controllers\Modules\Managment\City\Operations\CityUpdate.Controller.pas',
  CityDelete.Controller in 'Controllers\Modules\Managment\City\Operations\CityDelete.Controller.pas',
  CityDuplicate.Controller in 'Controllers\Modules\Managment\City\Operations\CityDuplicate.Controller.pas',
  Utils.Controller.Interf in 'Controllers\Utils\Utils.Controller.Interf.pas',
  Utils.Controller in 'Controllers\Utils\Utils.Controller.pas',
  Constants.Controller in 'Controllers\Utils\Constants.Controller.pas',
  REC0001AView in 'Views\Modules\Receive\Client\REC0001AView.pas' {FREC0001AView},
  MNG0004AView in 'Views\Modules\Managment\City\MNG0004AView.pas' {FMNG0004AView},
  MNG0004BView in 'Views\Modules\Managment\City\MNG0004BView.pas' {FMNG0004BView},
  MNG0003CView in 'Views\Modules\Managment\State\MNG0003CView.pas' {FMNG0003CView},
  MNG0004CView in 'Views\Modules\Managment\City\MNG0004CView.pas' {FMNG0004CView},
  TMNGCOMPANY.Entity.Model in 'Models\Modules\Managment\Company\Entity\TMNGCOMPANY.Entity.Model.pas',
  Company.Model.Interf in 'Models\Modules\Managment\Company\Company.Model.Interf.pas',
  Company.Model in 'Models\Modules\Managment\Company\Company.Model.pas',
  Company.Controller.Interf in 'Controllers\Modules\Managment\Company\Company.Controller.Interf.pas',
  Company.Controller in 'Controllers\Modules\Managment\Company\Company.Controller.pas',
  CompanyInsert.Controller in 'Controllers\Modules\Managment\Company\Operations\CompanyInsert.Controller.pas',
  CompanyUpdate.Controller in 'Controllers\Modules\Managment\Company\Operations\CompanyUpdate.Controller.pas',
  CompanyDelete.Controller in 'Controllers\Modules\Managment\Company\Operations\CompanyDelete.Controller.pas',
  CompanyDuplicate.Controller in 'Controllers\Modules\Managment\Company\Operations\CompanyDuplicate.Controller.pas',
  MNG0005AView in 'Views\Modules\Managment\Company\MNG0005AView.pas' {FMNG0005AView},
  MNG0005BView in 'Views\Modules\Managment\Company\MNG0005BView.pas' {FMNG0005BView},
  MNG0001CView in 'Views\Modules\Managment\District\MNG0001CView.pas' {FMNG0001CView},
  BCrypt.Controller in 'Controllers\Utils\BCrypt.Controller.pas',
  TMNGUSER.Entity.Model in 'Models\Modules\Managment\User\Entity\TMNGUSER.Entity.Model.pas',
  User.Model.Interf in 'Models\Modules\Managment\User\User.Model.Interf.pas',
  User.Model in 'Models\Modules\Managment\User\User.Model.pas',
  User.Controller.Interf in 'Controllers\Modules\Managment\User\User.Controller.Interf.pas',
  User.Controller in 'Controllers\Modules\Managment\User\User.Controller.pas',
  UserInsert.Controller in 'Controllers\Modules\Managment\User\Operations\UserInsert.Controller.pas',
  UserUpdate.Controller in 'Controllers\Modules\Managment\User\Operations\UserUpdate.Controller.pas',
  UserDelete.Controller in 'Controllers\Modules\Managment\User\Operations\UserDelete.Controller.pas',
  UserDuplicate.Controller in 'Controllers\Modules\Managment\User\Operations\UserDuplicate.Controller.pas',
  MNG0006AView in 'Views\Modules\Managment\User\MNG0006AView.pas' {FMNG0006AView},
  MNG0006BView in 'Views\Modules\Managment\User\MNG0006BView.pas' {FMNG0006BView},
  MSG0005.View in 'Views\Messages\MSG0005.View.pas' {FMSG0005View},
  TASSTYPEEXPENSE.Entity.Model in 'Models\Modules\Assets\TypeExpense\Entity\TASSTYPEEXPENSE.Entity.Model.pas',
  TypeExpense.Model.Interf in 'Models\Modules\Assets\TypeExpense\TypeExpense.Model.Interf.pas',
  TypeExpense.Model in 'Models\Modules\Assets\TypeExpense\TypeExpense.Model.pas',
  AssetsFactory.Model.Interf in 'Models\Modules\Assets\AssetsFactory.Model.Interf.pas',
  AssetsFactory.Model in 'Models\Modules\Assets\AssetsFactory.Model.pas',
  AssetsFactory.Controller.interf in 'Controllers\Modules\Assets\AssetsFactory.Controller.interf.pas',
  AssetsFactory.Controller in 'Controllers\Modules\Assets\AssetsFactory.Controller.pas',
  TypeExpense.Controller.Interf in 'Controllers\Modules\Assets\TypeExpense\TypeExpense.Controller.Interf.pas',
  TypeExpenseInsert.Controller in 'Controllers\Modules\Assets\TypeExpense\Operations\TypeExpenseInsert.Controller.pas',
  TypeExpenseUpdate.Controller in 'Controllers\Modules\Assets\TypeExpense\Operations\TypeExpenseUpdate.Controller.pas',
  TypeExpenseDelete.Controller in 'Controllers\Modules\Assets\TypeExpense\Operations\TypeExpenseDelete.Controller.pas',
  TypeExpenseDuplicate.Controller in 'Controllers\Modules\Assets\TypeExpense\Operations\TypeExpenseDuplicate.Controller.pas',
  TypeExpense.Controller in 'Controllers\Modules\Assets\TypeExpense\TypeExpense.Controller.pas',
  ASS0001AView in 'Views\Modules\Assets\TypeExpense\ASS0001AView.pas' {FASS0001AView},
  AssetsFactory.View.Interf in 'Views\Modules\Assets\AssetsFactory.View.Interf.pas',
  AssetsFactory.View in 'Views\Modules\Assets\AssetsFactory.View.pas',
  ASS0001BView in 'Views\Modules\Assets\TypeExpense\ASS0001BView.pas' {FASS0001BView},
  TASSVEHICLE.Entity.Model in 'Models\Modules\Assets\Vehicle\Entity\TASSVEHICLE.Entity.Model.pas',
  Vehicle.Model.Interf in 'Models\Modules\Assets\Vehicle\Vehicle.Model.Interf.pas',
  Vehicle.Model in 'Models\Modules\Assets\Vehicle\Vehicle.Model.pas',
  Vehicle.Controller.Interf in 'Controllers\Modules\Assets\Vehicle\Vehicle.Controller.Interf.pas',
  VehicleInsert.Controller in 'Controllers\Modules\Assets\Vehicle\Operations\VehicleInsert.Controller.pas',
  VehicleUpdate.Controller in 'Controllers\Modules\Assets\Vehicle\Operations\VehicleUpdate.Controller.pas',
  VehicleDelete.Controller in 'Controllers\Modules\Assets\Vehicle\Operations\VehicleDelete.Controller.pas',
  VehicleDuplicate.Controller in 'Controllers\Modules\Assets\Vehicle\Operations\VehicleDuplicate.Controller.pas',
  Vehicle.Controller in 'Controllers\Modules\Assets\Vehicle\Vehicle.Controller.pas',
  ASS0002AView in 'Views\Modules\Assets\Vehicle\ASS0002AView.pas' {FASS0002AView},
  ASS0002BView in 'Views\Modules\Assets\Vehicle\ASS0002BView.pas' {FASS0002BView},
  TORDSERVICE.Entity.Model in 'Models\Modules\OrderOfService\Service\Entity\TORDSERVICE.Entity.Model.pas',
  Service.Model.Interf in 'Models\Modules\OrderOfService\Service\Service.Model.Interf.pas',
  Service.Model in 'Models\Modules\OrderOfService\Service\Service.Model.pas',
  OrderOfServiceFactory.Model.Interf in 'Models\Modules\OrderOfService\OrderOfServiceFactory.Model.Interf.pas',
  OrderOfServiceFactory.Model in 'Models\Modules\OrderOfService\OrderOfServiceFactory.Model.pas',
  Service.Controller.Interf in 'Controllers\Modules\OrderOfService\Service\Service.Controller.Interf.pas',
  OrderOfServiceFactory.Controller.Interf in 'Controllers\Modules\OrderOfService\OrderOfServiceFactory.Controller.Interf.pas',
  OrderOfServiceFactory.Controller in 'Controllers\Modules\OrderOfService\OrderOfServiceFactory.Controller.pas',
  ServiceInsert.Controller in 'Controllers\Modules\OrderOfService\Service\Operations\ServiceInsert.Controller.pas',
  ServiceDuplicate.Controller in 'Controllers\Modules\OrderOfService\Service\Operations\ServiceDuplicate.Controller.pas',
  ServiceUpdate.Controller in 'Controllers\Modules\OrderOfService\Service\Operations\ServiceUpdate.Controller.pas',
  ServiceDelete.Controller in 'Controllers\Modules\OrderOfService\Service\Operations\ServiceDelete.Controller.pas',
  Service.Controller in 'Controllers\Modules\OrderOfService\Service\Service.Controller.pas',
  ORD0001AView in 'Views\Modules\OrderOfService\Service\ORD0001AView.pas' {FORD0001AView},
  OrderOfServiceFactory.View.Interf in 'Views\Modules\OrderOfService\OrderOfServiceFactory.View.Interf.pas',
  OrderOfServiceFactory.View in 'Views\Modules\OrderOfService\OrderOfServiceFactory.View.pas',
  ORD0001BView in 'Views\Modules\OrderOfService\Service\ORD0001BView.pas' {FORD0001BView},
  TSTOSINAPIPRODUCT.Entity.Model in 'Models\Modules\Stock\SinapiProduct\Entity\TSTOSINAPIPRODUCT.Entity.Model.pas',
  SinapiProduct.Model.Interf in 'Models\Modules\Stock\SinapiProduct\SinapiProduct.Model.Interf.pas',
  SinapiProduct.Model in 'Models\Modules\Stock\SinapiProduct\SinapiProduct.Model.pas',
  StockFactory.Model.Interf in 'Models\Modules\Stock\StockFactory.Model.Interf.pas',
  StockFactory.Model in 'Models\Modules\Stock\StockFactory.Model.pas',
  SinapiProduct.Controller.interf in 'Controllers\Modules\Stock\SinapiProduct\SinapiProduct.Controller.interf.pas',
  SinapiProductInsert.Controller in 'Controllers\Modules\Stock\SinapiProduct\Operations\SinapiProductInsert.Controller.pas',
  SinapiProductUpdate.Controller in 'Controllers\Modules\Stock\SinapiProduct\Operations\SinapiProductUpdate.Controller.pas',
  SinapiProductDelete.Controller in 'Controllers\Modules\Stock\SinapiProduct\Operations\SinapiProductDelete.Controller.pas',
  SinapiProductDuplicate.Controller in 'Controllers\Modules\Stock\SinapiProduct\Operations\SinapiProductDuplicate.Controller.pas',
  SinapiProduct.Controller in 'Controllers\Modules\Stock\SinapiProduct\SinapiProduct.Controller.pas',
  StockFactory.Controller.Interf in 'Controllers\Modules\Stock\StockFactory.Controller.Interf.pas',
  StockFactory.Controller in 'Controllers\Modules\Stock\StockFactory.Controller.pas',
  STO0001AView in 'Views\Modules\Stock\SinapiProduct\STO0001AView.pas' {FSTO0001AView},
  StockFactory.View.Interf in 'Views\Modules\Stock\StockFactory.View.Interf.pas',
  StockFactory.View in 'Views\Modules\Stock\StockFactory.View.pas',
  STO0001BView in 'Views\Modules\Stock\SinapiProduct\STO0001BView.pas' {FSTO0001BView},
  ImportSinapiProduct.Controller.interf in 'Controllers\Modules\Stock\ImportProduct\ImportSinapiProduct.Controller.interf.pas',
  ImportSinapiProductOperation.Controller in 'Controllers\Modules\Stock\ImportProduct\Operation\ImportSinapiProductOperation.Controller.pas',
  ImportSinapiProduct.Controller in 'Controllers\Modules\Stock\ImportProduct\ImportSinapiProduct.Controller.pas',
  STO0001CView in 'Views\Modules\Stock\SinapiProduct\STO0001CView.pas' {FSTO0001CView},
  TMNGPERSON.Entity.Model in 'Models\Modules\Managment\Person\Entity\TMNGPERSON.Entity.Model.pas',
  Person.Model.Interf in 'Models\Modules\Managment\Person\Person.Model.Interf.pas',
  Person.Model in 'Models\Modules\Managment\Person\Person.Model.pas',
  Person.Controller.Interf in 'Controllers\Modules\Managment\Person\Person.Controller.Interf.pas',
  PersonUpdate.Controller in 'Controllers\Modules\Managment\Person\Operations\PersonUpdate.Controller.pas',
  PersonDelete.Controller in 'Controllers\Modules\Managment\Person\Operations\PersonDelete.Controller.pas',
  PersonDuplicate.Controller in 'Controllers\Modules\Managment\Person\Operations\PersonDuplicate.Controller.pas',
  PersonInsert.Controller in 'Controllers\Modules\Managment\Person\Operations\PersonInsert.Controller.pas',
  Person.Controller in 'Controllers\Modules\Managment\Person\Person.Controller.pas',
  PAY0001AView in 'Views\Modules\Pay\Provider\PAY0001AView.pas' {FPAY0001AView},
  PayFactory.View.Interf in 'Views\Modules\Pay\PayFactory.View.Interf.pas',
  PayFactory.View in 'Views\Modules\Pay\PayFactory.View.pas',
  ReceiveFactory.View.Interf in 'Views\Modules\Receive\ReceiveFactory.View.Interf.pas',
  ReceiveFactory.View in 'Views\Modules\Receive\ReceiveFactory.View.pas',
  REC0001BView in 'Views\Modules\Receive\Client\REC0001BView.pas' {FREC0001BView},
  PAY0001BView in 'Views\Modules\Pay\Provider\PAY0001BView.pas' {FPAY0001BView},
  TORDOPERATOR.Entity.Model in 'Models\Modules\OrderOfService\Operator\Entity\TORDOPERATOR.Entity.Model.pas',
  Operators.Model.Interf in 'Models\Modules\OrderOfService\Operator\Operators.Model.Interf.pas',
  Operators.Model in 'Models\Modules\OrderOfService\Operator\Operators.Model.pas',
  Operators.Controller.Interf in 'Controllers\Modules\OrderOfService\Operator\Operators.Controller.Interf.pas',
  OperatorsInsert.Controller in 'Controllers\Modules\OrderOfService\Operator\Operations\OperatorsInsert.Controller.pas',
  OperatorsUpdate.Controller in 'Controllers\Modules\OrderOfService\Operator\Operations\OperatorsUpdate.Controller.pas',
  OperatorsDelete.Controller in 'Controllers\Modules\OrderOfService\Operator\Operations\OperatorsDelete.Controller.pas',
  OperatorsDuplicate.Controller in 'Controllers\Modules\OrderOfService\Operator\Operations\OperatorsDuplicate.Controller.pas',
  Operators.Controller in 'Controllers\Modules\OrderOfService\Operator\Operators.Controller.pas',
  ORD0002AView in 'Views\Modules\OrderOfService\Operator\ORD0002AView.pas' {FORD0002AView},
  ORD0002BView in 'Views\Modules\OrderOfService\Operator\ORD0002BView.pas' {FORD0002BView},
  ServiceProvided.Model.Interf in 'Models\Modules\OrderOfService\ServiceProvided\ServiceProvided.Model.Interf.pas',
  ServiceProvided.Model in 'Models\Modules\OrderOfService\ServiceProvided\ServiceProvided.Model.pas',
  ServiceProvided.Controller.Interf in 'Controllers\Modules\OrderOfService\ServiceProvided\ServiceProvided.Controller.Interf.pas',
  ServiceProvidedInsert.Controller in 'Controllers\Modules\OrderOfService\ServiceProvided\Operations\ServiceProvidedInsert.Controller.pas',
  ServiceProvidedDuplicate.Controller in 'Controllers\Modules\OrderOfService\ServiceProvided\Operations\ServiceProvidedDuplicate.Controller.pas',
  ServiceProvidedDelete.Controller in 'Controllers\Modules\OrderOfService\ServiceProvided\Operations\ServiceProvidedDelete.Controller.pas',
  ServiceProvidedUpdate.Controller in 'Controllers\Modules\OrderOfService\ServiceProvided\Operations\ServiceProvidedUpdate.Controller.pas',
  ServiceProvided.Controller in 'Controllers\Modules\OrderOfService\ServiceProvided\ServiceProvided.Controller.pas',
  ORD0003AView in 'Views\Modules\OrderOfService\ServiceProvided\ORD0003AView.pas' {FORD0003AView},
  ORD0003BView in 'Views\Modules\OrderOfService\ServiceProvided\ORD0003BView.pas' {FORD0003BView},
  TORDSERVICESPROVIDED.Entity.Model in 'Models\Modules\OrderOfService\ServiceProvided\Entity\TORDSERVICESPROVIDED.Entity.Model.pas',
  REC0001CView in 'Views\Modules\Receive\Client\REC0001CView.pas' {FREC0001CView},
  PAY0001CView in 'Views\Modules\Pay\Provider\PAY0001CView.pas' {FPAY0001CView},
  ORD0002CView in 'Views\Modules\OrderOfService\Operator\ORD0002CView.pas' {FORD0002CView},
  ASS0002CView in 'Views\Modules\Assets\Vehicle\ASS0002CView.pas' {FASS0002CView},
  ORD0001CView in 'Views\Modules\OrderOfService\Service\ORD0001CView.pas' {FORD0001CView},
  ORD0003DView in 'Views\Modules\OrderOfService\ServiceProvided\ORD0003DView.pas' {FORD0003DView},
  BaseReportWindow.View in 'Views\Base\BaseReportWindow.View.pas' {FBaseReportWindowView},
  BaseReport.View.interf in 'Views\Base\BaseReport.View.interf.pas',
  TORDBUDGET.Entity.Model in 'Models\Modules\OrderOfService\Budget\Entity\TORDBUDGET.Entity.Model.pas',
  Budget.Model.Interf in 'Models\Modules\OrderOfService\Budget\Budget.Model.Interf.pas',
  Budget.Model in 'Models\Modules\OrderOfService\Budget\Budget.Model.pas',
  Budget.Controller.Interf in 'Controllers\Modules\OrderOfService\Budget\Budget.Controller.Interf.pas',
  Budget.Controller in 'Controllers\Modules\OrderOfService\Budget\Budget.Controller.pas',
  BudgetInsert.Controller in 'Controllers\Modules\OrderOfService\Budget\Operations\BudgetInsert.Controller.pas',
  BudgetUpdate.Controller in 'Controllers\Modules\OrderOfService\Budget\Operations\BudgetUpdate.Controller.pas',
  BudgetDelete.Controller in 'Controllers\Modules\OrderOfService\Budget\Operations\BudgetDelete.Controller.pas',
  BudgetDuplicate.Controller in 'Controllers\Modules\OrderOfService\Budget\Operations\BudgetDuplicate.Controller.pas',
  BDG0001AView in 'Views\Modules\OrderOfService\Budget\BDG0001AView.pas' {FBDG0001AView},
  BDG0001BView in 'Views\Modules\OrderOfService\Budget\BDG0001BView.pas' {FBDG0001BView},
  STO0001DView in 'Views\Modules\Stock\SinapiProduct\STO0001DView.pas' {FSTO0001DView},
  BudgetProviders.Model.Interf in 'Models\Modules\OrderOfService\BudgetProviders\BudgetProviders.Model.Interf.pas',
  TORDBUDGETPROVIDERS.Entity.Model in 'Models\Modules\OrderOfService\BudgetProviders\Entity\TORDBUDGETPROVIDERS.Entity.Model.pas',
  BudgetProviders.Model in 'Models\Modules\OrderOfService\BudgetProviders\BudgetProviders.Model.pas',
  BudgetProviders.Controller.Interf in 'Controllers\Modules\OrderOfService\BudgetProviders\BudgetProviders.Controller.Interf.pas',
  BudgetProviders.Controller in 'Controllers\Modules\OrderOfService\BudgetProviders\BudgetProviders.Controller.pas',
  BudgetProvidersInsert.Controller in 'Controllers\Modules\OrderOfService\BudgetProviders\Operations\BudgetProvidersInsert.Controller.pas',
  BudgetProducts.Model.Interf in 'Models\Modules\OrderOfService\BudgetProducts\BudgetProducts.Model.Interf.pas',
  TORDBUDGETPRODUCTS.Entity.Model in 'Models\Modules\OrderOfService\BudgetProducts\Entity\TORDBUDGETPRODUCTS.Entity.Model.pas',
  BudgetProducts.Model in 'Models\Modules\OrderOfService\BudgetProducts\BudgetProducts.Model.pas',
  BudgetProducts.Controller.Interf in 'Controllers\Modules\OrderOfService\BudgetProducts\BudgetProducts.Controller.Interf.pas',
  BudgetProducts.Controller in 'Controllers\Modules\OrderOfService\BudgetProducts\BudgetProducts.Controller.pas',
  BudgetProductsInsert.Controller in 'Controllers\Modules\OrderOfService\BudgetProducts\Operations\BudgetProductsInsert.Controller.pas',
  TORDBUDGETANALYZES.Entity.Model in 'Models\Modules\OrderOfService\BudgetAnalyzes\Entity\TORDBUDGETANALYZES.Entity.Model.pas',
  BudgetAnalyzes.Model.Interf in 'Models\Modules\OrderOfService\BudgetAnalyzes\BudgetAnalyzes.Model.Interf.pas',
  BudgetAnalyzes.Model in 'Models\Modules\OrderOfService\BudgetAnalyzes\BudgetAnalyzes.Model.pas',
  BDG0002AView in 'Views\Modules\OrderOfService\Budget\BDG0002AView.pas' {FBDG0002AView},
  BDG0001FView in 'Views\Modules\OrderOfService\Budget\BDG0001FView.pas' {FBDG0002FView},
  BDG0001IView in 'Views\Modules\OrderOfService\Budget\BDG0001IView.pas' {FBDG0001IView};

{$R *.res}

begin
   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   Application.CreateForm(TFMainView, FMainView);
  Application.CreateForm(TFBDG0001IView, FBDG0001IView);
  Application.Run;

end.
