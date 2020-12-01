with Ada.Text_IO; use Ada.Text_IO;

package body Task_Package is
   task body My_Task is
      PID : Integer;
      Progress : Integer := 0;
      Complexicity : Integer := 10;
      IsInited : Boolean := False;

      function toString return String is
      begin
         return "Thread with PID" & Integer'Image(PID) & " progress is "
           & Integer'Image(Progress) & "/" & Integer'Image(Complexicity);
      end toString;

   begin
      loop
         select
            accept Init(Thread_ID:Integer; Thread_Complexicity:Integer) do
               if not IsInited then
                  PID:=Thread_ID;
                  Complexicity:=Thread_Complexicity;
                  IsInited := True;
                  Put_Line ("Task " & Integer'Image(PID) & " added to scheduler and initialized.");
               else
                  Put_Line ("Could not initializated Task with PID " & Integer'Image(Thread_ID) & ". This Task was already initialized with PID " & Integer'Image(PID));
               end if;
            end Init;
         or
            accept Run do
               Progress := Progress + 1;
               delay 1.0;
               Put_Line (toString);
            end Run;

            if Progress >= Complexicity then
               Put_Line("Task with PID " & Integer'Image(PID) & " sucessfully completed. Ending thread.");
               exit;
            end if;
         or
            accept Kill do
               Put_Line("Killing thread with PID ." & Integer'Image(PID));
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
