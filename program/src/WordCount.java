import java.util.Arrays;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaSparkContext;

import scala.Tuple2;

// jar cvf wc.jar -C bin/ .
// spark-submit --class WordCount --master local wc.jar
// cat result/part-00000

public class WordCount {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: WordCount <inputPath> <outputPath>");
            System.exit(1);
        }

        String inputFile = args[0];
        String outputFile = args[1];

        SparkConf conf = new SparkConf().setAppName("WordCount");
        JavaSparkContext sc = new JavaSparkContext(conf);

        long t1 = System.currentTimeMillis();

        JavaRDD<String> data = sc.textFile(inputFile)
                                 .flatMap(s -> Arrays.asList(s.split(" ")).iterator());

        JavaPairRDD<String, Integer> counts = data
                .mapToPair(w -> new Tuple2<>(w, 1))
                .reduceByKey((c1, c2) -> c1 + c2);

        counts.saveAsTextFile(outputFile);

        long t2 = System.currentTimeMillis();
        System.out.println("======================");
        System.out.println("Time in ms: " + (t2 - t1));
        System.out.println("======================");

        sc.close();
    }
}
