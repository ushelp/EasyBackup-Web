package cn.easyproject.easybackupweb.listener;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.core.io.Resource;
import org.springframework.web.context.support.ServletContextResource;

import cn.easyproject.easybackup.EasyBackup;
import cn.easyproject.easybackup.sender.mail.MailSender;
import freemarker.template.Configuration;
import freemarker.template.TemplateExceptionHandler;

/**
 * EasyBackup Web Manager Initalize Parameter, Only execute once
 */
public class EasyBackupLoadListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public EasyBackupLoadListener() {
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 

    	//EasyBackup Web Manager Initalize Parameter, Only execute once
    	//Properties File
		Resource res = new ServletContextResource(sce.getServletContext(), "/easybackup.properties"); 
		try {
			EasyBackup.setPropertiesFile(res.getFile());
		} catch (IOException e) {
			e.printStackTrace();
		}

		//MailSender Configuration
		Configuration cfg= new Configuration(Configuration.VERSION_2_3_23);
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		cfg.setDefaultEncoding("UTF-8");
		cfg.setServletContextForTemplateLoading(sce.getServletContext(), "/template");
		MailSender.setFreemarkerConfiguration(cfg);
    }
	
}
