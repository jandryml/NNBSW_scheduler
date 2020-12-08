with Ada.Text_IO; use Ada.Text_IO;

package body Task_Package is
   task body My_Task is
      PID : Integer;
      Progress : Integer := 0;
      Complexicity : Integer := 10;

      function toString return String is
      begin
         return "PID " & Integer'Image(PID) & ": Task progress is "
           & Integer'Image(Progress) & "/" & Integer'Image(Complexicity);
      end toString;

   begin
      accept Init(Thread_ID:Integer; Thread_Complexicity:Integer) do
         PID:=Thread_ID;
         Complexicity:=Thread_Complexicity;
         Put_Line ("PID " & Integer'Image(PID) & ": Task was initialized.");
      end Init;
      loop
         select
            accept Init(Thread_ID:Integer; Thread_Complexicity:Integer) do
               Put_Line ("PID " & Integer'Image(PID) & ": Could not initializated Task with PID " & Integer'Image(Thread_ID) & ". This Task was already initialized!");
            end Init;
         or
            accept Run do
               Progress := Progress + 1;
               delay 1.0;
               Put_Line (toString);
            end Run;

            if Progress >= Complexicity then
               Put_Line("PID " & Integer'Image(PID) & ": Task sucessfully completed. Ending task.");
               exit;
            end if;
         or
            accept Kill do
               Put_Line("PID " & Integer'Image(PID) & ": Killing task.");
            end Kill;
            exit;
         or
            accept Print do
               Put_Line(toString);
            end Print;
         or
            terminate;
         end select;
      end loop;
   end My_Task;
end Task_Package;
