package com.allinpay.ets.client;

import freemarker.template.Configuration;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.controller.mall.PaymentController;
import net.deepdragon.weipu.listeners.ApplicationContextListener;
import net.deepdragon.weipu.tools.PropertiesUtil;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.web.context.WebApplicationContext;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.*;
import java.nio.channels.FileChannel;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanc on 2016/3/22.
 */
public class CustomsResponseTimer implements Job {

    private static String path = PropertiesUtil.getValue("allinpay.properties", "xmlPath_response");

    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        if (path == null) {
            return;
        }
        File file = new File(path);
        if (file.exists()) {
            for (File f : file.listFiles()) {
                if (f.isFile()) {
                    try {
                        //更新订单状态
                        updateOrderStatus(readXml(f));
                    } catch (Exception e) {
                        //出问题的文件备份下。
                        File bak = new File(path + "/error/" + f.getName());
                        copyFile(f, bak);
                        System.out.println(e);
                    } finally {
                        //不论结果如何，都需要删除该文件
                        File bak = new File(path + "/error/" + f.getName());
                        copyFile(f, bak);
                        f.delete();
                    }
                }
            }
        }

    }

    //读取返回文件，全部置入Map中
    public Map readXml(File file) throws Exception {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        InputStream is = new FileInputStream(file);
        Document document = builder.parse(is);
        NodeList allNodes = document.getFirstChild().getChildNodes();
        Node node;
        Map<String, Object> map = new HashMap<String, Object>();
        int i = 0;
        while (i < allNodes.getLength()) {
            node = allNodes.item(i);
            if (node instanceof Element) {
                map.put(node.getNodeName(), node.getTextContent());
            }
            i++;
        }
        return map;
    }

    public void copyFile(File from, File to) {
        if (!to.getParentFile().exists()) {
            to.getParentFile().mkdirs();
            try {
                to.createNewFile();
            } catch (Exception e) {

            }
            FileInputStream fi = null;
            FileOutputStream fo = null;
            FileChannel in = null;
            FileChannel out = null;
            try {
                fi = new FileInputStream(from);
                fo = new FileOutputStream(to);
                in = fi.getChannel();//得到对应的文件通道
                out = fo.getChannel();//得到对应的文件通道
                in.transferTo(0, in.size(), out);//连接两个通道，并且从in通道读取，然后写入out通道

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                try {
                    fi.close();
                    in.close();
                    fo.close();
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void updateOrderStatus(Map map) throws Exception {
        WebApplicationContext webApplicationContext = (WebApplicationContext) ApplicationContextListener.getServletContext().getAttribute("org.springframework.web.servlet.FrameworkServlet.CONTEXT.springmvc");
        PaymentController paymentController = BeanFactoryUtils.beanOfTypeIncludingAncestors(webApplicationContext, PaymentController.class, true, false);
        paymentController.updateCustomOrder(map);
    }

    public static void startJob() {
        try {

            Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
            if (scheduler.getTrigger("customsTrigger", "customs") != null) {
                return;
            }
            // 任务名称
            String jobName = "demoJob";
            // 组名称
            String groupName = Scheduler.DEFAULT_GROUP;
            // 执行的Job
            Class<? extends CustomsResponseTimer> jobClazz = CustomsResponseTimer.class;
            // 动态参数
            String param = "param";
            JobDetail jobDetail = new JobDetail(jobName, groupName, jobClazz);
            jobDetail.getJobDataMap().put("param", param);

            // 触发达表示
            String express = "0/30 * * * * ?";
            CronTrigger trigger = new CronTrigger("customsTrigger", "customs", express);

            scheduler.scheduleJob(jobDetail, trigger);
            scheduler.start();

        } catch (Exception e) {

        }
    }

    public static void endJob() {
        try {
            StdSchedulerFactory.getDefaultScheduler().deleteJob("customsTrigger", "customs");
        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {
        CustomsResponseTimer.startJob();
        ;
    }
}
