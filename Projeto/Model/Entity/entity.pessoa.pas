{*******************************************************}
{                                                       }
{       Projeto Teste P�s-Delphi                        }
{                                                       }
{       Copyright (C) 2019 Unoesc                       }
{                                                       }
{*******************************************************}
unit entity.pessoa;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  /// orm
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.types.mapping,
  ormbr.types.nullable,
  ormbr.mapping.Classes,
  ormbr.mapping.register,
  ormbr.mapping.attributes;

type
  [Enumeration(etChar,'M,F')]
  TSexo = (Masculino, Feminino);
  [Enumeration(etString,'A,I,M')] {Ativo, Inativo, Matr�culado}
  TStatus = (Ativo, Inativo, Matriculado);

  [ Entity ]
  [ PrimaryKey('id',AutoInc, nosort,true, 'chave primaria') ]
  [Sequence('pessoaid')]
  [ Table('pessoa', 'pessoas do sistema') ]
  TPessoa = class
  private
    fid            : integer;
    fmatricula     : integer;
    Fnome          : string;
    Fsobrenome     : string;
    Femail         : string;
    Ftelefone      : string;
    fsexo          : TSexo;
    fdatanascimento: TDate;
    fStatus        : TStatus;
  public
    [ Restrictions([ NoUpdate, NotNull ]) ]
    [ Column('id', ftInteger) ]
    [ Dictionary('C?digo', 'Mensagem valida��o', '', '', '', tacenter) ]
    property id: integer read fid write fid;

    [ Restrictions([ Unique ]) ]
    [ Column('matricula', ftInteger) ]
    [ Dictionary('Matr?cula', 'Mensagem valida��o', '', '', '', tacenter) ]
    property matricula: integer read fmatricula write fmatricula;

    [ Column('nome', ftString, 60) ]
    [ Dictionary('Nome', 'Mensagem valida��o', '', '', '', tacenter) ]
    property nome: string read Fnome write Fnome;

    [ Column('sobrenome', ftString, 60) ]
    [ Dictionary('Sobrenome', 'Mensagem valida��o', '', '', '', tacenter) ]
    property sobrenome: string read Fsobrenome write Fsobrenome;

    [ Column('email', ftString, 100) ]
    [ Dictionary('E-mail', 'Mensagem valida��o', '', '', '', tacenter) ]
    property email: string read Femail write Femail;

    [ Column('telefone', ftString, 15) ]
    [ Dictionary('Telefone', 'Mensagem valida��o', '', '', '', tacenter) ]
    property telefone: string read Ftelefone write Ftelefone;

    [ Column('sexo', ftString, 1) ]
    [ Dictionary('Sexo', 'Mensagem valida��o', '', '', '', tacenter) ]
    property sexo: TSexo read fsexo write fsexo;

    [ Column('datanascimento', ftDate) ]
    [ Dictionary('Nascimento', 'Mensagem valida��o', '', '', '', tacenter) ]
    property datanascimento: TDate read fdatanascimento write fdatanascimento;

    [ Column('status', ftString,1) ]
    [ Dictionary('Status', 'Mensagem valida��o', '', '', '', tacenter) ]
    property status: TStatus read fStatus write fStatus;

    function Clonar: TPessoa;
 end;


implementation

{ TPessoa }

function TPessoa.Clonar: TPessoa;
var
  ClonePessoa: TPessoa;
begin
  ClonePessoa := TPessoa.Create;

  ClonePessoa.Id        := Self.Id;
  ClonePessoa.Nome      := Self.Nome;
  ClonePessoa.Matricula := Self.Matricula;
  ClonePessoa.sobrenome := Self.sobrenome;
  ClonePessoa.email     := Self.email;
  ClonePessoa.telefone  := Self.telefone;
  ClonePessoa.sexo      := Self.sexo;
  ClonePessoa.datanascimento  := Self.datanascimento;
  result := ClonePessoa;
end;

initialization
TRegisterClass.RegisterEntity (TPessoa);

end.
