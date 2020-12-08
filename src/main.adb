with Ada.Text_IO; use Ada.Text_IO;
with Task_Package; use Task_Package;
with Scheduler_Package; use Scheduler_Package;

procedure Main is
   V_Scheduler1 : My_Scheduler_Access;
begin
   V_Scheduler1 := new My_Scheduler;
   V_Scheduler1.New_Task(1, 10);
   V_Scheduler1.New_Task(2, 10);
   --  V_Scheduler1.New_Task(4, 10);
   V_Scheduler1.Kill_Task(10);
   V_Scheduler1.Print_Scheduler_Tasks;
   --  V_Scheduler1.New_Task(5, 10);

   delay 999.0;
end Main;
