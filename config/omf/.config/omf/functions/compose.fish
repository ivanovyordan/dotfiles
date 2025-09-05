function compose --description "Control docker compose projects."
  function _usage
    echo "Usage: compose {start|stop}"
  end

  function _rancher
    rdctl start

    while not docker info > /dev/null 2>&1
        sleep 2
    end
  end

  function _start
    echo "Starting Rancher Desktop..."
    _rancher

    echo "Building Docker containers..."
    docker compose build

    echo "Starting App container..."
    docker compose up -d --remove-orphans
  end

  function _stop
    echo "Stopping Docker containers..."
    docker compose down

    echo "Stoping Rancher Desktop..."
    rdctl shutdown

    echo "Cleanup complete."
  end

  switch $argv[1]
      case start
          _start
      case stop
          _stop
      case '*'
        _usage
  end

  functions -e _start _stop _usage
end
