package TicketMachine with SPARK_Mode
is

   type Tickets is range 0..1000;
   serving : Tickets := 0;
   next : Tickets := 1;

   function Invariant return Boolean is
      (serving <= next);

   procedure takeTicket with
     Global => (In_Out => next, Proof_In => serving),
     Pre => next < Tickets'Last and then Invariant,
     Post => Invariant and next = next'Old + 1;


   procedure serveCustomer with
     Global => (In_Out => serving, Proof_In => next),
     Pre => serving < next and then Invariant,
     Post => Invariant and serving = serving'Old + 1;

   procedure returnTicket (k : Tickets) with
     Global => (In_Out => next, Proof_In => serving),
     Pre => serving < next and then Invariant,
     Post => Invariant and (next = next or next = next'Old + 1);

end TicketMachine;
