unit Base.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, RzLabel, dxGDIPlusClasses;

type
  TFBaseView = class(TForm)
    PnContainer: TRzPanel;
    PnHeader: TRzPanel;
    PnProgram: TRzPanel;
    LbProgram: TRzLabel;
    ImTitle: TImage;
    LbTitle: TRzLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaseView: TFBaseView;

implementation

{$R *.dfm}

procedure TFBaseView.FormCreate(Sender: TObject);
begin
 LbProgram.Caption := Self.Name;
end;

end.
