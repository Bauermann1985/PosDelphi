unit Pattern.Decorator.NomeUsuario;

interface

uses
  Pattern.Decorator;

type
  { Concrete Decorator }
  TNomeUsuarioDecorator = class(TDecorator)
  private
    function ObterNomeUsuario: string;
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  Windows;

function TNomeUsuarioDecorator.ObterDadosExcecao: string;
begin
  result := inherited ObterDadosExcecao;

  result := result + 'Usu�rio Windowns: ' + ObterNomeUsuario;
end;

function TNomeUsuarioDecorator.ObterNomeUsuario: string;
var
  Size: DWord;
begin
  // retorna o login do usu�rio do sistema operacional
  Size := 1024;
  SetLength(result, Size);
  GetUserName(PChar(result), Size);
  SetLength(result, Size - 1);
end;

end.
