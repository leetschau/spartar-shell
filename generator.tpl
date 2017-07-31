package com.biot.spshell

import org.apache.spark.{SparkConf, SparkContext}
import org.apache.spark.sql.{DataFrame, SQLContext}
import org.apache.spark.sql.functions.{lit, udf}

import org.apache.spark.sql.types.{StructType,StructField,StringType,IntegerType};
import org.apache.spark.sql.Row;

class SPShell(spc: SparkContext) extends Serializable {
  @transient val sc = spc
  val sqlContext = new SQLContext(sc)
  import sqlContext.implicits._
  def readfile(inp: String): DataFrame = {
    val csv = sc.textFile(inp)
    val rows = csv.map(line => line.split(",").map(_.trim))
    val header = rows.first
    val data = rows.filter(_(0) != header(0))
    val rdd = data.map(row => Row(row(0),row(1).toInt))

    val schema = new StructType()
        .add(StructField("X", StringType, true))
        .add(StructField("Y", IntegerType, true))
    sqlContext.createDataFrame(rdd, schema)
  }

  def run() = {
  }
}

object SPShell extends App {
  val conf = new SparkConf().setAppName("SPShell").setMaster("local[2]")
  val sc = new SparkContext(conf)
  val sqlContext = new SQLContext(sc)
  import sqlContext.implicits._

  val spshell = new SPShell(sc)
  val df1 = spshell.readfile("./data/--inp1--.csv")
  val df2 = spshell.readfile("./data/--inp2--.csv")
  val f1 = udf(--f1--)
  val f2 = udf(--f2--)
  val res1 = df1.withColumn("sum", f1($"X", $"Y"))
  val res2 = df2.withColumn("prod", f2($"X", $"Y"))
  res1.show
  res2.show
}
