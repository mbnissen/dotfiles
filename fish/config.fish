source /usr/local/opt/asdf/asdf.fish

function today
  command icalBuddy -f sd eventsToday
end

function dbase
  cd ~/Repos/Microservices/development-environment
  ./dev.sh up -d postgres redis rabbitmq
end

function gitclean
  git branch | grep -v "master" | xargs git branch -D
end

function _install_eslint
  npm install -D @coinify/eslint-config-coinify
  npx install-peerdeps --dev @coinify/eslint-config-coinify
  printf '{\n  "extends": "@coinify/eslint-config-coinify"\n}' >> .eslintrc
end
