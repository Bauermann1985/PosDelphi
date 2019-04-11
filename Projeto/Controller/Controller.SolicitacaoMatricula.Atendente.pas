unit Controller.SolicitacaoMatricula.Atendente;

interface

uses
  System.Generics.Collections,
  Controller.SolicitacaoMatricula.Intf,
  entity.curso;

type
  TSolicitacaoMatriculaAtendente = class(TInterfacedObjectSolicitacaoMatricula, ISolicitacaoMatricula)
    //procedure ISolicitacaoMatricula.SetSucessor = SetSucessor;
    function SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
      const ACurso: TCurso): Boolean;
  end;

implementation

{ TSolicitacaoMatriculaAtendente }

function TSolicitacaoMatriculaAtendente.SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
  const ACurso: TCurso): Boolean;
begin
  //gravar log de solicita��o de matr�cula pelo atendente
  //verificar se o atendente tem "credenciais" suficientes para aprovar a matr�cula
  //por exemplo: s�o necess�rios os documentos, aproveitamento de notas
  Result := True;
  if Assigned(FSucessor) then
    Result := FSucessor.SolicitarAutorizacaoMatricula(AListaDocumentos, ACurso);
end;

end.
