FLAG_ARG=""
FLAG_NOARG=0
positionalArgs=()
positionalArgIndex=0

while (($# > 0)); do
    case "$1" in
	-f | --flagWithArg)
	    if [[ -z "$FLAG_ARG" ]]; then
		FLAG_ARG=$2
	    else
		echo "FLAG_ARG already set, skipping $1 $2"
	    fi
	    shift; shift
	    ;;
	--flagNoArg | -n)
	    FLAG_NOARG=1
	    echo "FLAG_NOARG set to 1"
	    shift
	    ;;
	*) # positional arguments
	    positionalArgs[positionalArgIndex]=$1
	    shift
	    positionalArgIndex=$positionalArgIndex+1
	    ;;
    esac
done

echo "FLAG_ARG is $FLAG_ARG"
echo "FLAG_NOARG is $FLAG_NOARG"
echo "Positional args: ${positionalArgs[@]}"
	
