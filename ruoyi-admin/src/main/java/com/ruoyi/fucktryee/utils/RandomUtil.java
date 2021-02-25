package com.ruoyi.fucktryee.utils;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.math3.random.RandomDataGenerator;

/**
 * @ClassName: RandomUtil
 * @Description: 随机数工具类
 * (分别使用java.util.Random、Apache Common Math3、Apache Common Lang3、TreadLocalRandom)
 */
public class RandomUtil {
    /**
     * 随机数Int的生成
     */
    // 随机数生成无边界的Int
    public static int getRandomForIntegerUnbounded() {
        int intUnbounded = new Random().nextInt();
        System.out.println(intUnbounded);
        return intUnbounded;
    }

    // 生成有边界的Int
    public static int getRandomForIntegerBounded(int min, int max) {
        int intBounded = min + ((int) (new Random().nextFloat() * (max - min)));
        System.out.println(intBounded);
        return intBounded;
    }

    // 包含1而不包含10
    // 使用Apache Common Math3来生成有边界的Int
    public static int getRandomForIntegerBounded2(int min, int max) {
        int intBounded = new RandomDataGenerator().nextInt(min, max);
        System.out.println(intBounded);
        return intBounded;
    }

    // 包含1且包含10
    // 使用Apache Common Lang3的工具类来生成有边界的Int
    public static int getRandomForIntegerBounded3(int min, int max) {
        int intBounded = RandomUtils.nextInt(min, max);
       // System.out.println(intBounded);
        return intBounded;
    }

    // 使用TreadLocalRandom来生成有边界的Int,包含min而不包含max
    public static int getRandomForIntegerBounded4(int min, int max) {
        int threadIntBound = ThreadLocalRandom.current().nextInt(min, max);
        System.out.println(threadIntBound);
        return threadIntBound;
    }

    /**
     * 随机数Long的生成
     */
    // 随机数生成无边界的Long
    public static long getRandomForLongUnbounded() {
        long unboundedLong = new Random().nextLong();
        System.out.println(unboundedLong);
        return unboundedLong;
    }

    // 因为Random类使用的种子是48bits，所以nextLong不能返回所有可能的long值，long是64bits。
    // 使用Random生成有边界的Long
    public static long getRandomForLongBounded(long min, long max) {
        long rangeLong = min + (((long) (new Random().nextDouble() * (max - min))));
        System.out.println(rangeLong);
        return rangeLong;
    }

    // 使用Apache Commons Math3来生成有边界的Long(RandomDataGenerator类提供的生成随机数的方法)
    public static long getRandomForLongBounded2(long min, long max) {
        long rangeLong = new RandomDataGenerator().nextLong(min, max);
      //  System.out.println(rangeLong);
        return rangeLong;
    }

    // 使用Apache Commons Lang3的工具类来生成有边界的Long(RandomUtils提供了对java.util.Random的补充)
    public static long getRandomForLongBounded3(long min, long max) {
        long longBounded = RandomUtils.nextLong(min, max);
        System.out.println(longBounded);
        return longBounded;
    }

    // 使用ThreadLocalRandom生成有边界的Long
    public static long getRandomForLongBounded4(long min, long max) {
        long threadLongBound = ThreadLocalRandom.current().nextLong(min, max);
        System.out.println(threadLongBound);
        return threadLongBound;
    }

    /**
     * 随机数Float的生成
     */
    // 随机数Float的生成生成0.0-1.0之间的Float随机数
    public static float getRandomForFloat0To1() {
        float floatUnbounded = new Random().nextFloat();
        System.out.println(floatUnbounded);
        return floatUnbounded;
    }

    // 以上只会生成包含0.0而不包括1.0的float类型随机数生成有边界的Float随机数
    public static float getRandomForFloatBounded(float min, float max) {
        float floatBounded = min + new Random().nextFloat() * (max - min);
        System.out.println(floatBounded);
        return floatBounded;
    }

    // 使用Apache Common Math来生成有边界的Float随机数
    public static float getRandomForFloatBounded2(float min, float max) {
        float randomFloat = new RandomDataGenerator().getRandomGenerator().nextFloat();
        float generatedFloat = min + randomFloat * (max - min);
        System.out.println(generatedFloat);
        return generatedFloat;
    }

    // 使用Apache Common Lang来生成有边界的Float随机数
    public static float getRandomForFloatBounded3(float min, float max) {
        float generatedFloat = RandomUtils.nextFloat(min, max);
        System.out.println(generatedFloat);
        return generatedFloat;
    }

    // 使用ThreadLocalRandom生成有边界的Float随机数
    // ThreadLocalRandom类没有提供

    /**
     * 随机数Double的生成
     */
    // 生成0.0d-1.0d之间的Double随机数
    public static double getRandomForDouble0To1() {
        double generatorDouble = new Random().nextDouble();
        System.out.println(generatorDouble);
        return generatorDouble;
    }

    // 与Float相同，以上方法只会生成包含0.0d而不包含1.0d的随机数生成带有边界的Double随机数
    public static double getRandomForDoubleBounded(double min, double max) {
        double boundedDouble = min + new Random().nextDouble() * (max - min);
        System.out.println(boundedDouble);
        return boundedDouble;
    }

    // 使用Apache Common Math来生成有边界的Double随机数
    public static double getRandomForDoubleBounded2(double min, double max) {
        double boundedDouble = new RandomDataGenerator().getRandomGenerator().nextDouble();
        double generatorDouble = min + boundedDouble * (max - min);
        System.out.println(generatorDouble);
        return generatorDouble;
    }

    // 使用Apache Common Lang生成有边界的Double随机数
    public static double getRandomForDoubleBounded3(double min, double max) {
        double generatedDouble = RandomUtils.nextDouble(min, max);
        System.out.println(generatedDouble);
        return generatedDouble;
    }

    // 使用ThreadLocalRandom生成有边界的Double随机数
    public static double getRandomForDoubleBounded4(double min, double max) {
        double generatedDouble = ThreadLocalRandom.current().nextDouble(min, max);
        System.out.println(generatedDouble);
        return generatedDouble;
    }
}