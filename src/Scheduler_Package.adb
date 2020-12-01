with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;
with Task_Package;

package body Scheduler_Package is
   
   task body My_Scheduler is
      
      --  Task_Pool : array (0 .. 15) of Task_Package.My_Task_Access;
      package Task_Vector is new Ada.Containers.Vectors
        (Natural, Task_Package.My_Task_Access);
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
            -- working on tasks
            Put_Line ("Waiting");
            delay 1.0;
         end select;
      end loop;
   end My_Scheduler;
   
end Scheduler_Package;
