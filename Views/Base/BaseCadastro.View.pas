unit BaseCadastro.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.View, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  Vcl.StdCtrls, cxButtons, RzLabel, dxGDIPlusClasses, Vcl.ExtCtrls, RzPanel;

type
  TFBaseCadastroView = class(TFBaseView)
    BtConfirmar: TcxButton;
    PnContent: TRzPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaseCadastroView: TFBaseCadastroView;

implementation

{$R *.dfm}

end.
