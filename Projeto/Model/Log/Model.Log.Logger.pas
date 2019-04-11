unit Model.Log.Logger;

interface

type
  TLog = class
  private
    // vari�vel que aponta para o arquivo de log
    ArquivoLog: TextFile;

    // o construtor � declarado como privado
    // pois o m�todo principal � "ObterInstancia"
    constructor Create;
  public
    // m�todo principal do Singleton
    class function ObterInstancia: TLog;

    // m�todo chamado pelo "Create" indiretamente
    class function NewInstance: TObject; override;

    // m�todo para registrar o texto do par�metro no arquivo de log
    procedure RegistrarLog(const Texto: string);
  end;

var
  Instancia: TLog;

implementation

uses
  Forms, SysUtils;

{ TLoggerSingleton }

constructor TLog.Create;
var
  DiretorioAplicacao: string;
begin
  // associa o aquivo "Log.txt" que est� na pasta do projeto
  DiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(ArquivoLog, DiretorioAplicacao + 'Log.txt');

  // se o arquivo n�o existir, � criado
  if not FileExists(DiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(ArquivoLog);
    CloseFile(ArquivoLog);
  end;
end;

class function TLog.NewInstance: TObject;
begin
  // se j� houver uma inst�ncia, ela � retornada
  // caso contr�rio, o objeto � instanciado antes de ser retornado

  if not Assigned(Instancia) then
  begin
    // chama a fun��o "NewInstance" da heran�a (TObject)
    Instancia := TLog(inherited NewInstance);
  end;

  result := Instancia;
end;

class function TLog.ObterInstancia: TLog;
begin
  // chama o m�todo Create, que cria (uma �nica vez) e retorna a inst�ncia
  result := TLog.Create;
end;

procedure TLog.RegistrarLog(const Texto: string);
begin
  // abre o arquivo de log para edi��o
  Append(ArquivoLog);

  // escreve o texto no arquivo de log
  WriteLn(ArquivoLog, Texto);

  // fecha o arquivo
  CloseFile(ArquivoLog);
end;

initialization

finalization
  // libera o Singleton da mem�ria
  FreeAndNil(Instancia);

end.
