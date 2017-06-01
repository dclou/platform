package org.dclou.platform.adminservice;

import de.codecentric.boot.admin.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import be.ordina.msdashboard.EnableMicroservicesDashboardServer;

@EnableAdminServer
@EnableMicroservicesDashboardServer
@SpringCloudApplication
public class SpringBootAdminApplication {
	public static void main(String[] args) {
		SpringApplication.run(SpringBootAdminApplication.class, args);
	}
}
