package body PigeonHoles with SPARK_mode
is

   procedure PigeonBeGone(d : in out PigeonHole)
   is
      Pos : PH_Index := d'First;
   begin
      while Pos < d'Last loop
         d(Pos) := Dove;
         -- if  Pos < d'Last then Pos := Pos + 1; else exit; end if;
         Pos := Pos + 1;
         pragma Loop_Invariant (for all J in d'First..(Pos-1) => d(J) /= Pigeon);
         pragma Loop_Variant (Increases => Pos);
      end loop;
      d(d'Last) := Dove;
   end PigeonBeGone;

   function CountBirds (d : PigeonHole; b : Box) return Integer
   is
      bs : Integer := 0;
      n : PH_Index := d'First;
      m : PH_Index := d'Last;
   begin
      for I in n..m loop
         if d(I) = b then bs := bs + 1; else bs := bs; end if;
      end loop;
      return bs;
   end CountBirds;

   procedure SubstituteBird (d : in out PigeonHole; n : PH_Index; b : Box)
   is
   begin
      d(n) := b;
   end SubstituteBird;




   procedure DoveBeGone (d : in out PigeonHole)
   is
      a : PH_Index := d'First;
      b : PH_Index := d'Last;
   begin
      for I in a..b loop
         d(I) := Pigeon;
      end loop;
   end DoveBeGone;


end PigeonHoles;
