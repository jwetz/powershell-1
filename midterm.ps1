$targetmachines = get-content c:\scripts\midterm_target_machines.txt
$outpath = 'c:\scripts\midtermreports'

if (!(test-path $outpath)) { mkdir $outpath }


$targetmachines | foreach {
  $outfile = $outpath + '\' + $_ + '-INV-' + (get-date -format 'MM-dd-yyyy') + '.txt'


  #write out name of machine
  #write out os version
  #write out processor information
  #write out pysical memory
  #write out roles and features
  #write out whether remote desktp is enabled
  
  $logs = System,Application
  $loglevels = 1,2
  foreach ($log in $logs) {
    foreach ($level in $loglevels) {
      Get-WinEvent -FilterHashtable @{Logname="$log";Level="$level"} -maxevents 5
    }
  }
  #write out last 5 warnings and errors from system log
  #write out last 5 warnings and errors from application log
}
