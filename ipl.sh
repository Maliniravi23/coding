TITLE="IPL point Table"
SEASON=2020
MATCHES_PLAYED=14
win=0
lose=0
points=0
nrr=""
position=0
rcbTeam=("kholi" "abd" "siraj")

echo "select the team"
echo "MI RCB CSK DC SRH KKR PBKS RR"
read teamName

teamName=`echo "$teamName" | awk '{print tolower($0)}'`

function showError(){
	echo " Can you recheck :) "
}


if [ $teamName == 'mi' ]
then
	position=1
elif [ $teamName == 'dc' ]
then
	position=2
elif [ $teamName == 'srh' ]
then    
        position=3
elif [ $teamName == 'rcb' ]
then    
        position=4
elif [ $teamName == 'kkr' ]
then    
        position=5
elif [ $teamName == 'pbks' ]
then    
        position=6
elif [ $teamName == 'csk' ]
then    
        position=7
elif [ $teamName == 'rr' ]
then    
        position=8
#else
#	echo "Its not a team"
else
	showError
fi

#echo "position----> $position"

function msg(){
	value=`echo "$value" | awk '{print toupper($0)}'`
        echo $value is a $3 of $2
}


function captain(){
	msg $value $2 'Captain'
}

function batsman(){
	msg $value $2 'Batsman'
}

function bowler(){
	msg $value $2 'Bowler'
}


function role(){
	if [ $2 == "RCB" ]
	then
		for value in ${rcbTeam[*]}
		do
			if [ $value == "kholi" ]
			then
				captain $value $2
			elif [ $value == "abd" ]
			then
				batsman $value $2
			elif [ $value == "siraj" ]
			then
				bowler $value $2
			else 
				echo "role is not present"
			fi
		done
	fi

 

}


function playOff(){
	if [[ $1 -ge 1 && $1 -le 4 ]]
	then
		echo " Congratulation team $2 for Playoff :)"
	else
		echo "Well played team $2"
	fi
}




function pointsCalculator(){
	lose=$((MATCHES_PLAYED-$2))
	points=$(($2*2))
	teamName=`echo "$teamName" | awk '{print toupper($0)}'`
	echo $TITLE
	echo $SEASON
	#echo "Team               matches         win lose runrate position"   
	echo $position $teamName $MATCHES_PLAYED $2 $lose $3 $points
	playOff $1 $teamName
	role $1 $teamName

}





case $position in
	1)
		win=9
		nrr="+1.107"
		pointsCalculator $position $win $nrr
		;;
	2)
		win=8
                nrr="-0.109"
                pointsCalculator $position $win $nrr
                ;;
	3)
		win=7
                nrr="+0.608"
                pointsCalculator $position $win $nrr
                ;;
	4)
		win=14
                nrr="-0.172"
                pointsCalculator $position $win $nrr
                ;;
	5)
		win=7
                nrr="-0.214"
                pointsCalculator $position $win $nrr
                ;;
	6)
		win=6
                nrr="-0.162"
                pointsCalculator $position $win $nrr
                ;;
	7)
		win=6
                nrr="-0.455"
                pointsCalculator $position $win $nrr
                ;;
	8)
		win=6
                nrr="-0.569"
                pointsCalculator $position $win $nrr
                ;;
esac
