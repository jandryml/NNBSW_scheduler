with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;
with Task_Package; use Task_Package;

package body Scheduler_Package is
   
   task body My_Scheduler is
      
      type Task_Pool_Element is record
         PID : Integer;
         IsPresent : Boolean := False;
         Task_Pointer : My_Task_Access;
      end record;
   
      type Task_Pool_Element_Access is access Task_Pool_Element;
      
      type My_Index is range 1 .. 101;
   
      type Task_Pool_Array is array (My_Index) of Task_Pool_Element_Access;
      My_Task_Pool : Task_Pool_Array;
      

      type Task_Pool_Flags is array (My_Index) of Boolean;
      My_Task_Pool_Flags : Task_Pool_Flags := (others => False);
   
      Operated_Task : My_Task_Access;
 
   begin
      loop
         select
            accept New_Task(PID: Integer; Complexicity: Integer) do
               Operated_Task := new My_Task;
               Operated_Task.Init(PID, Complexicity);
               for I in My_Index loop
                  Put_Line ("Looping " & My_Index'Image(I));
                  if not My_Task_Pool_Flags(I) then
                     Put_Line ("Adding Task with PID " & Integer'Image(PID) & " to scheduler");
                     My_Task_Pool(I) := new Task_Pool_Element;
                     My_Task_Pool(I).PID := PID;
                     My_Task_Pool(I).IsPresent := True;
                     My_Task_Pool(I).Task_Pointer := Operated_Task;
                     exit;
                  end if;
               end loop;
               
               Put_Line ("Task with PID " & Integer'Image(PID) & " was added to scheduler.");
            end New_Task;
         or
            accept Kill_Task do
               Put_Line ("Killing Task");
            end Kill_Task;
            --  else
            --     terminate;
         or 
            accept Print_Scheduler_Tasks;
            for I in My_Index loop
               if My_Task_Pool(I).IsPresent then
                  Put_Line ("Task from index " & My_Index'Image(I));
                  My_Task_Pool(I).Task_Pointer.Print;
               end if;
            end loop;
         else 
            -- working on tasks
            Put_Line ("Waiting");
            delay 1.0;
         end select;
      end loop;
   end My_Scheduler;
   
end Scheduler_Package;
