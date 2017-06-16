#!/bin/sh

HOST="$1"

ssh user@$HOST 'ssh user@10.10.50.11 docker stack rm dclou'

mvn -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn -s .travis.settings.xml -B deploy -DdeployDocker

ssh user@$HOST 'ssh user@10.10.50.11 "docker images --format {{.ID}} | xargs docker rmi -f"'
ssh user@$HOST 'ssh user@10.10.50.21 "docker images --format {{.ID}} | xargs docker rmi -f"'
ssh user@$HOST 'ssh user@10.10.50.22 "docker images --format {{.ID}} | xargs docker rmi -f"'

ssh user@$HOST 'ssh user@10.10.50.11 rm -rf platform demogpb'
ssh user@$HOST 'ssh user@10.10.50.11 git clone https://github.com/dclou/platform'
ssh user@$HOST 'ssh user@10.10.50.11 git clone https://github.com/dclou/demogpb'
ssh user@$HOST 'ssh user@10.10.50.11 "cd platform && ./run.sh"'
ssh user@$HOST 'ssh user@10.10.50.11 "cd demogpb && ./run.sh"'
