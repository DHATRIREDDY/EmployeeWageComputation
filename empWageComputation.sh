#!/bin/bash -x
declare -A days
echo "Welcome to Employee Wage Computation Program"  
isPartTime=1
isFullTime=2
MAX_HRS_IN_MONTH=10
EMP_RATE_PER_HR=20
NUM_WORKING_DAYS=20

totalEmpHrs=0
totalWorkingDays=0
counter=0
day_number=1
function getWorkingHours(){
	case $1 in
		$isFullTime)
			workHours=8;;
		$isPartTime)
			workHours=4;;
		*)
			workHours=0;;
	esac
	echo $workHours
}
while [ $totalEmpHrs -lt $MAX_HRS_IN_MONTH ] && [ $totalWorkingDays -lt $NUM_WORKING_DAYS ]
do
	((totalWorkingDays++))
	workHours="$(getWorkingHours $(( RANDOM%3 )) )"
	dailywages[((counter))]=$(( $workHours*20 ))
        counter=$(( $counter+1 ))
	days[$day_number]=$(( $workHours*20 ))
	day_number=$(( $day_number+1 ))
	totalworkHours=$(( $totalworkHours+$workHours ))
done
totalSalary=$(( $totalworkHours*$EMP_RATE_PER_HR ))
for index in ${!days[@]}
do
	echo "Wage of day $index is "${days[$index]}
done
