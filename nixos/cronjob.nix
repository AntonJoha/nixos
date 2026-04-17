{ pkgs, inputs, lib, ... }:
{

 # Enable cron service
  services.cron = {
    enable = true;
    systemCronJobs = [
      "5 * * * * kentagent /home/kentagent/nixos/helper-scripts/todo --print-due"
    ];
  };

}
