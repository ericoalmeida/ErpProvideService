unit MNG0001AView;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseList.View, cxGraphics,
   cxLookAndFeels,
   cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinDevExpressDarkStyle,
   dxSkinDevExpressStyle,
   cxControls, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData,
   cxDataStorage,
   cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog,
   Data.DB,
   cxDBData,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
   FireDAC.Stan.Error, FireDAC.DatS,
   FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
   FireDAC.Comp.Client, cxClasses,
   cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
   cxGridDBTableView, cxGrid,
   cxTextEdit, cxLabel, Vcl.StdCtrls, cxButtons, RzLabel, dxGDIPlusClasses,
   Vcl.ExtCtrls, RzPanel, ormbr.container.DataSet.interfaces,
   ormbr.container.fdmemtable,
   TMNGDISTRICT.Entity.Model, Base.View.interf, FireDAC.Stan.Async,
   FireDAC.DApt,
   dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinOffice2007Black,
   dxSkinOffice2007Blue,
   dxSkinOffice2007Green, dxSkinOffice2007Silver, dxSkinDarkRoom,
   dxSkinDarkSide, System.ImageList,
   Vcl.ImgList, cxImageList;

type
   TFMNG0001AView = class(TFBaseListView, iBaseListView)
      FdQDataCODE: TStringField;
      FdQDataCITYID: TStringField;
      FdQDataCITYNAME: TStringField;
      FdQDataCREATEDAT: TSQLTimeStampField;
      FdQDataUPDATEDAT: TSQLTimeStampField;
      FdQDataDISTRICTID: TIntegerField;
      FdQDataDESCRIPTION: TStringField;
      VwDadosDISTRICTID: TcxGridDBColumn;
      VwDadosDESCRIPTION: TcxGridDBColumn;
      VwDadosCITYNAME: TcxGridDBColumn;
      VwDadosCREATEDAT: TcxGridDBColumn;
      VwDadosUPDATEDAT: TcxGridDBColumn;
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure TxBuscarPropertiesChange(Sender: TObject);
      procedure BtInsertClick(Sender: TObject);
      procedure BtUpdateClick(Sender: TObject);
      procedure BtShowClick(Sender: TObject);
      procedure BtDeleteClick(Sender: TObject);
      procedure BtDuplicateClick(Sender: TObject);
   private

   public
      class function new: iBaseListView;

      procedure insertRecord;
      procedure updateRecord;
      procedure showRecord;
      procedure deleteRecord;
      procedure duplicateRecord;

      procedure listRecords;

      procedure &end;
   end;

var
   FMNG0001AView: TFMNG0001AView;

implementation

{$R *.dfm}

uses Facade.View, Types.Views;

procedure TFMNG0001AView.BtDeleteClick(Sender: TObject);
begin
   inherited;
   { 1 } deleteRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0001AView.BtDuplicateClick(Sender: TObject);
begin
   inherited;
   { 1 } duplicateRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0001AView.BtInsertClick(Sender: TObject);
begin
   inherited;
   { 1 } insertRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0001AView.BtShowClick(Sender: TObject);
begin
   inherited;
   { 1 } showRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0001AView.BtUpdateClick(Sender: TObject);
begin
   inherited;
   { 1 } updateRecord;
   { 2 } listRecords;
   { 3 } totalRecords;
   { 4 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0001AView.deleteRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0001BView).operation(FOperation)
     .selectedRecord(FdQDataCODE.AsString).&end;
end;

procedure TFMNG0001AView.duplicateRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0001BView).operation(FOperation)
     .selectedRecord(FdQDataCODE.AsString).&end;
end;

procedure TFMNG0001AView.&end;
begin

   show;
end;

procedure TFMNG0001AView.FormCreate(Sender: TObject);
begin
   inherited;
   FdQData.Connection := FFdConnection;
end;

procedure TFMNG0001AView.FormShow(Sender: TObject);
begin
   inherited;
   FFieldOrder := 'DESCRIPTION';

   { 1 } listRecords;
   { 2 } totalRecords;
   { 3 } disableButtonsWhenfdQDataEmpty;
end;

procedure TFMNG0001AView.insertRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0001BView).operation(FOperation).&end;
end;

procedure TFMNG0001AView.listRecords;
begin
   FdQData.Close;
   FdQData.Open();
end;

class function TFMNG0001AView.new: iBaseListView;
begin
   Result := Self.Create(nil);
end;

procedure TFMNG0001AView.showRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0001BView).operation(FOperation)
     .selectedRecord(FdQDataCODE.AsString).&end;
end;

procedure TFMNG0001AView.TxBuscarPropertiesChange(Sender: TObject);
begin
   inherited;

   filterRecords;
   totalRecords;
end;

procedure TFMNG0001AView.updateRecord;
begin
   TFacadeView.new.modulesFacadeView.ManagmentFactoryView.showProgramOfRegister
     (trMNG0001BView).operation(FOperation)
     .selectedRecord(FdQDataCODE.AsString).&end;
end;

end.
