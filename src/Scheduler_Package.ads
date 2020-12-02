package Scheduler_Package is
   task type My_Scheduler is
      entry New_Task(PID: Integer; Complexicity: Integer);
      entry Kill_Task;
      entry Print_Scheduler_Tasks;
   end My_Scheduler;

   type My_Scheduler_Access is access My_Scheduler;
end Scheduler_Package;
