unit ORD0001BView;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseRegister.View, cxGraphics,
   cxLookAndFeels,
   cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinDarkRoom,
   dxSkinDarkSide,
   dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, System.Actions,
   Vcl.ActnList, Vcl.StdCtrls,
   cxButtons, RzLabel, dxGDIPlusClasses, Vcl.ExtCtrls, RzPanel,
   Base.View.interf, Types.Controllers,
   cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxLabel,
   cxTextEdit,
   Service.Controller.interf, cxCurrencyEdit, ERGTextEdit;

type
   TFORD0001BView = class(TFBaseRegisterView, iBaseRegisterView)
      TxServiceId: TcxTextEdit;
      LbVehicleId: TcxLabel;
      LbStatus: TcxLabel;
      LbDescription: TcxLabel;
      TxCreatedDate: TcxTextEdit;
      LbCreatedAt: TcxLabel;
      TxUpdatedDate: TcxTextEdit;
      LbUpdatedAt: TcxLabel;
      cxLabel1: TcxLabel;
      TxPrice: TcxCurrencyEdit;
      cxLabel2: TcxLabel;
      CbPaymentType: TcxComboBox;
      CbStatus: TcxComboBox;
      TxDescription: TERGTextEdit;
      procedure FormCreate(Sender: TObject);
      procedure CbStatusPropertiesChange(Sender: TObject);
      procedure TxDescriptionPropertiesChange(Sender: TObject);
      procedure TxMeasuredUnitPropertiesChange(Sender: TObject);
      procedure TxPricePropertiesChange(Sender: TObject);
      procedure BtConfirmarClick(Sender: TObject);
      procedure CbPaymentTypePropertiesChange(Sender: TObject);
   private
      FServiceController: iServiceController;
   public
      class function New: iBaseRegisterView;

      function operation(AValue: TTypeOperation): iBaseRegisterView;
      function selectedRecord(AValue: string): iBaseRegisterView;

      procedure insertRecord;
      procedure updateRecord;
      procedure deleteRecord;
      procedure duplicateRecord;

      procedure save;
      procedure showDataOnScreen;
      procedure disableFields;

      procedure &end;
   end;

var
   FORD0001BView: TFORD0001BView;

implementation

{$R *.dfm}

uses Facade.Controller;
{ TFORD0001BView }

procedure TFORD0001BView.BtConfirmarClick(Sender: TObject);
begin
   if not(validate) then
      Exit;

   save;

   Close;
end;

procedure TFORD0001BView.CbPaymentTypePropertiesChange(Sender: TObject);
begin
   inherited;
   changeDataAnyFields;

   if CbPaymentType.ItemIndex = 2 then
   begin
      TxPrice.Value := 0;
      TxPrice.Enabled := False;
   end
   else
   begin
      TxPrice.Enabled := True;
   end;
end;

procedure TFORD0001BView.CbStatusPropertiesChange(Sender: TObject);
begin
   inherited;
   changeDataAnyFields;
end;

procedure TFORD0001BView.deleteRecord;
begin
   FServiceController.delete.save;
end;

procedure TFORD0001BView.disableFields;
begin
   CbStatus.Enabled := not(FOperation in [toShow, toDelete]);
   TxDescription.Enabled := not(FOperation in [toShow, toDelete]);
   CbPaymentType.Enabled := not(FOperation in [toShow, toDelete]);
   TxPrice.Enabled := not(FOperation in [toShow, toDelete]);

   TxPrice.Enabled := not(FOperation in [toShow, toDelete]);

   PnButtonConfirm.Visible := not(FOperation = toShow);
   BtConfirmar.Visible := not(FOperation = toShow);
end;

procedure TFORD0001BView.duplicateRecord;
begin
   FServiceController.duplicate.companyId(FSessionCompany)
     .description(TxDescription.Text).paymentType(CbPaymentType.ItemIndex)
     .price(TxPrice.Value).status(CbStatus.ItemIndex).userId(FSessionUser).save;
end;

procedure TFORD0001BView.&end;
begin
   { 1 } showDataOnScreen;
   { 2 } disableFields;
   { 3 } showCurrentOperation;

   ShowModal;
end;

procedure TFORD0001BView.FormCreate(Sender: TObject);
begin
   inherited;
   FServiceController := TFacadeController.New.ModulesFacadeController.
     OrderOfServiceFactoryController.serviceController;
end;

procedure TFORD0001BView.insertRecord;
begin
   FServiceController.insert.companyId(FSessionCompany)
     .description(TxDescription.Text).paymentType(CbPaymentType.ItemIndex)
     .price(TxPrice.Value).status(CbStatus.ItemIndex).userId(FSessionUser).save;
end;

class function TFORD0001BView.New: iBaseRegisterView;
begin
   Result := Self.Create(nil);
end;

function TFORD0001BView.operation(AValue: TTypeOperation): iBaseRegisterView;
begin
   Result := Self;
   FOperation := AValue;
end;

procedure TFORD0001BView.save;
begin
   case FOperation of
      toInsert:
         insertRecord;

      toUpdate:
         updateRecord;

      toDelete:
         deleteRecord;

      toDuplicate:
         duplicateRecord;
   end;
end;

function TFORD0001BView.selectedRecord(AValue: string): iBaseRegisterView;
begin
   Result := Self;
   FSelectedRecord := AValue;
end;

procedure TFORD0001BView.showDataOnScreen;
begin
   if (FOperation in [toInsert]) or (FSelectedRecord = EmptyStr) then
      Exit;

   FServiceController.find(FSelectedRecord);

   TxServiceId.Text := FServiceController.serviceId;
   TxDescription.Text := FServiceController.description;
   CbPaymentType.ItemIndex := FServiceController.paymentType;
   TxPrice.Value := FServiceController.price;

   TxCreatedDate.Text := FServiceController.createdAt;
   TxUpdatedDate.Text := FServiceController.updatedAt;

   if not(FOperation in [toDelete]) then
      BtConfirmar.Enabled := False;
end;

procedure TFORD0001BView.TxDescriptionPropertiesChange(Sender: TObject);
begin
   inherited;
   changeDataAnyFields;
end;

procedure TFORD0001BView.TxMeasuredUnitPropertiesChange(Sender: TObject);
begin
   inherited;
   changeDataAnyFields;
end;

procedure TFORD0001BView.TxPricePropertiesChange(Sender: TObject);
begin
   inherited;
   changeDataAnyFields;
end;

procedure TFORD0001BView.updateRecord;
begin
   FServiceController.update.companyId(FSessionCompany)
     .description(TxDescription.Text).paymentType(CbPaymentType.ItemIndex)
     .price(TxPrice.Value).status(CbStatus.ItemIndex).userId(FSessionUser).save;
end;

end.
