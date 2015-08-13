docker ps -l | grep 'ago' | awk '{print $1}' | xargs --no-run-if-empty docker logs
