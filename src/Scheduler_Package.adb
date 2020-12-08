with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Vectors;
with Task_Package; use Task_Package;

package body Scheduler_Package is
   
   task body My_Scheduler is
      
      -- Array elements definition
      type Task_Pool_Element is record
         PID : Integer;
         Task_Pointer : My_Task_Access;
      end record;
      type Task_Pool_Element_Access is access Task_Pool_Element;
      
      -- Array for tasks 
      type My_Index is range 1 .. 101;
      type Task_Pool_Array is array (My_Index) of Task_Pool_Element_Access;
      My_Task_Pool : Task_Pool_Array;
      
      -- Vector for keeping record of occupied elements
      package Integer_Vectors is new Vectors(Natural, My_Index);
      use Integer_Vectors;
      Occupied_Array_Indexes : Vector;
      Operated_Task : My_Task_Access;
      Operated_Index : Integer;
      Vector_Elem_Cursor: Cursor;
      Scheduled_Task : Integer := 0;
 
   begin
      loop
         select
            accept New_Task(PID: Integer; Complexicity: Integer) do
               Operated_Task := new My_Task;
               Operated_Task.Init(PID, Complexicity);
               for I in My_Index loop
                  if not Occupied_Array_Indexes.Contains(I) then
                     --  Put_Line ("Adding Task with PID " & Integer'Image(PID) & " to scheduler");
                     My_Task_Pool(I) := new Task_Pool_Element;
                     My_Task_Pool(I).PID := PID;
                     My_Task_Pool(I).Task_Pointer := Operated_Task;
                     --  Put_Line ("    array on index " & My_Index'Image(I));
                     Occupied_Array_Indexes.Append(I);
                     exit;
                  end if;
               end loop;
            end New_Task;
         or
            accept Kill_Task(PID: Integer) do
               Operated_Index := -1;
               for I of Occupied_Array_Indexes loop
                  if My_Task_Pool(I).PID = PID then
                     Put_Line("Task with PID " & Integer'Image(PID) & " found");
                     Operated_Index := Integer(I);
                  end if;
               end loop;
               
               if Operated_Index /= -1 then
                  My_Task_Pool(My_Index(Operated_Index)).Task_Pointer.Kill;
                  Put_Line("Task with PID " & Integer'Image(PID) & " was killed.");
                  
                  Vector_Elem_Cursor := Occupied_Array_Indexes.Find(My_Index(Operated_Index));
                  Occupied_Array_Indexes.Delete(Vector_Elem_Cursor);
                  Put_Line("Cursor pointing to aray element " & Integer'Image(Operated_Index) & " removed from vector.");
               else 
                  Put_Line ("Task with PID " & Integer'Image(PID) & " not found!");
               end if;
            end Kill_Task;
         or 
            accept Print_Scheduler_Tasks;
            
            Put_Line("Occupied indexes of array");
            for I of Occupied_Array_Indexes loop
               Put_Line(My_Index'Image(I));
            end loop;
            
            Put_Line("List of tasks");
            for I of Occupied_Array_Indexes loop
               Put_Line ("Task from index " & My_Index'Image(I));
               My_Task_Pool(I).Task_Pointer.Print;
            end loop;
         else
            
            if Is_Empty(Occupied_Array_Indexes) then
               Put_Line("Waiting for task");
               delay 1.0;
            else
               if Scheduled_Task >= Integer(Occupied_Array_Indexes.Length) then
                  Scheduled_Task := 0;
               end if; 
               
               Put_Line ("Working on task");
               Operated_Index := Integer(Occupied_Array_Indexes.Element(Scheduled_Task));
               My_Task_Pool(My_Index(Operated_Index)).Task_Pointer.Run;
               Scheduled_Task := Scheduled_Task + 1;
            end if;
         end select;
         Put_Line("");
      end loop;
   end My_Scheduler;
   
end Scheduler_Package;
