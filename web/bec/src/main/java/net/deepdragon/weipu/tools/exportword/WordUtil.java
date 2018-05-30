package net.deepdragon.weipu.tools.exportword;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;
import freemarker.template.Configuration;
import freemarker.template.Template;
/**
 * Explain:
 * FileName:
 * Author: TianYu
 * Time: 2016-08-05 14:32
 * Desc:
 * Version: V1.0
 */
public class WordUtil {
    public static File createWord(String projectPath, Map<String, Object> dataMap,String templateName){
        File outFile = null;
        try {
            //创建配置实例
            Configuration configuration = new Configuration();

            //设置编码
            configuration.setDefaultEncoding("UTF-8");

            //ftl模板文件统一放至 com.lun.template 包下面
            configuration.setClassForTemplateLoading(WordUtil.class,"/template/ftl/");

            //获取模板
            Template template = configuration.getTemplate(templateName);

            //输出文件
            String name = projectPath + "/export/temp" + (int) (Math.random() * 100000) + ".doc";
            outFile = new File(name);

            //如果输出目标文件夹不存在，则创建
            if (!outFile.getParentFile().exists()){
                outFile.getParentFile().mkdirs();
            }

            //将模板和数据模型合并生成文件
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8"));


            //生成文件
            template.process(dataMap, out);

            //关闭流
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return outFile;
    }
}
