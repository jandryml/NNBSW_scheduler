package Scheduler_Package is
   task type My_Scheduler is
      entry New_Task;
      entry Kill_Task;
   end My_Scheduler;

   type My_Scheduler_Access is access My_Scheduler;

end Scheduler_Package;
