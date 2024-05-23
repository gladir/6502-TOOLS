{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2021
  @website(https://www.gladir.com/6502-tools)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program _6502DICT;

Uses Strings;

Type
 Instr6502Rec=Record
  Name:String[3];
  Description:PChar;
  Syntax:PChar;
 End;

Const
 Instr6502:Array[0..55]of Instr6502Rec=(
  (Name:'ADC';
   Description:'Cette instruction permet de faire une addition avec la retenue.';
   Syntax:'ADC Quantit‚ Source'#13#10'ADC Quantit‚ Source,registre'),
  (Name:'AND';
   Description:'Cette instruction permet de faire un ®Et binaire¯ avec le registre accumulateur.';
   Syntax:'AND Masque'#13#10'AND Masque,registre'),
  (Name:'ASL';
   Description:'Cette instruction permet de faire un d‚calage des bits d''une position vers la '+
               'gauche; la valeur 0 est mise dans le bit 0 et le bit 7 est copi‚ dans le drapeau '+
               'de retenue.';
   Syntax:'ASL Op‚rande'#13#10'ASL Op‚rande,registre'),
  (Name:'BCC';
   Description:'Cette instruction permet de faire un saut … l''emplacement sp‚cifi‚ si le drapeau '+
                'de retenue vaut 0.';
   Syntax:'BCC D‚placement'),
  (Name:'BCS';
   Description:'Cette instruction permet de faire un saut … l''emplacement sp‚cifi‚ '+
                'si le drapeau de retenue vaut 1.';
   Syntax:'BCS D‚placement'),
  (Name:'BEQ';
   Description:'Cette instruction permet de faire un saut … l''emplacement sp‚cifi‚ '+
                'si le drapeau d''‚galit‚ vaut 1.';
   Syntax:'BEQ D‚placement'),
  (Name:'BIT';
   Description:'Cette instruction permet de fixer le drapeau Z comme si la valeur dans '+
               'l''adresse test‚e est un ®Et binaire¯ avec l''accumulateur, ainsi les '+
               'drapeaux S et V sont r‚gl‚s pour correspondre respectivement aux bit 6 '+
               'et 7 dans la valeur entrepos‚ dans l''adresse test‚.';
   Syntax:'BIT Masque'),
  (Name:'BMI';
   Description:'Cette instruction permet de faire un saut … l''emplacement sp‚cifi‚ '+
               'si inf‚rieur.';
   Syntax:'BMI D‚placement'),
  (Name:'BNE';
   Description:'Cette instruction permet de faire un saut … l''emplacement sp‚cifi‚ si '+
               'le drapeau d''‚galit‚ vaut 0.';
   Syntax:'BNE D‚placement'),
  (Name:'BPL';
   Description:'Cette instruction permet de faire un saut … l''emplacement sp‚cifi‚ '+
                'si sup‚rieur.';
   Syntax:'BPL D‚placement'),
  (Name:'BRK';
   Description:'Cette instruction permet de provoquer un non-masquage des interruptions '+
                'et incr‚mente le compteur de programme.';
   Syntax:'BRK'),
  (Name:'BVC';
   Description:'Cette instruction permet de faire un saut … l''emplacement sp‚cifi‚ '+
                'si le drapeau de d‚bordement vaut 0.';
   Syntax:'BVC D‚placement'),
  (Name:'BVS';
   Description:'Cette instruction permet de faire un saut … l''emplacement sp‚cifi‚ '+
                'si le drapeau de d‚bordement vaut 1.';
   Syntax:'BVS D‚placement'),
  (Name:'CLC';
   Description:'Cette instruction permet de fixer le drapeau de retenue … 0.';
   Syntax:'CLC'),
  (Name:'CLD';
   Description:'Cette instruction permet de fixer le drapeau de d‚cimal … 0.';
   Syntax:'CLD'),
  (Name:'CLI';
   Description:'Cette instruction permet de fixer le drapeau d''interruption … 0.';
   Syntax:'CLI'),
  (Name:'CLV';
   Description:'Cette instruction permet de fixer le drapeau de d‚bordement … 0.';
   Syntax:'CLV'),
  (Name:'CMP';
   Description:'Cette instruction permet d''effectuer une comparaison des ensembles '+
               'de drapeaux comme si une soustraction avait ‚t‚ effectu‚e.';
   Syntax:'CMP Op‚rande'#13#10'CMP Op‚rande,registre'),
  (Name:'CPX';
   Description:'Cette instruction permet d''effectuer une comparaison des ensembles '+
               'de drapeaux comme si une soustraction avait ‚t‚ effectu‚e sur le '+
               'registre X.';
   Syntax:'CPX Op‚rande'),
  (Name:'CPY';
   Description:'Cette instruction permet d''effectuer une comparaison des ensembles '+
               'de drapeaux comme si une soustraction avait ‚t‚ effectu‚e sur le '+
               'registre Y.';
   Syntax:'CPY Op‚rande'),
  (Name:'DEC';
   Description:'Cette instruction permet de d‚cr‚menter une cellule m‚moire ou un '+
               'emplacement absolue.';
   Syntax:'DEC Op‚rande'#13#10'DEC Op‚rande,X'),
  (Name:'DEX';
   Description:'Cette instruction permet de d‚cr‚menter le registre X.';
   Syntax:'DEX'),
  (Name:'DEY';
   Description:'Cette instruction permet de d‚cr‚menter le registre Y.';
   Syntax:'DEY'),
  (Name:'EOR';
   Description:'Cette instruction permet d''appliquer un ®Ou binaire exclusif¯ … la '+
               'cellule m‚moire ou un emplacement absolue.';
   Syntax:'EOR Op‚rande'#13#10'EOR Op‚rande,registre'),
  (Name:'INC';
   Description:'Cette instruction permet d''incr‚menter une cellule m‚moire ou un '+
               'emplacement absolue.';
   Syntax:'INC Op‚rande'#13#10'INC Op‚rande,X'),
  (Name:'INX';
   Description:'Cette instruction permet d''incr‚menter le registre X.';
   Syntax:'INX'),
  (Name:'INY';
   Description:'Cette instruction permet d''incr‚menter le registre Y.';
   Syntax:'INY'),
  (Name:'JMP';
   Description:'Cette instruction permet de sauter … l''adresse sp‚cifi‚.';
   Syntax:'JMP destination'),
  (Name:'JSR';
   Description:'Cette instruction permet d''appeler un sous-programme … '+
               'l''adresse absolue sp‚cifi‚.';
   Syntax:'JSR adresse'),
  (Name:'LDA';
   Description:'Cette instruction permet de charger une valeur dans le '+
               'registre accumulateur.';
   Syntax:'LDA adresse'#13#10'LDA adresse,registre'),
  (Name:'LDX';
   Description:'Cette instruction permet de charger une valeur dans le registre X.';
   Syntax:'LDX adresse'#13#10'LDX adresse,registre'),
  (Name:'LDY';
   Description:'Cette instruction permet de charger une valeur dans le registre Y.';
   Syntax:'LDY adresse'#13#10'LDY adresse,registre'),
  (Name:'LSR';
   Description:'Cette instruction permet de faire un d‚calage des bits d''une '+
               'position vers la droite; la valeur 0 est mise dans le bit 7 et '+
               'le bit 0 est copi‚ dans le drapeau de retenue.';
   Syntax:'LSR adresse'#13#10'LSR adresse,registre'),
  (Name:'NOP';
   Description:'Cette instruction ne fait rien.';
   Syntax:'NOP'),
  (Name:'ORA';
   Description:'Cette instruction permet de faire un ®Ou binaire¯ avec le '+
               'registre accumulateur.';
   Syntax:'ORA Op‚rande'#13#10'ORA Op‚rande,registre'),
  (Name:'PHA';
   Description:'Cette instruction permet d''empiler le registre A dans la pile.';
   Syntax:'PHA'),
  (Name:'PHP';
   Description:'Cette instruction permet d''empiler le registre d''‚tat P dans la pile.';
   Syntax:'PHP'),
  (Name:'PLA';
   Description:'Cette instruction permet de d‚piler le registre A de la pile.';
   Syntax:'PLA'),
  (Name:'PLP';
   Description:'Cette instruction permet de d‚piler le registre d''‚tat P de la pile.';
   Syntax:'PLP'),
  (Name:'ROL';
   Description:'Cette instruction permet de faire un d‚calage des bits d''une position '+
               'vers la gauche; la valeur de la retenue est mise dans le bit 0 et le '+
               'bit 7 est copi‚ dans le drapeau de retenue.';
   Syntax:'ROL adresse'#13#10'ROL adresse,registre'),
  (Name:'ROR';
   Description:'Cette instruction permet de faire un d‚calage des bits d''une position '+
               'vers la droite; la valeur de la retenue est mise dans le bit 7 et le '+
               'bit 0 est copi‚ dans le drapeau de retenue.';
   Syntax:'ROR adresse'#13#10'ROR adresse,registre'),
  (Name:'RTI';
   Description:'Cette instruction permet de retourner d''une interruption.';
   Syntax:'RTI'),
  (Name:'RTS';
   Description:'Cette instruction permet de retourner d''un sous-programme.';
   Syntax:'RTS'),
  (Name:'SBC';
   Description:'Cette instruction permet de faire une soustraction avec la retenue.';
   Syntax:'SBC Quantit‚ Source'#13#10'SBC Quantit‚ Source,registre'),
  (Name:'SEC';
   Description:'Cette instruction permet de fixer le drapeau de retenue … 1.';
   Syntax:'SEC'),
  (Name:'SED';
   Description:'Cette instruction permet de fixer le drapeau de d‚cimal … 1.';
   Syntax:'SED'),
  (Name:'SEI';
   Description:'Cette instruction permet de fixer le drapeau d''interruption … 1.';
   Syntax:'SEI'),
  (Name:'STA';
   Description:'Cette instruction permet d''entreposer une valeur provenant du '+
               'registre accumulateur.';
   Syntax:'STA Op‚rande'#13#10'STA Op‚rande,registre'),
  (Name:'STX';
   Description:'Cette instruction permet d''entreposer une valeur provenant du '+
               'registre X.';
   Syntax:'STX Op‚rande'#13#10'STX Op‚rande,registre'),
  (Name:'STY';
   Description:'Cette instruction permet d''entreposer une valeur provenant du '+
               'registre Y.';
   Syntax:'STY Op‚rande'#13#10'STY Op‚rande,registre'),
  (Name:'TAX';
   Description:'Cette instruction permet de transf‚rer le contenu du registre A '+
               'dans le registre X.';
   Syntax:'TAX'),
  (Name:'TAY';
   Description:'Cette instruction permet de transf‚rer le contenu du registre A '+
               'dans le registre Y.';
   Syntax:'TAY'),
  (Name:'TSX';
   Description:'Cette instruction permet de transf‚rer le contenu du registre de '+
               'pointeur de pile (S) dans le registre X.';
   Syntax:'TSX'),
  (Name:'TXA';
   Description:'Cette instruction permet de transf‚rer le contenu du registre X '+
               'dans le registre A.';
   Syntax:'TXA'),
  (Name:'TXS';
   Description:'Cette instruction permet de transf‚rer le contenu du registre X '+
               'dans le registre de pointeur de pile (S).';
   Syntax:'TXS'),
  (Name:'TYA';
   Description:'Cette instruction permet de transf‚rer le contenu du registre Y '+
                'dans le registre A.';
   Syntax:'TYA')
 );

Var
 I,J:Integer;

Function PadRight(S:String;Space:Byte):String;
Var
 I:Byte;
Begin
 If Length(S)<Space Then For I:=Length(S)+1 to Space do S:=S+' ';
 PadRight:=S;
End;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('6502DICT : Cette commande permet d''afficher la liste des ',
           'instructions ou une instruction de l''assembleur 6502.');
  WriteLn;
  WriteLn('Syntaxe : 6502DICT [/LIST] [instruction]');
  WriteLn;
  WriteLN(' instruction   Affiche l''instruction sp‚cifi‚');
  WriteLn(' /LIST         Affiche la liste des instructions');
 End
  Else
 If ParamCount>0 Then Begin
  For I:=1 to ParamCount do Begin
   If StrToUpper(ParamStr(I))='/LIST'Then Begin
    For J:=Low(Instr6502)to High(Instr6502)do Begin
     WriteLn(PadRight(Instr6502[J].Name,10),StrPas(Instr6502[J].Description));
    End;
   End
    Else
   Begin
    For J:=Low(Instr6502)to High(Instr6502)do Begin
     If StrToUpper(ParamStr(I))=StrToUpper(Instr6502[J].Name)Then Begin
      WriteLn('Instruction : ');
      WriteLn;
      WriteLn(Instr6502[J].Name);
      WriteLn;
      WriteLn('Syntaxe : ');
      WriteLn;
      WriteLn(StrPas(Instr6502[J].Syntax));
      WriteLn;
      WriteLn('Description :');
      WriteLn;
      WriteLn(StrPas(Instr6502[J].Description));
     End;
    End;
   End;
  End;
 End
  Else
 WriteLn('ParamŠtre requis !');
END.