unit Controller.SolicitacaoMatricula.Coordenador;

interface

uses
  System.Generics.Collections,
  Controller.SolicitacaoMatricula.Intf,
  entity.curso;

type
  TSolicitacaoMatriculaCoordenador = class(TInterfacedObjectSolicitacaoMatricula, ISolicitacaoMatricula)
    //procedure ISolicitacaoMatricula.SetSucessor = SetSucessor;
    function SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
      const ACurso: TCurso): Boolean;
  end;

implementation

{ TSolicitacaoMatriculaCoordenador }

function TSolicitacaoMatriculaCoordenador.SolicitarAutorizacaoMatricula(const AListaDocumentos: TObjectList<TObject>;
  const ACurso: TCurso): Boolean;
begin
  //gravar log de solicita��o de matr�cula pelo coordenador
  //entende-se que para a matr�cula a maior hierarquia necess�ria, seria o coordenador que ir� poder� aprovar ou n�o a matr�cula,
  //por�m pode ser que seja necess�rio que seja aprovada ainda por algum colegiado, o que faria seguir a hierarquia
  //vertical dos cargos
  Result := True;
  if Assigned(FSucessor) then
    Result := FSucessor.SolicitarAutorizacaoMatricula(AListaDocumentos, ACurso);
end;

end.
