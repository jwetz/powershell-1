#$targetmachines = get-adcomputer -filter *
#$targetmachines = hostname
$targetmachines = get-content c:\scripts\midterm_target_machines.txt

$targetmachines | foreach {
  #create output file for this machine's report
  #write out name of machine
  #write out os version
  #write out processor information
  #write out pysical memory
  #write out roles and features
  #write out whether remote desktp is enabled
  #write out last 5 warnings and errors from system log
  #write out last 5 warnings and errors from application log
}







$PhysicalRAM = (Get-WMIObject -class Win32_PhysicalMemory -ComputerName $Computer | Measure-Object -Property capacity -Sum | % {[Math]::Round(($_.sum / 1GB),2)})
