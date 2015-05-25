#!/bin/bash

## Load settings
source /usr/share/univention-helper-tools/settings.conf
source "${UCSHTCORE}/functions.ucs"

# while getopts ':cmbrcp:' OPTION ; do
#   case "$OPTION" in
# 	c)	echo "Performing base checks..."
# 		checks;;
# 	m)   echo "Try to mount"
# 		mount;;
# 	p)   echo "Backup path is: $OPTARG";;
# 	r)   echo "Ok, do a restore";;
# 	c)   echo "Ok, tidy up afterwards";;
# 	*)   echo "Unknown parameter"
#   esac
# done


##	@var	option		description
##	-m	nA		mount tools
while getopts ":m" opt; do
	case $opt in
		m)
			###########
			## Mount ##
			###########
			echo "Launch mounting features";

			while getopts ":n:d:c:h" opt; do
				case $opt in
					n)
						echo "Set nfs source, Parameter: $OPTARG";
						NVAR=$OPTARG;
						;;
					d)
						echo "Set mount destination, Parameter: $OPTARG";
						DVAR=$OPTARG;
						;;
					\?)
						echo "Unknown parameter: $OPTARG";
						exit 1
						;;
					:)
						echo "Option -$OPTARG requires an argument. Use -m -h for the help screen.";
						exit 1
						;;
					h)
						echo "";
						echo "++++ Help ++++";
						echo "-n [nfs source]		Set the nfs source. Eg. 10.10.10.10:/share";
						echo "-d [destination]	Directory";
						echo "-c			Use the config vars to set the mountpoints";
						echo "";
						exit 1
						;;
				esac
			done

			## Nothing selected, use settings from config file
			if [[ ( "$NVAR" != "" && "$DVAR" != "") ]]; then
				echo "";
				echo "Set mountpoint using custom vars";
				nfsmount ${NVAR} ${DVAR}
			else
				echo "";
				echo "Set mountpoint using vars from settings.conf";
				nfsmount ${NFSSOURCE} ${NFSMOUNTDIR}
			fi
			;;
		\?)
			echo "Invalid option: -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "Option -$OPTARG requires an argument." >&2
			exit 1
			;;
	esac
done