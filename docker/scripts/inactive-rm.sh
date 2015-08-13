docker ps -a | grep -v 'Up' | awk '{print $1}' | xargs --no-run-if-empty docker rm
