#!/bin/sh

HOST="$1"

ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.11 docker stack rm dclou'

mvn -oStrictHostKeyChecking=no -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn -s .travis.settings.xml -B deploy -DdeployDocker

ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.11 "docker images --format {{.ID}} | xargs docker rmi -f"'
ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.21 "docker images --format {{.ID}} | xargs docker rmi -f"'
ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.22 "docker images --format {{.ID}} | xargs docker rmi -f"'

ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.11 rm -rf platform demogpb'
ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.11 git clone https://github.com/dclou/platform'
ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.11 git clone https://github.com/dclou/demogpb'
ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.11 "cd platform && ./run.sh"'
ssh -oStrictHostKeyChecking=no -p50022 user@$HOST 'ssh user@10.10.50.11 "cd demogpb && ./run.sh"'
