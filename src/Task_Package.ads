package Task_Package is

   task type My_Task is
      entry Init(Thread_ID:Integer; Thread_Complexicity:Integer);
      entry Run;
      entry Print;
      entry Kill;
   end My_Task;

   type My_Task_Access is access My_Task;

end Task_Package;
