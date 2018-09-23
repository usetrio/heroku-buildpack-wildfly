# Heroku Wildfly Buildpack + MySQL module

This is a [Heroku Buildpack](https://devcenter.heroku.com/articles/buildpacks) for running [Wildfly AS](http://wildfly.org).

## Usage

1. Set the MySQL env variables:
- MYSQL_DB_HOST # e.g. jdbc:mysql://127.0.0.1:3306/gsf_project?useLegacyDatetimeCode=false&serverTimezone=UTC
- MYSQL_DB_USER # e.g. root
- MYSQL_DB_PASS # e.g. root

2. Put your WAR file(s) in `target/` and deploy.

## Using with the Java buildpack

You can use the standard Heroku Java buildpack to compile your WAR file, and then have Wildfly run it:

```sh-session
$ heroku buildpacks:clear
$ heroku buildpacks:add heroku/java
$ heroku buildpacks:add https://github.com/codigo5/heroku-buildpack-wildfly
```

Then deploy your Maven project with a `pom.xml`, Heroku will run the Java buildpack to compile it, and as long as you output a `target/*.war` file the Wildfly buildpack will run it.
