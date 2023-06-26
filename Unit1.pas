unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    lbll1: TLabel;
    lbll2: TLabel;
    lbll3: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    dbg1: TDBGrid;
    ds1: TDataSource;
    con1: TZConnection;
    zqry1: TZQuery;
    frxdbdtst1: TfrxDBDataset;
    frxrprt1: TfrxReport;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    cbb1: TComboBox;
    procedure editbersih;
    procedure editenable;
    procedure posisiawal;
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg1CellClick(Column: TColumn);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.editbersih;
begin
edt1.Clear;
edt2.Clear;
cbb1.Clear
end;

procedure TForm1.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
cbb1.Enabled:= True;
end;

procedure TForm1.posisiawal;
begin
editbersih;

edt1.Enabled:= False;
edt2.Enabled:= False;
cbb1.Enabled:= False;

btn1.Enabled:= True;
bbtn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
editbersih;

btn1.Enabled:= false;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;

editenable;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
if (edt1.Text= '')or (edt2.Text ='')or(cbb1.Text= '')then
begin
ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (zqry1.Locate('nama',edt1.Text,[])) and (zqry1.Locate('jenis',edt2.Text,[])) then
begin
ShowMessage('DATA KELAS SUDAH DIGUNAKAN');
posisiawal;
end else
begin
//simpan
zqry1.SQL.Clear;
zqry1.SQL.Add('insert into tabel_kelas values (null,"'+edt1.Text+'","'+edt2.Text+'","'+cbb1.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_kelas');
zqry1.Open;
ShowMessage('DATA BARHASIL DISIMPAN!');
posisiawal;

end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
if (edt1.Text= '')or (edt2.Text ='')or(cbb1.Text= '')then
begin
ShowMessage('INPUTAN WAJIB DIISI!');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (edt2.Text = zqry1.Fields[2].AsString) and (cbb1.Text = zqry1.Fields[3].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_kelas').AsString;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE
zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_kelas set nama= "'+edt1.Text+'",jenis="'+edt2.Text+'" where id_kelas="'+id+'"');
zqry1. ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_kelas');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbg1.DataSource.DataSet.FieldByName('id_kelas').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_kelas where id_kelas="'+id+'"');
zqry1. ExecSQL;
zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.dbg1CellClick(Column: TColumn);
begin
btn1.Enabled:= true;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
id:=zqry1.Fields[0].AsString;
Edit1.Text:= zqry1.FieldList[1].AsString;
Edit2.Text:= zqry1.FieldList[2].AsString;
cbb1.Text:= zqry1.FieldList[3].AsString;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
frxrprt1.showreport();
end;

end.
