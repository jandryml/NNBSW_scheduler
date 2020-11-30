with Ada.Text_IO; use Ada.Text_IO;

package body Task_Package is
   task body My_Task is
      PID : Integer;
      Progress : Integer := 0;
      Complexicity : Integer := 10;

      function toString return String is
      begin
         return "Thread " & Integer'Image(PID) & " progress is "
           & Integer'Image(Progress) & "/" & Integer'Image(Complexicity);
      end toString;
   begin
      loop
         select
            accept Init(Thread_ID:Integer; Thread_Complexicity:Integer) do
               PID:=Thread_ID;
               Complexicity:=Thread_Complexicity;
            end Init;
            Put_Line ("Task " & Integer'Image(PID) & " added to scheduler and initialized.");
         or
            accept Run do
               Progress := Progress + 1;
            end Run;
            delay 1.0;
            Put_Line (toString);
            if Progress >= Complexicity then
               Put_Line("Task " & Integer'Image(PID) & " sucessfully completed. Ending thread.");
               exit;
            end if;
         or
            accept Kill do
               Put_Line ("Killing thread.");
            end Kill;
            exit;
         or
            accept Print do
               Put_Line(toString);
            end Print;
         or
            terminate;
            --  else
            --  delay 1.0;
            --  Put_Line("Blocked thread " );
         end select;
      end loop;
   end My_Task;

end Task_Package;
