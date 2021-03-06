unit ManagmentFactory.Controller;

interface

uses ManagmentFactory.Controller.interf, District.Controller.interf,
   Country.Controller.interf, State.Controller.interf, City.Controller.interf,
   Company.Controller.interf, User.Controller.interf, Person.Controller.interf;

type
   TManagmentFactoryController = class(TInterfacedObject,
     iManagmentFactoryController)
   private
   public
      constructor Create;
      destructor Destroy; override;

      class function New: iManagmentFactoryController;

      function districtController: iDistrictController;
      function countryController: iCountryController;
      function stateController: iStateController;
      function cityController: iCityController;
      function companyController: iCompanyController;
      function userController: iUserController;
      function personController: iPersonController;
   end;

implementation

{ TManagmentFactoryController }

uses District.Controller, Country.Controller, State.Controller, City.Controller,
   Company.Controller, User.Controller, Person.Controller;

function TManagmentFactoryController.cityController: iCityController;
begin
   Result := TCityController.New;
end;

function TManagmentFactoryController.companyController: iCompanyController;
begin
   Result := TCompanyController.New;
end;

function TManagmentFactoryController.countryController: iCountryController;
begin
   Result := TCountryController.New;
end;

constructor TManagmentFactoryController.Create;
begin

end;

destructor TManagmentFactoryController.Destroy;
begin

   inherited;
end;

function TManagmentFactoryController.districtController: iDistrictController;
begin
   Result := TDistrictController.New;
end;

class function TManagmentFactoryController.New: iManagmentFactoryController;
begin
   Result := Self.Create;
end;

function TManagmentFactoryController.personController: iPersonController;
begin
   Result := TPersonController.New;
end;

function TManagmentFactoryController.stateController: iStateController;
begin
   Result := TStateController.New;
end;

function TManagmentFactoryController.userController: iUserController;
begin
   Result := TUserController.New;
end;

end.
