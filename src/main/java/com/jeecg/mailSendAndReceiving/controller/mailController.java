package com.jeecg.mailSendAndReceiving.controller;

import com.jeecg.MaterialsInPut.entity.RepSubstanceStorageEntity;
import com.jeecg.mailSendAndReceiving.service.MailParsing;
import com.jeecg.mailSendAndReceiving.service.SendMailService;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.util.UUIDGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("mailController")
public class mailController extends BaseController {

    @RequestMapping(params = "showMail")
    public String showMailPage() {
        return "jzwz/MailSendAndReceiving/mail_send";
    }

    @RequestMapping(params = "showMailBox")
    public String showMailBoxPage() {
        return "jzwz/MailSendAndReceiving/mailbox";
    }

    @RequestMapping(params = "send")
    public String send(String email, String title, String content, HttpServletRequest request) {
//       邮件中的所有图片和附件
//      从正文(content)中取图片文件路径的起始位置
        List<String> imgList = new ArrayList<String>();
        int i = 0;
        int indexOf = -1;
        do {
            i++;
            indexOf = content.indexOf("img src", indexOf + 1);
            String imgPath = null;
            if (indexOf > 0) {
//              计算文件名的起始位置
                int start = indexOf + 9;
                int end = start + 40;
//              取出文件相对路径
                String subPath = content.substring(start, end);
//              获取文件的绝对路径
                HttpSession session = request.getSession();
                imgPath = session.getServletContext().getRealPath(subPath);
                imgList.add(imgPath);
            }
        } while (indexOf > 0);

//        计算所有附件路径
        List<String> attachmentList = new ArrayList<String>();
        i = 0;
        indexOf = -1;
        do {
            i++;
            indexOf = content.indexOf("href=", indexOf + 1);
            String attachmentPath = null;
            if (indexOf > 0) {
                int start = indexOf + 7;
                int end = content.indexOf("\"", indexOf + 7);
//              取出文件相对路径
                String subPath = content.substring(start, end);

                // 获取文件的绝对路径
                HttpSession session = request.getSession();
                attachmentPath = session.getServletContext().getRealPath(subPath);
                System.out.println(attachmentPath);
                attachmentList.add(attachmentPath);
            }
        } while (indexOf > 0);

//      新建邮件发送类
        SendMailService sendMail = new SendMailService();
//      设定发件人(测试阶段)
        String sender = "1441249420@qq.com";
        try {
//      发送邮件，传递发件人，正文，收件人，主题，媒体路径
            sendMail.send(sender, content, email, title, imgList, attachmentList);
        } catch (Exception e) {
            System.out.println("发送失败");
        }
        return "jzwz/MailSendAndReceiving/mailbox";
    }

    List<Map<String, Object>> mailList = null;

    //    收信
    @RequestMapping(params = "receive")
    public String receive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("开始收件...");
        MailParsing mailParsing = new MailParsing();
        try {
            String path = request.getServletContext().getRealPath("/");
//            设置附件存储位置的相对路径
            MailParsing.path = path;
//            获取收件箱中所有邮件
            mailList = MailParsing.resceive();

            HttpSession session = request.getSession();
//            request.setAttribute("mailList", mailList);
            session.setAttribute("mailList", mailList);
//            request.setAttribute("mailTotal", mailList.get(mailList.size() - 1).get("mailTotal"));
            session.setAttribute("mailTotal", mailList.get(mailList.size() - 1).get("mailTotal"));
        } catch (Exception e) {
            System.out.println("邮件解析异常：" + e.getMessage());
        }
        System.out.println("收件完成!");
        return "jzwz/MailSendAndReceiving/mailbox";
    }

    //    收信详情
    @RequestMapping(params = "deatil")
    public String detailPage(HttpServletRequest request, HttpServletResponse response, String index) {
//        从收件箱点击邮件的索引
        int j = Integer.parseInt(index);
//        从所有邮件中取出点击的那一封
        Map<String, Object> map = mailList.get(j);
//        获取邮件正文
        String content = map.get("content").toString();
//        删除旧的正文
        map.remove("content");
//        获取项目名称，方便添加在附件访问路径前
        String appName = request.getServletContext().getContextPath();
//        计算出所有附件的路径，并将邮件服务器更改的路径替换为附件本地下载的路径
        int i = 0;
        int indexOf = -1;
        do {

            i++;
            indexOf = content.indexOf("cid:", indexOf + 1);

            if (indexOf > 0) {
                int s1 = indexOf;
                int s2 = content.indexOf("\"", indexOf + 1);

                String subBefore = content.substring(0, s1);
                String subAfter = content.substring(s2);
                content = subBefore + "ueditor/upload/image" + "/" + i + ".jpg" + subAfter;
            }

        } while (indexOf > 0);
//        判断是否是第二次访问次方法，如果是，则不需要添加
        if (content.indexOf(appName + "/ueditor/jsp/upload/file") == -1) {
//            添加项目名在所有附件访问路径前
            i = 0;
            indexOf = -1;
            do {

                i++;
                indexOf = content.indexOf("href=", indexOf + 1);

                if (indexOf > 0) {
                    int s1 = indexOf + 6;
                    int s2 = content.indexOf("\"", indexOf + 1);

                    String subBefore = content.substring(0, s1);
                    String subAfter = content.substring(s2 + 1);
                    content = subBefore + appName + subAfter;
                }

            } while (indexOf > 0);
        }
//        将正文中替换好的附件路径和正文放回邮件中
        map.put("content", content);
        request.setAttribute("mail", map);
        return "jzwz/MailSendAndReceiving/mail_detail";
    }

    //    附件上传
    @RequestMapping(params = "upload")
    public String saveOrupdate(RepSubstanceStorageEntity repSubstanceStorageEntity, HttpServletRequest request, String ctrl,
                               @RequestParam(value = "uploadFile") MultipartFile uploadFile) {
        //文件上传
        try {
            //取文件名
            String originalFilename = uploadFile.getOriginalFilename();
            //取文件后缀
            String extName = originalFilename.substring(originalFilename.lastIndexOf("."));
            //拼写图片url,跟着项目路径走
            String path = request.getServletContext().getRealPath("/ueditor/upload/attachment");
            //保存时的文件名
            String fileName = UUIDGenerator.generate() + extName;
            File file = new File(path, fileName);
            //保存
            uploadFile.transferTo(file);
            request.setAttribute("message", "文件上传成功!");
        } catch (Exception e) {
            //todo 文件上传出错处理
            request.setAttribute("message", "上传失败: " + e.getMessage());
        }
        return "jzwz/MailSendAndReceiving/mail_send";
    }

}
