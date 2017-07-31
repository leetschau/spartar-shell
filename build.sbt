import Dependencies._

lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "com.biot",
      scalaVersion := "2.10.6",
      version      := "0.1.0-SNAPSHOT"
    )),
    name := "SpShell",
    libraryDependencies += "org.apache.spark" %% "spark-core" % "1.6.3",
    libraryDependencies += "org.apache.spark" %% "spark-sql" % "1.6.3",
    libraryDependencies += scalaTest % Test
  )
