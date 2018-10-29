unit uTorreHanoi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gpVermelho: TGridPanel;
    gpVerde: TGridPanel;
    gpAzul: TGridPanel;
    Movimentar: TButton;
    rgAnilha: TRadioGroup;
    rgBastao: TRadioGroup;
    lblMovimentos: TLabel;
    procedure MovimentarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MoverAnilha(anilha: TControl; bastao, posicao: Integer);
    procedure msgAnilhaMaior();
    procedure ganhou;
  private
    { Private declarations }
    posVermb1, posVerdb1, posAzulb1 : Integer ;
    posVermb2, posVerdb2, posAzulb2 : Integer ;
    posVermb3, posVerdb3, posAzulb3 : Integer ;
    totalMovimentos : Integer ;
    verdMov, azulMov : boolean ;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Inicia a aplicação definindos as posições inicias
  // final B1 é primeiro bastão e assim por diantes B2 segundo e B3 terceiro
  posVermb1       := 1;
  posVerdb1       := 2;
  posAzulb1       := 3;
  posVermb2       := 0;
  posVerdb2       := 0;
  posAzulb2       := 0;
  posVermb3       := 0;
  posVerdb3       := 0;
  posAzulb3       := 0;
  azulMov         := false; // Essa variavel indica se a anilha azul pode se movimentada ou não
  verdMov         := false; // Essa a verdade, quando False ela esta em baixo e true em cima podendo movimentar
  totalMovimentos := 0; // Zera variavel que conta os movimentos

  // Posições iniciais de cada anilha top indica a distancia da parte superior
  // e Left o espaço da esquerda, como cada anilha tem um tamanho esses valores são diferentes
  gpVermelho.Top  := 143;
  gpVermelho.Left := 30;

  gpVerde.Top     := 175;
  gpVerde.Left    := 20;

  gpAzul.Top      := 205;
  gpAzul.Left     := 3;
end;

procedure TForm1.ganhou;
begin
  // Procedure que verificar se ganhou
  // Condição para ver se no bastão 3 estão todos as anilhas nas posições de piramide
  if (posAzulb3 = 3) and (posVerdb3 = 2) and (posVermb3 = 1) then
  begin
    // Se sim é exibido a mensagem e depois começa zerar tudo como um inicio de jogo
    ShowMessage('Parabéns voce ganhou! Com total de movimentos: ' + IntToStr(totalMovimentos));
    lblMovimentos.Caption := 'Movimentos: ';
    totalMovimentos := 0;

    // Zera posições e volta posições B1(Primeiro Bastão)
    posVermb1       := 1;
    posVerdb1       := 2;
    posAzulb1       := 3;
    posVermb2       := 0;
    posVerdb2       := 0;
    posAzulb2       := 0;
    posVermb3       := 0;
    posVerdb3       := 0;
    posAzulb3       := 0;

    // Trava movimento de azul e verde
    azulMov         := false;
    verdMov         := false;

    // Volta anilhas para primeiro bastão
    gpAzul.Parent       := GroupBox1;
    gpVerde.Parent      := GroupBox1;
    gpVermelho.Parent   := GroupBox1;

    // Desmarca os RadiosButtons
    rgAnilha.ItemIndex  := -1;
    rgBastao.ItemIndex  := -1;
  end;
end;

procedure TForm1.MoverAnilha(anilha: TControl; bastao, posicao: Integer);
begin
  // Procedure para movimentar anilhas, o motivo de criar é porque iria repetir mto esses valores
  // e com a criação dela não ficaria codigo muito repetido
  if posicao = 3 then
    begin
      // Esconde anilha
      anilha.Hide;
      if anilha = gpVermelho then
      begin
        anilha.Top    := 205;
        anilha.Left   := 30;
      end else if anilha = gpVerde then
      begin
        anilha.Top    := 205;
        anilha.Left   := 20;
      end else if anilha = gpAzul then
      begin
        anilha.Top    := 205;
        anilha.Left   := 3;
      end;
    end;
  if posicao = 2 then
  begin
  anilha.Hide;
    if anilha = gpVermelho then
    begin
      anilha.Top    := 175;
      anilha.Left   := 30;
    end else if anilha = gpVerde then
    begin
      anilha.Top    := 175;
      anilha.Left   := 20;
    end else if anilha = gpAzul then
    begin
      anilha.Top    := 175;
      anilha.Left   := 3;
    end;
  end;
  if posicao = 1 then
  begin
  anilha.Hide;
    if anilha = gpVermelho then
    begin
      anilha.Top    := 143;
      anilha.Left   := 30;
    end else if anilha = gpVerde then
    begin
      anilha.Top    := 143;
      anilha.Left   := 20;
    end else if anilha = gpAzul then
    begin
      anilha.Top    := 143;
      anilha.Left   := 3;
    end;
  end;

  // Muda bastões das anilhas
  if bastao = 1 then
    begin
      anilha.Parent := GroupBox1;
    end else if bastao  = 2 then
    begin
      anilha.Parent := GroupBox2;
    end else if bastao  = 3 then
    begin
      anilha.Parent := GroupBox3;
    end;
  // Exibe anilha
  anilha.Show;
  // Contas os movimentos
  totalMovimentos := totalMovimentos + 1;
  // Muda o Caption contando os movimentos
  lblMovimentos.Caption := 'Movimentos: ' + IntToStr(totalMovimentos) ;
