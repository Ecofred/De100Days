## load the .env file as environment variables in powershell
get-content .env | ForEach-Object {
    $name, $value = $_.split('=')
    set-content env:\$name $value
}

## docker is installed

## use Express edition
## how to specify the container name with docker run
## also https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-powershell
## but use an .env file to load the environment variables
## it runs in the detached mode with -d
## the -p 1433:1444
docker run `
    --env-file .\.env `
    <# host_port:container_port ... #>
    -p "$($env:MSSQL_HOST_PORT):1433" `
    -d --name SS100days mcr.microsoft.com/mssql/server:2019-latest

## map the port 1433 to 1444

## check the logs
docker logs SS100days

## stop the container
docker stop SS100days
## and remove it
docker rm SS100days

# setup the sqlcmd environment variables
$env:SQLCMDPASSWORD = $env:MSSQL_SA_PASSWORD
$env:SQLCMDSERVER = "localhost,$env:MSSQL_HOST_PORT"
$env:SQLCMDUSER = 'SA'
$env:SQLCMDDBNAME = $env:MSSQL_DATABASE
## test the connect to the sql server with sqlcmd
sqlcmd -Q "SELECT @@VERSION" -d master

# run the sql script to create the database
sqlcmd -i ./sql/create_database.sql -d master

# test the connection to the database
sqlcmd -i ./sql/query_2_first_table.sql -e -F vertical

