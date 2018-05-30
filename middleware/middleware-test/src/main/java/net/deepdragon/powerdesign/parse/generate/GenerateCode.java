package net.deepdragon.powerdesign.parse.generate;

import com.alibaba.dubbo.common.utils.StringUtils;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import net.deepdragon.powerdesign.parse.bean.Project;
import net.deepdragon.powerdesign.parse.bean.Category;
import net.deepdragon.powerdesign.parse.bean.Table;
import net.deepdragon.powerdesign.parse.PDMParser;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by TianYu on 2015-05-21.
 */
public class GenerateCode {

    public static void main(String[] args) {
        try {
            Project project = PDMParser.parse(new File("D:/weipu.pdm"));

            List<Table> tableList = new ArrayList<Table>();

            for(Category category : project.getCategoryList()){
                List<Table> tables = category.getTableList();
                for(Table table : tables){
                    String comment= category.getComment();
                    if(comment.indexOf("#")>0 && comment.split("#").length == 3){
                        String[] str = comment.split("#");
                        table.setSign(str[0]);
                        table.setBasePackage(str[1]);
                        table.setSignPackage(str[2]);
                        tableList.add(table);
                    }
                }
            }

            project.setTableList( tableList );
            // 生成Entity、Dao、Service
            generate(project.getTableList());

            generateSpring(project);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected static void generateSpring(Project project) {

        Configuration cfg = new Configuration();
        try {

            String currentPath = PDMParser.class.getResource("/").getPath();
            File file1 = new File(currentPath);
            currentPath = file1.getParentFile().getPath();
            File file = new File(currentPath + File.separator + "test-classes/template");

            currentPath = file1.getPath();

            cfg.setDirectoryForTemplateLoading(file);
            cfg.setObjectWrapper(new DefaultObjectWrapper());
            cfg.setOutputEncoding("utf-8");
            // TODO 如何做国际化。
            cfg.setDefaultEncoding("utf-8");
            cfg.setNumberFormat("#");

            cfg.setCacheStorage(new freemarker.cache.MruCacheStorage(20, 250));

            File out = new File(currentPath).getParentFile().getParentFile();

            String filePath = out.getPath() + File.separator + "src"
                    + File.separator + "generate" + File.separator ;
            //生成MyBatis的Mapper文件
            Template template = cfg.getTemplate("spring.xml.ftl");

            File dir = new File(filePath + "spring");
            if (!dir.exists()) {
                dir.mkdirs();
            }
            FileWriter writer = new FileWriter(filePath + "spring" + File.separator
                    +  "spring.xml");
            template.process(project, writer);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected static void generate(List<Table> tables) {
        Configuration cfg = new Configuration();
        try {
            String currentPath = PDMParser.class.getResource("/").getPath();
            File file1 = new File(currentPath);
            currentPath = file1.getParentFile().getPath();
            File file = new File(currentPath + File.separator + "test-classes/template");

            currentPath = file1.getPath();

            cfg.setDirectoryForTemplateLoading(file);
            cfg.setObjectWrapper(new DefaultObjectWrapper());
            cfg.setOutputEncoding("utf-8");
            // TODO 如何做国际化。
            cfg.setDefaultEncoding("utf-8");
            cfg.setNumberFormat("#");

            cfg.setCacheStorage(new freemarker.cache.MruCacheStorage(20, 250));
            for (Table table : tables) {
                File out = new File(currentPath).getParentFile().getParentFile();

                String filePath = out.getPath() + File.separator + "src"
                        + File.separator + "generate" + File.separator + (StringUtils.isNotEmpty(table.getSign())?(table.getSign()+File.separator):"");

                // 判断entity包名是否存在，不存在新建
                String packageName = table.getBasePackage() + ".entity" +((StringUtils.isNotEmpty(table.getSign()) && !"shared".equals(table.getSign())) ? ("."+table.getSign()):"");
                File dir = new File(filePath + packageName);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                //生成Entity的类
                Template template = cfg.getTemplate("entity.java.ftl");
                FileWriter writer = new FileWriter(filePath + packageName
                        +File.separator  + table.getScode() + ".java");
                template.process(table, writer);


                //生成Dao的接口
                template = cfg.getTemplate("dao.java.ftl");
                packageName = table.getBasePackage() + ".dao"+ ((StringUtils.isNotEmpty(table.getSign()) && !"shared".equals(table.getSign())) ? ("."+table.getSign()):"");
                dir = new File(filePath + packageName);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                writer = new FileWriter(filePath + packageName
                        +File.separator + table.getScode() + "Dao.java");
                template.process(table, writer);

                //生成Dao的实现
                template = cfg.getTemplate("dao.impl.java.ftl");
                packageName = table.getBasePackage() + ".dao"+ ((StringUtils.isNotEmpty(table.getSign()) && !"shared".equals(table.getSign())) ? ("."+table.getSign()):"")+".impl";
                dir = new File(filePath + packageName);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                writer = new FileWriter(filePath + packageName + File.separator
                        + table.getScode() + "DaoImpl.java");
                template.process(table, writer);

                //生成Service的接口
                template = cfg.getTemplate("service.java.ftl");
                packageName = table.getBasePackage() + ".service"+ ((StringUtils.isNotEmpty(table.getSign()) && !"shared".equals(table.getSign())) ? ("."+table.getSign()):"");
                dir = new File(filePath + packageName);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                writer = new FileWriter(filePath + packageName + File.separator
                        + table.getScode() + "Service.java");
                template.process(table, writer);

                //生成Service的实现
                template = cfg.getTemplate("service.impl.java.ftl");
                packageName = table.getBasePackage() + ".service"+ ((StringUtils.isNotEmpty(table.getSign()) && !"shared".equals(table.getSign())) ? ("."+table.getSign()):"")+".impl";
                dir = new File(filePath + packageName);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                writer = new FileWriter(filePath + packageName + File.separator
                        + table.getScode() + "ServiceImpl.java");
                template.process(table, writer);

                //生成MyBatis的Mapper文件
                template = cfg.getTemplate("mapper.xml.ftl");

                dir = new File(filePath + "mybatis");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                writer = new FileWriter(filePath + "mybatis" + File.separator
                        + table.getScode() + "Mapper.xml");
                template.process(table, writer);

                //生成Controller
                /*template = cfg.getTemplate("controller.java.ftl");
                packageName = table.getBasePackage() + ".controller"+ ((StringUtils.isNotEmpty(table.getSign()) && !"shared".equals(table.getSign())) ? ("."+table.getSign()):"");
                dir = new File(filePath + packageName);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                writer = new FileWriter(filePath + packageName + File.separator
                        + table.getScode() + "Controller.java");
                template.process(table, writer);*/

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