end;

procedure TForm1.MovimentarClick(Sender: TObject);
begin
// Toda movimentação ao clicar no botão movimentar
// Verificar se não tem nenhum radio button marcado, se não estiver exibe a mensagem
if rgBastao.ItemIndex = -1 then
begin
  Application.MessageBox('Um bastão deve ser selecionado para movimentar!','Atenção',MB_ICONEXCLAMATION + MB_OK);
end else if rgAnilha.ItemIndex = -1 then
begin
  Application.MessageBox('Uma anilha deve ser selecionado para movimentar!','Atenção',MB_ICONEXCLAMATION + MB_OK);
end;

// Inicio Anilha vermelha
// Validações para identificar qual posição a anilha vai
// faz verificações para liberar a movimentação da anilha verde que de inicio
// esta em baixo da vermelha e também tira movimentação caso ela for pra cima
// de algum deles
if (rgAnilha.ItemIndex = 0) and (rgBastao.ItemIndex = 0) then
begin
  if (posVerdb1 = 0) and (posAzulb1 = 0) then
  begin
    posVermb2 := 0;
    posVermb3 := 0;
    MoverAnilha(gpVermelho, 1, 3);
    verdMov   := true;
    posVermb1 := 3;
  end else if (posVerdb1 = 2) or (posAzulb1 = 2) then
  begin
    posVermb2 := 0;
    posVermb3 := 0;
    MoverAnilha(gpVermelho, 1, 1);
    if posVerdb1 = 2 then
    begin
      verdMov := false;
    end
    else
    begin
      azulMov := false;
    end;
    posVermb1 := 1;
  end else if (posVerdb1 = 3) or (posAzulb1 = 3) then
  begin
    posVermb2 := 0;
    posVermb3 := 0;
    MoverAnilha(gpVermelho, 1, 2);
    if posVerdb1 = 3 then
    begin
      verdMov := false;
    end
    else
    begin
      azulMov := false;
      verdMov := true;
    end;
    posVermb1 := 2;
  end;

// Bastão 2 faz as mesma verificações alterando apenas alguns detalhes como posição
end else if (rgAnilha.ItemIndex = 0) and (rgBastao.ItemIndex = 1) then
begin
  if (posVerdb2 = 0) and (posAzulb2 = 0) then
  begin
    posVermb1 := 0;
    posVermb3 := 0;
    MoverAnilha(gpVermelho, 2, 3);
    verdMov   := true;
    posVermb2 := 3;
  end else if (posVerdb2 = 2) or (posAzulb2 = 2) then
  begin
    posVermb1 := 0;
    posVermb3 := 0;
    MoverAnilha(gpVermelho, 2, 1);
    if posVerdb2 = 2 then
    begin
      verdMov := false;
    end
    else
    begin
      azulMov := false;
      verdMov := true;
    end;
    posVermb2 := 1;
  end else if (posVerdb2 = 3) or (posAzulb2 = 3) then
  begin
    posVermb1 := 0;
    posVermb3 := 0;
    MoverAnilha(gpVermelho, 2, 2);
    if posVerdb2 = 3 then
    begin
      verdMov := false;
    end
    else
    begin
      azulMov := false;
      verdMov := true;
    end;
    posVermb2 := 2;
  end ;

// Bastão 3 igual mudando posição
end else if (rgAnilha.ItemIndex = 0) and (rgBastao.ItemIndex = 2) then
begin
  if (posVerdb3 = 0) and (posAzulb3 = 0) then
  begin
    posVermb1 := 0;
    posVermb2 := 0;
    MoverAnilha(gpVermelho, 3, 3);
    verdMov   := true;
    posVermb3 := 3;
  end else if (posVerdb3 = 2) or (posAzulb3 = 2) then
  begin
    posVermb1 := 0;
    posVermb2 := 0;
    MoverAnilha(gpVermelho, 3, 1);
    if posVerdb3 = 2 then
    begin
      verdMov := false;
    end
    else
    begin
      azulMov := false;
      verdMov := true;
    end;
    posVermb3 := 1;
  end else if (posVerdb3 = 3) or (posAzulb3 = 3) then
  begin
    posVermb1 := 0;
    posVermb2 := 0;
    MoverAnilha(gpVermelho, 3, 2);
    if posVerdb3 = 3 then
    begin
      verdMov := false;
    end
    else
    begin
      azulMov := false;
      verdMov := true;
    end;
    posVermb3 := 2;
  end ;

