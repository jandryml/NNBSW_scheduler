with Ada.Text_IO; use Ada.Text_IO;
with Task_Package; use Task_Package;
with Scheduler_Package; use Scheduler_Package;

procedure Main is
   --  V_Task1, V_Task2 : My_Task_Access;

   V_Scheduler1 : My_Scheduler_Access;
   --
   --
   --
   --  type Task_Pool_Element is record
   --     PID : Integer;
   --     IsPresent : Boolean := False;
   --     Task_Pointer : My_Task_Access;
   --  end record;
   --
   --  type Task_Pool_Element_Access is access Task_Pool_Element;
   --
   --  type My_Index is range 1 .. 101;
   --
   --  type Task_Pool_Array is array (My_Index) of Task_Pool_Element_Access;
   --  My_Task_Pool : Task_Pool_Array;
   --  type Task_Pool_Flags is array (My_Index) of Boolean;
   --  My_Task_Pool_Flags : Task_Pool_Flags := (others => False);
   --
   --  Operated_Task : My_Task_Access;

begin

   V_Scheduler1 := new My_Scheduler;
   V_Scheduler1.New_Task(1, 3);
   V_Scheduler1.Print_Scheduler_Tasks;



   --  Operated_Task := new My_Task;
   --  Operated_Task.Init(1, 3);
   --
   --  for I in My_Index loop
   --     Put_Line ("Looping " & My_Index'Image(I));
   --     if not My_Task_Pool_Flags(I) then
   --        Put_Line ("Adding element " & Integer'Image(1));
   --        My_Task_Pool(I) := new Task_Pool_Element;
   --        Put_Line ("Adding element " & Integer'Image(2));
   --        My_Task_Pool(I).PID := 1;
   --        Put_Line ("Adding element " & Integer'Image(3));
   --        My_Task_Pool(I).IsPresent := True;
   --        Put_Line ("Adding element " & Integer'Image(4));
   --        My_Task_Pool(I).Task_Pointer := Operated_Task;
   --        Put_Line ("Adding element " & Integer'Image(5));
   --        exit;
   --     end if;
   --  end loop;

   --  Put_Line ("Task with PID " & Integer'Image(PID) & " was added to scheduler.");

   --  V_Task1 := new My_Task;
   --  V_Task1.Init(1, 3);
   --  V_Task2 := new My_Task;
   --  V_Task2.Init(5, 5);
   --  V_Task2.Run;
   --
   --
   --  Put_Line ("Adding tasks.");
   --  Task_Pool(1) := V_Task1;
   --  Task_Pool(2) := V_Task2;
   --
   --  Put_Line ("Printing tasks.");
   --
   --  V_Task1.Print;
   --  V_Task2.Print;
   --
   --  V_Task1.Init(1, 3);
   --
   --  for I in My_Index loop
   --     Task_Pool(I).Print;
   --  end loop;
   --
   --  for I in My_Index loop
   --     Task_Pool(I).Print;
   --  end loop;


   --  Put_Line ("In Main");
   --
   --  V_Task1 := new My_Task;
   --  V_Task2 := new My_Task;
   --
   --
   --  V_Task1.Init(1, 3);
   --  V_Task1.Run;
   --  V_Task1.Run;
   --  V_Task1.Run;
   --
   --
   --  V_Task2.Init(2, 3);
   --  V_Task2.Run;

   --
   --
   --  Scheduler.T.New_Task;
   --  delay 5.0;
   --  Scheduler.T.New_Task;
   --
   --  delay 15.0;
   --  V_TASK1 := new My_Task;
   --
   --  V_TASK2 := new My_Task;

   --  Q_MULTITHREADING.P_EXECUTE_NO_ENTRY;
   null;
end Main;
