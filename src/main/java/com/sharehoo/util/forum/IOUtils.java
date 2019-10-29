package com.sharehoo.util.forum;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** 文件的工具类 */
public class IOUtils {
  /** 一次性将文件读取到数组中 */
  public static byte[] read(String file) throws IOException {
    return read(new File(file));
  }

  public static byte[] read(File file)
      throws IOException {
    // 按照文件大小 创建返回byte[]数组
    byte[] buf = new byte[(int) file.length()];
    // 用RAF只读打开文件
    RandomAccessFile raf = new RandomAccessFile( file, "r");
    // 使用 raf.read(byte[]) 读取全部内容
    raf.read(buf);
    // 关闭文件
    raf.close();
    return buf;
  }

  /** 复制文件, 复制in到out */
  public static void cp(String in, String out)
      throws IOException {
    cp(new File(in), new File(out));
  }

  public static void cp(File in, File out)
      throws IOException {
    InputStream fin = new FileInputStream(in);// 可以使用File构造
    OutputStream fout = new FileOutputStream(
        out);
    cp(fin, fout);
    fin.close();
    fout.close();// 关闭
  }

  /** 复制文件, 复制in到out, 不关闭流 */
  public static void cp(InputStream in,
      OutputStream out) throws IOException {
    byte[] buf = new byte[1024 * 1024];// 512K缓冲
    int count;
    while ((count = in.read(buf)) != -1) {// 读取到buf
      // System.out.println(count);//
      out.write(buf, 0, count); // 写入到输出流
    }
    out.flush(); // 刷出缓冲到目标流
  }

  /** 不开缓冲 */
  public static void cp2(InputStream in,
      OutputStream out) throws IOException {
    int b;
    while ((b = in.read()) != -1) { // 读取一个byte
      out.write(b); // 写入到输出流
    }
    out.flush(); // 刷出缓冲到目标流
  }

  public static byte[] read(InputStream in)
      throws IOException {
    byte[] buf = new byte[in.available()];
    in.read(buf);
    in.close();
    return buf;
  }

  public static String toHexString(byte[] ary) {
    if (ary == null || ary.length == 0)
      return "";
    StringBuilder buf = new StringBuilder();
    if ((ary[0] & 0xff) <= 0xf) {
      buf.append("0");
    }
    buf.append(Integer
        .toHexString(ary[0] & 0xff));
    for (int i = 1; i < ary.length; i++) {
      buf.append(",");
      if ((ary[i] & 0xff) <= 0xf) {
        buf.append("0");
      }
      buf.append(Integer
          .toHexString(ary[i] & 0xff));
    }
    return buf.toString();
  }

  public static String readHexString(
      String filename) throws IOException {
    return toHexString(read(filename));
  }

  /**
   * 将文件切分为 指定大小的系列文件 如: IOUtiles.split("test.zip", 1024) 将文件 test.zip 切分为
   * 1024K(1M) 大小的 系列文件 : test.zip.0, test.zip.1,...
   * 
   * @param filename
   *          源文件名
   * @param size
   *          文件大小, 以k为单位
   */
  public static void split(String file,
      int size) throws IOException {
    if (size <= 0) {
      throw new IllegalArgumentException(
          "搞啥呀!");
    }
    int idx = 0;// 文件的序号
    InputStream in = new BufferedInputStream(
        new FileInputStream(file));
    OutputStream out = new BufferedOutputStream(
        new FileOutputStream(file + "."
            + idx++));
    int b;
    int count = 0;
    while ((b = in.read()) != -1) {
      out.write(b);
      count++;
      if (count % (size * 1024) == 0) {
        out.close();
        out = new BufferedOutputStream(
            new FileOutputStream(file + "."
                + idx++));
      }
    }
    in.close();
    out.close();
  }

  /**
   * 连接上面方法的系列文件为一个文件 如: IOUtiles.join("test.zip.0"); 在硬盘上生成一个没有序号的文件: test.zip
   * 
   * @param basename
   *          第一个文件, 如test.zip.0
   */
  public static void join(String file)
      throws IOException {
    String filename = file.substring(0, file
        .lastIndexOf("."));
    String num = file.substring(file
        .lastIndexOf(".") + 1);
    int idx = Integer.parseInt(num);
    OutputStream out = new FileOutputStream(
        filename);
    File f = new File(filename + "." + idx++);
    while (f.exists()) {
      InputStream in = new FileInputStream(f);
      cp(in, out);
      in.close();
      f = new File(filename + "." + idx++);
    }
    out.close();
  }

