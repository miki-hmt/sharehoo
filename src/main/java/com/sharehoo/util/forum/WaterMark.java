package com.sharehoo.util.forum;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import javax.imageio.ImageIO;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
 
/*
 * miki
 * 2017.05.28
 * 上传图片添加水印功能
 */



public final class WaterMark {
public WaterMark() {

}

/**
 * public final static String getPressImgPath() { return ApplicationContext
 * .getRealPath("/template/data/util/shuiyin.gif"); }
 */

/**
 * 把图片印刷到图片上
 * 
 * @param pressImg --
 *            水印文件
 * @param targetImg --
 *            目标文件
 * @param x
 *            --x坐标
 * @param y
 *            --y坐标
 */
public final static void pressImage(String pressImg, String targetImg,
        int x, int y) {
    try {
        //目标文件
        File _file = new File(targetImg);
        Image src = ImageIO.read(_file);
        int wideth = src.getWidth(null);
        int height = src.getHeight(null);
        BufferedImage image = new BufferedImage(wideth, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics g = image.createGraphics();
        g.drawImage(src, 0, 0, wideth, height, null);

        //水印文件
        File _filebiao = new File(pressImg);
        Image src_biao = ImageIO.read(_filebiao);
        int wideth_biao = src_biao.getWidth(null);
        int height_biao = src_biao.getHeight(null);
        g.drawImage(src_biao, (wideth - wideth_biao) / 2,
                (height - height_biao) / 2, wideth_biao, height_biao, null);
        //水印文件结束
        g.dispose();
        FileOutputStream out = new FileOutputStream(targetImg);
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        encoder.encode(image);
        out.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

/**
 * 打印文字水印图片
 * 
 * @param pressText
 *            --文字
 * @param targetImg --
 *            目标图片
 * @param fontName --
 *            字体名
 * @param fontStyle. --
 *            字体样式
 * @param color --
 *            字体颜色
 * @param fontSize --
 *            字体大小
 * @param x --
 *            偏移量
 * @param y
 */

public static void pressText(String pressText, String targetImg,
        String fontName, int fontStyle, int color, int fontSize, int x,
        int y) {
    try {
        File _file = new File(targetImg);
        Image src = ImageIO.read(_file);
        int wideth = src.getWidth(null);
        int height = src.getHeight(null);
        BufferedImage image = new BufferedImage(wideth, height,
                BufferedImage.TYPE_INT_RGB);
        Graphics g = image.createGraphics();
        g.drawImage(src, 0, 0, wideth, height, null);
        
        g.setColor(Color.RED);
        g.setFont(new Font(fontName, Font.ITALIC, fontSize));	//字体设为斜体  	2017.05.28

        g.drawString(pressText, wideth - fontSize - x, height - fontSize
                / 2 - y);
        g.dispose();
        FileOutputStream out = new FileOutputStream(targetImg);
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        encoder.encode(image);
        out.close();
    } catch (Exception e) {
        System.out.println(e);
    }
}

public static void main(String[] args) {
    pressText("sharehoo.cn","e:/water.jpg","宋体",1,2,25, 160, 200);
}
}
