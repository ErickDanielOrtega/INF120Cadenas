
unit UPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  UCadena;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private
    C: TCadena;
    procedure Actualizar;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Actualizar;
begin
  Edit5.Text := C.GetCadena;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if C <> nil then
    C.Free;

  C := TCadena.Create;
  C.SetCadena(Edit2.Text);
  Actualizar;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit6.Clear;

  C.SetCadena('');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit3.Text := C.getCadena();
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  C.addChar(Edit2.Text[1]);
  Actualizar;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  C.insChar(Edit2.Text[1], StrToInt(Edit3.Text));
  Actualizar;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  C.elimChar(StrToInt(Edit3.Text));
  Actualizar;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  C.interChar(StrToInt(Edit3.Text), StrToInt(Edit4.Text));
  Actualizar;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Edit6.Text := IntToStr(C.cantChar);
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  Edit6.Text := C.getChar(StrToInt(Edit3.Text));
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  Edit6.Text := IntToStr(C.busqChar(Edit2.Text[1]));
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  Edit6.Text := IntToStr(C.cantPal);
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  C.insPal(Edit2.Text, StrToInt(Edit3.Text));
  Actualizar;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  C.elimPal(StrToInt(Edit3.Text));
  Actualizar;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  C.cambPal(StrToInt(Edit3.Text), Edit2.Text);
  Actualizar;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  Edit6.Text := IntToStr(C.buscPal(Edit2.Text));
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  C.addPal(Edit2.Text);
  Actualizar;
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  C.invertir;
  Actualizar;
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  C.rotar;
  Actualizar;
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
  C.mayusculas;
  Actualizar;
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
  C.minusculas;
  Actualizar;
end;

procedure TForm1.MenuItem19Click(Sender: TObject);
begin
  C.Titulo;
  Actualizar;
end;

end.

