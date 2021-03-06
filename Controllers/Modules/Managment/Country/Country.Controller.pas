unit Country.Controller;

interface

uses Country.Controller.Interf, Country.Model.Interf, TMNGCOUNTRY.Entity.Model,
   System.SysUtils;

type
   TCountryController = class(TInterfacedObject, iCountryController)
   private
      FCountryModel: ICountryModel;
      FRecordFound: TTMNGCOUNTRY;
   public
      constructor Create;
      destructor Destroy; override;

      class function New: iCountryController;

      function find(AValue: string): iCountryController;
      function findById(AValue: string): iCountryController;

      function insert: iCountryInsertController;
      function update: iCountryUpdateController;
      function delete: iCountryDeleteController;
      function duplicate: iCountryDuplicateController;

      function codigo: string;
      function countryId: string;
      function description: string;
      function createdDate: string;
      function updatedDate: string;
   end;

implementation

{ TCountryController }

uses Facade.Model, CountryInsert.Controller, CountryUpdate.Controller,
   CountryDelete.Controller, CountryDuplicate.Controller;

constructor TCountryController.Create;
begin
   FCountryModel := TFacadeModel.New.moduleFacade.managmentFactoryModel.
     countryModel;
end;

function TCountryController.createdDate: string;
begin
   Result := DateTimeToStr(FRecordFound.CREATEDAT);
end;

function TCountryController.delete: iCountryDeleteController;
begin
   Result := TCountryDeleteController.New.countryModel(FCountryModel)
     .selectedRecord(FRecordFound);
end;

function TCountryController.description: string;
begin
   Result := FRecordFound.NAME;
end;

destructor TCountryController.Destroy;
begin

   inherited;
end;

function TCountryController.duplicate: iCountryDuplicateController;
begin
   Result := TCountryDuplicateController.New.countryModel(FCountryModel);
end;

function TCountryController.insert: iCountryInsertController;
begin
   Result := TCountryInsertController.New.countryModel(FCountryModel);
end;

class function TCountryController.New: iCountryController;
begin
   Result := Self.Create;
end;

function TCountryController.codigo: string;
begin
   Result := FRecordFound.CODE;
end;

function TCountryController.countryId: string;
begin
   Result := FRecordFound.countryId.ToString;
end;

function TCountryController.find(AValue: string): iCountryController;
begin
   Result := Self;

   if AValue = EmptyStr then
      Exit;

   FRecordFound := FCountryModel.DAO.FindWhere
     (Format('CODE = %s', [QuotedStr(AValue)])).Items[0];
end;

function TCountryController.findById(AValue: string): iCountryController;
begin
   Result := Self;

   if AValue = EmptyStr then
      Exit;

   FRecordFound := FCountryModel.DAO.FindWhere(Format('COUNTRYID = %d',
     [StrToInt(AValue)])).Items[0];
end;

function TCountryController.update: iCountryUpdateController;
begin
   Result := TCountryUpdateController.New.countryModel(FCountryModel)
     .selectedRecord(FRecordFound);
end;

function TCountryController.updatedDate: string;
begin
   Result := DateTimeToStr(FRecordFound.UPDATEDAT);
end;

end.
