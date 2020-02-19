unit State.Model;

interface

uses State.Model.Interf, ormbr.container.objectset.interfaces,
  ormbr.Factory.interfaces, TGERESTADO.Entity.Model;

type
  TStateModel = class(TInterfacedObject, IStateModel)
  private
    FConnection: IDBConnection;
    FEntity: TTMNGSTATE;
    FDAO: IContainerObjectSet<TTMNGSTATE>;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: IStateModel;

    function Entity: TTMNGSTATE; overload;
    function Entity(AValue: TTMNGSTATE): IStateModel; overload;

    function DAO: IContainerObjectSet<TTMNGSTATE>;
  end;

implementation

{ TStateModel }

uses Facade.Controller, ormbr.container.objectset;

constructor TStateModel.Create;
begin
   FConnection := TFacadeController.New.ConnectionFactoryController.currentConnection;
   FDao :=  TContainerObjectSet<TTMNGSTATE>.Create(FConnection, 1);
end;

function TStateModel.DAO: IContainerObjectSet<TTMNGSTATE>;
begin
  result := FDAO;
end;

destructor TStateModel.Destroy;
begin

  inherited;
end;

function TStateModel.Entity: TTMNGSTATE;
begin
  Result := FEntity;
end;

function TStateModel.Entity(AValue: TTMNGSTATE): IStateModel;
begin
  Result := Self;
  FEntity := AValue;
end;

class function TStateModel.New: IStateModel;
begin
  Result := Self.Create;
end;

end.