  /**
   * 将对象序列化到数组中 可以使用变长数组实现, 或者ByteArrayOutputStream实现
   * 
   * @param obj
   *          一个实现序列化接口的对象
   * @return 数组对象
   * @throws IOException
   */
  public static byte[] serialize(
      Serializable obj) throws IOException {
    ByteArrayOutputStream os = new ByteArrayOutputStream();
    ObjectOutputStream out = new ObjectOutputStream(
        os);

    out.writeObject(obj);// 对象序列化, foo
    out.close();
    byte[] ary = os.toByteArray();
    return ary;
  }

  /**
   * 反序列化byte数组 到对象
   * 
   * @param ary
   * @return
   * @throws IOException
   * @throws ClassNotFoundException
   */
  public static Object unserialize(byte[] data)
      throws IOException,
      ClassNotFoundException {
    ObjectInputStream in = new ObjectInputStream(
        new ByteArrayInputStream(data));
    Object o = in.readObject();// 反序列化
    in.close();
    return o;
  }

  /**
   * 获取目录的全部文件
   * 
   * @param dir
   * @return
   */
  public static List<File> listFile(File dir) {
    File[] files = dir
        .listFiles(new FileFilter() {
          public boolean accept(File pathname) {
            return pathname.isFile();
          }
        });
    return new ArrayList<File>(Arrays
        .asList(files));
  }

  /**
   * 获取目录的全部文件, 指定扩展名的文件
   * 
   * @param dir
   * @return
   */
  public static List<File> listFile(File dir,
      final String ext) {

    File[] files = dir
        .listFiles(new FileFilter() {
          public boolean accept(File pathname) {
            return pathname.isFile()
                && pathname.getName()
                    .endsWith(ext);
          }
        });
    return new ArrayList<File>(Arrays
        .asList(files));
  }

  /**
   * 递归获取目录的全部文件
   * 
   * @param dir
   * @return
   */
  public static List<File> listAll(File dir) {
    List<File> all = listFile(dir);
    File[] subs = dir
        .listFiles(new FileFilter() {
          public boolean accept(File pathname) {
            return pathname.isDirectory();
          }
        });
    for (File sub : subs) {
      all.addAll(listAll(sub));
    }
    return all;
  }

  /**
   * 递归获取目录的全部文件, 指定扩展名的文件
   * 
   * @param dir
   * @return
   */
  public static List<File> listAll(File dir,
      String ext) {
    List<File> all = listFile(dir, ext);
    File[] subs = dir
        .listFiles(new FileFilter() {
          public boolean accept(File pathname) {
            return pathname.isDirectory();
          }
        });
    for (File sub : subs) {
      all.addAll(listAll(sub, ext));
    }
    return all;
  }

  public static String readLine(InputStream in)
      throws IOException {
    ByteArrayOutputStream out = 
      new ByteArrayOutputStream();
    int b;
    while (true) {
      b = in.read();
      if (b == '\n' || b == '\r' || b == -1) {// 编码是否是回车换行
        break;
      }
      out.write(b);
    }
    return new String(out.toByteArray());
  }

  /**
   * 从流中读取一行文本, 读取到一行的结束为止
   * 
   * @param in
   * @return 一行文本
   */
  public static String readLine(
      InputStream in, String charset)
      throws IOException {
    byte[] buf = {};
    int b;
    while (true) {
      b = in.read();
      if (b == '\n' || b == '\r' || b == -1) {// 编码是否是回车换行
        break;
      }
      buf = Arrays.copyOf(buf, buf.length + 1);
      buf[buf.length - 1] = (byte) b;
    }
    if (buf.length == 0 && b == -1)
      return null;
    return new String(buf, charset);
  }

  /**
   * 将text追加到文件 filename的尾部 使用系统默认文本编码
   */
  public static void println(String filename,
      String text) throws IOException {
    println(new File(filename), text);
  }

  public static void println(File file,
      String text) throws IOException {
    OutputStream out = new FileOutputStream(
        file, true);
    println(out, text);
    out.close();
  }

  /**
   * 向流中输出一行字符串, 使用默认编码 不关闭流
   * 
   * @param out
   *          目标流
   * @param text
   *          文本
   * @throws IOException
   */
  public static void println(OutputStream out,
      String text) throws IOException {
    out.write(text.getBytes());
    out.write('\n');
    out.flush();
  }

  /**
   * 向流中输出一行字符串, 使用指定的编码 不关闭流
   * 
   * @param out
   *          目标流
   * @param text
   *          文本
   * @param charset
   *          指定的编码
   * @throws IOException
   */
  public static void println(OutputStream out,
      String text, String charset)
      throws IOException {
    out.write(text.getBytes(charset));
    out.write('\n');
  }
}