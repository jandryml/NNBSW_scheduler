with Ada.Text_IO; use Ada.Text_IO;
with Task_Package; use Task_Package;
with Scheduler_Package;

procedure Main is
   V_Task1, V_Task2 : My_Task_Access;
   type My_Index   is range 1 .. 15;
   Task_Pool : array (My_Index) of Task_Package.My_Task_Access;
begin

   V_Task1 := new My_Task;
   V_Task1.Init(1, 3);
   V_Task2 := new My_Task;
   V_Task2.Init(5, 5);
   V_Task2.Run;


   Put_Line ("Adding tasks.");
   Task_Pool(1) := V_Task1;
   Task_Pool(2) := V_Task2;

   Put_Line ("Printing tasks.");

   --
   --  V_Task1.Print;
   --  V_Task2.Print;

        for I in My_Index loop
Task_Pool(I).Print;
   end loop;

           for I in My_Index loop
Task_Pool(I).Print;
end loop;


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
