package org.dclou.platform.adminservice;

import be.ordina.msdashboard.EnableMicroservicesDashboardServer;
import com.netflix.turbine.streaming.servlet.TurbineStreamServlet;
import de.codecentric.boot.admin.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.turbine.TurbineHttpConfiguration;
import org.springframework.context.annotation.Bean;

@EnableAdminServer
@EnableMicroservicesDashboardServer
@SpringCloudApplication
@EnableDiscoveryClient
@EnableConfigurationProperties
public class SpringBootAdminApplication extends TurbineHttpConfiguration {

	@Bean
	@Override
	public ServletRegistrationBean turbineStreamServlet() {
		return new ServletRegistrationBean(new TurbineStreamServlet(), "/admin/api/turbine/stream");
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringBootAdminApplication.class, args);
	}
}
