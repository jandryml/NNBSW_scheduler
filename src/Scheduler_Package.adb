with Ada.Text_IO; use Ada.Text_IO;
with Task_Package;

package body Scheduler_Package is
   
   task body My_Scheduler is
      type Index is range 1 .. 5;
      Threads_Array : array (Index) of Task_Package.My_Task;
   begin
      loop
         select
            -- (New_Task:My_Task) -- 
            accept New_Task do
               Put_Line ("Adding new Task");
            end New_Task;
         or
            accept Kill_Task do
               Put_Line ("Killing Task");
            end Kill_Task;
         --  else
         --     terminate;
         else 
            Put_Line ("Waiting");
            delay 1.0;
         end select;
      end loop;
   end My_Scheduler;
   
end Scheduler_Package;