// Inicio Anilha verde
// Efetuado o mesmo processo mudando apenas validações
// no caso de ele do vermelho estar sobre o verde ele não pode movimentar
end else if (rgAnilha.ItemIndex = 1) and (rgBastao.ItemIndex = 0) then
begin
  if verdMov = true then
  begin
    if (posVermb1 = 0) and (posAzulb1 = 0) then
    begin
      posVerdb2 := 0;
      posVerdb3 := 0;
      MoverAnilha(gpVerde, 1, 3);
      verdMov   := true;
      posVerdb1 := 3;
    end else if posAzulb1 = 3 then
    begin
      posVerdb2 := 0;
      posVerdb3 := 0;
      MoverAnilha(gpVerde, 1, 2);
      verdMov   := true;
      azulMov   := false;
      posVerdb1 := 2;
    end else if (posVermb1 = 3) or (posVermb1 = 2) then
    begin
      msgAnilhaMaior();
    end;
  end
  else
  begin
    ShowMessage('Esta peça esta em baixo não pode ser movimentada!');
  end;
end else if (rgAnilha.ItemIndex = 1) and (rgBastao.ItemIndex = 1) then
begin
  if verdMov = true then
  begin
    if (posVermb2 = 0) and (posAzulb2 = 0) then
    begin
      posVerdb1 := 0;
      posVerdb3 := 0;
      MoverAnilha(gpVerde, 2, 3);
      verdMov   := true;
      azulMov   := false;
      posVerdb2 := 3;
    end else if (posVermb2 = 3) or (posVermb2 = 2) then
    begin
      msgAnilhaMaior();
    end else if posAzulb2 = 3 then
    begin
      posVerdb1 := 0;
      posVerdb3 := 0;
      MoverAnilha(gpVerde, 2, 2);
      verdMov   := true;
      azulMov   := false;
      posVerdb2 := 2;
    end;
  end
  else
  begin
    ShowMessage('Esta peça esta em baixo não pode ser movimentada!');
  end;
end else if (rgAnilha.ItemIndex = 1) and (rgBastao.ItemIndex = 2) then
begin
  if verdMov = true then
  begin
    if (posVermb3 = 0) and (posAzulb3 = 0) then
    begin
      posVerdb1 := 0;
      posVerdb2 := 0;
      MoverAnilha(gpVerde, 3, 3);
      verdMov   := true;
      azulMov   := false;
      posVerdb3 := 3;
    end else if (posVermb3 = 3) or (posVermb3 = 2) then
    begin
        msgAnilhaMaior();
    end else if posAzulb3 = 3 then
    begin
      posVerdb1 := 0;
      posVerdb2 := 0;
      MoverAnilha(gpVerde, 3, 2);
      verdMov   := true;
      azulMov   := false;
      posVerdb3 := 2;
    end ;
  end
  else
  begin
    ShowMessage('Esta peça esta em baixo não pode ser movimentada!');
  end;

// Inicio Anilha azul
end else if (rgAnilha.ItemIndex = 2) and (rgBastao.ItemIndex = 0) then
begin
  if azulMov = true then
  begin
    if (posVermb1 = 0) and (posVerdb1 = 0) then
    begin
      posAzulb2 := 0;
      posAzulb3 := 0;
      MoverAnilha(gpAzul, 1, 3);
      azulMov   := true;
      posAzulb1 := 3;
    end else if (posVermb1 = 2) or (posVerdb1 = 2) then
    begin
      msgAnilhaMaior();
    end else if (posVermb1 = 3) or (posVerdb1 = 3) then
    begin
      msgAnilhaMaior();
    end ;
  end;    
end else if (rgAnilha.ItemIndex = 2) and (rgBastao.ItemIndex = 1) then
begin
  if azulMov = true then
  begin
    if (posVermb2 = 0) and (posVerdb2 = 0) then
    begin
      posAzulb1 := 0;
      posAzulb3 := 0;
      MoverAnilha(gpAzul, 2, 3);
      azulMov   := true;
      posAzulb2 := 3;
    end else if (posVermb2 = 2) or (posVerdb2 = 2) then
    begin
      msgAnilhaMaior();
    end else if (posVermb2 = 3) or (posVerdb2 = 3) then
    begin
      msgAnilhaMaior();
    end ;
  end;
end else if (rgAnilha.ItemIndex = 2) and (rgBastao.ItemIndex = 2) then
begin
  if azulMov = true then
  begin
    if (posVermb3 = 0) and (posVerdb3 = 0) then
    begin
      posAzulb1 := 0;
      posAzulb2 := 0;
      MoverAnilha(gpAzul, 3, 3);
      azulMov   := true;
      posAzulb3 := 3;
    end else if (posVermb3 = 2) or (posVerdb3 = 2) then
    begin
      msgAnilhaMaior();
   end;
  end else if (posVermb3 = 3) or (posVerdb3 = 3) then
  begin
    msgAnilhaMaior();
  end;
end;

// Chamo a procedure para verificar se ganhou
ganhou;
end;

procedure TForm1.msgAnilhaMaior;
begin
  // Criado uma procedure para enviar mensagem quando anilhar for maior e não pode ficar em cima
  ShowMessage('Não pode mover peça maior em cima de uma menor!');
end;

end.
