MODULE PPMTest;  (** PPMTest.Run: a small picture file written and opened with Pictures.Open; needs the desktop's display *)

IMPORT Files, Pictures, Gadgets, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Line(VAR R: Files.Rider; s: ARRAY OF CHAR);
VAR i: LONGINT;
BEGIN
  i := 0; WHILE s[i] # 0X DO Files.Write(R, s[i]); INC(i) END;
  Files.Write(R, 0AX)
END Line;

PROCEDURE Run*;
VAR f: Files.File; R: Files.Rider; P: Pictures.Picture;
BEGIN
  fails := 0; checks := 0;
  Check("PPM.NewPicture", Gadgets.CreateObject("PPM.NewPicture") # NIL);
  f := Files.New("zq_test.pgm"); Files.Set(R, f, 0);
  Line(R, "P2");
  Line(R, "3 2");
  Line(R, "255");
  Line(R, "0 128 255");
  Line(R, "255 128 0");
  Files.Register(f);
  NEW(P); Pictures.Open(P, "zq_test.pgm", TRUE);
  Check("zq_test.pgm: 3 by 2", (P.width = 3) & (P.height = 2));
  Out.String("PPMTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END PPMTest.
