$cwd = (Resolve-Path .\).Path
echo $PSScriptRoot

docker.exe run --rm -ti -v ${cwd}:/tmp/source --workdir /tmp/source --network=cliusingmysql_default --entrypoint bash --cap-add SYS_PTRACE cliusingmysql_php-cli 
