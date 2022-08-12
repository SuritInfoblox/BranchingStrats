#!/bin/sh

#First argument is the pattern matching keyword
#Second argument is the list of branches that needs to be ignored 
#For multiple branches use comma separate the values 

ExcludeBranches=$(echo "$2" | tr "," "|")
git pull origin
if [ -z "$ExcludeBranches" ]
  then 
	GitBranches=$(git branch -a | grep -i "$1" | awk -F "/" '{print $3}' | awk '{if(NF>0) {print $0}}')
else 
	GitBranches=$(git branch -a | grep -i "$1" | awk -F "/" '{print $3}' | awk '{if(NF>0) {print $0}}' | grep -v -i -E "$ExcludeBranches")
fi

if [ -z "$GitBranches" ]
 then
	 echo "No Branches found"
 else 
	 echo "$GitBranches" > logs.txt
	 Del=$(tr '\n' ' ' <logs.txt)
	 git push origin -d $Del

fi
