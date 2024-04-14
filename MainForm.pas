unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Generics.Collections,
  Vcl.ComCtrls, Vcl.ExtCtrls, IOUtils;

type
  TForm1 = class(TForm)
    readFileNameEdit: TEdit;
    Button1: TButton;
    FileOpenDialog1: TFileOpenDialog;
    writeFolderNameEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    FileOpenDialog2: TFileOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure readFileNameEditDblClick(Sender: TObject);
    procedure writeFolderNameEditDblClick(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  vDic: TDictionary<String,Integer>;
  csvSt: TStreamReader;
  vSL: TStringList;
  lct: Integer;
  csvSw: TStreamWriter;
  logSw: TStreamWriter;
  s: String;
  outCSVName: String;
  fi: Integer;
begin
  vDic := TDictionary<String,Integer>.Create;
  vSL := TStringList.Create;
  vSL.Delimiter := ',';
  vSL.StrictDelimiter := True;
  logSw := TStreamWriter.Create('log.txt');

  if FileExists(readFileNameEdit.Text) then begin
    logSw.WriteLine('start:' + FormatDateTime('yyyy/mm/dd hh:mm:ss',Now));
    csvSt := TStreamReader.Create(readFileNameEdit.Text);
    lct := 0;
    while not csvSt.EndOfStream do begin
      vSL.DelimitedText := csvSt.ReadLine;
      if vDic.ContainsKey(vSL.DelimitedText) then begin
        //重複しておられますね
      end else begin
        vDic.Add(vSL.DelimitedText,lct);
      end;
      Inc(lct);

      if lct mod 10 = 0 then begin
        StatusBar1.simpletext := '読込中…(' + IntToStr(lct) + ')';
        Application.ProcessMessages;
      end;
    end;
    StatusBar1.simpletext := '読込完了';
    csvSt.Free;

    //書込用CSV名を作る
    fi := 0;
    outCSVName := writeFolderNameEdit.Text + '\' + TPath.GetFileNameWithoutExtension(readFileNameEdit.Text) + '.csv';
    while not(FileExists(outCSVName)) do begin
      Inc(fi);
      outCSVName := writeFolderNameEdit.Text + '\' + TPath.GetFileNameWithoutExtension(readFileNameEdit.Text) + '_' + IntToStr(fi) + '.csv';
    end;

    //かきこみ
    StatusBar1.simpletext := '書込中…';
    Application.ProcessMessages;
    lct := 0;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := vDic.Count;
    csvSw := TStreamWriter.Create(outCSVName);
    for s in vDic.Keys do begin
      Inc(lct);
      csvSw.WriteLine(s);
      if lct mod 10 = 0 then begin
        StatusBar1.simpletext := '書込中…(' + IntToStr(lct) + ')';
        ProgressBar1.StepBy(10);
        Application.ProcessMessages;
      end;
    end;
    csvSw.Free;

    //かきこみ
    StatusBar1.simpletext := '完了. ' + IntToStr(lct) + ' 件書き込みました。';
  end;
  logSw.WriteLine('End:' + FormatDateTime('yyyy/mm/dd hh:mm:ss',Now));
  logSw.Free;
  vDic.Free;
  vSL.Free;
end;

procedure TForm1.readFileNameEditDblClick(Sender: TObject);
begin
  if FileOpenDialog1.Execute then begin
    readFileNameEdit.Text := FileOpenDialog1.FileName;
  end;
end;

procedure TForm1.writeFolderNameEditDblClick(Sender: TObject);
begin
  if FileOpenDialog2.Execute then begin
    writeFolderNameEdit.Text := FileOpenDialog2.FileName;
  end;
end;

end.
