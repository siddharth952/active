#!/bin/sh

ACTIVE_TIME=${ACTIVE_TIME:-120} # #Interval in secs
ACTIVE_EXERCISE_CONF="${ACTIVE_EXERCISE_CONF:-$HOME/.active}"

start_active() {
  #  Create file if not present
  if [ ! -f $ACTIVE_EXERCISE_CONF ]; then
    date +%s > $ACTIVE_EXERCISE_CONF
  fi

  # Compatible with the pervious file format
  next_time=$(($(tail -1 $ACTIVE_EXERCISE_CONF) + $ACTIVE_TIME))

  if [ $next_time -lt $(date +%s) ]; then
    echo -n "Take a break! 🏃‍♂[Y/N]"
    printf ":"
  fi
}

Y() {
  date +%s > $ACTIVE_EXERCISE_CONF
  echo "Exercise is important"
}

N() {
  next_time=$(($(cat $ACTIVE_EXERCISE_CONF) + $ACTIVE_TIME))
  next_date=""
  # Dif. flag for mac
  case "$(uname)" in
    'Darwin')
      next_date="$(date -r $next_time)"
      ;;
    *)
      next_date="$(date --date="@$next_time")"
      ;;
  esac

  echo "Next exercise at $next_date"
}
