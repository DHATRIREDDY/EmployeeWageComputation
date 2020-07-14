#!/bin/bash -x
echo "Welcome to Employee Wage Computation Program"  
isPartTime=1
isFullTime=2
MAX_HRS_IN_MONTH=10
EMP_RATE_PER_HR=20
NUM_WORKING_DAYS=20

totalEmpHrs=0
totalWorkingDays=0

while [ $totalEmpHrs -lt $MAX_HRS_IN_MONTH ] && [ $totalWorkingDays -lt $NUM_WORKING_DAYS ]
do
	((totalWorkingDays++))
	empCheck=$(( RANDOM%3 ))
		case $empCheck in
			$isFullTime)
				empHrs=8
				;;
			$isPartTime)
				empHrs=4
				;;
			*)
			empHrs=0;;
		esac
		totalEmpHrs=$(( $totalEmpHrs+$empHrs ))
done
totalSalary=$(( $totalEmpHrs*$EMP_RATE_PER_HR ))

