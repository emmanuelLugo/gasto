package com.py.api.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class HostnameUtil {
	private static List<String> allowedHostnames;

	public static void hostnames() {
		allowedHostnames = new ArrayList<>();
		allowedHostnames.add("BFEBFBFF000906EA");
		allowedHostnames.add("BFEBFBFF000906E9");
		allowedHostnames.add("BFEBFBFF000906EA");
		allowedHostnames.add("BFEBFBFF000906ED");
		allowedHostnames.add("BFEBFBFF000A0652");
	}

	public static boolean checkHostname() {
		hostnames();
		try {
			String id = getPCIdentifier();
			return allowedHostnames.contains(id);
		} catch (UnknownHostException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public static String getPCIdentifier() throws Exception {
		String osName = System.getProperty("os.name").toLowerCase();
		String identificadorPC = "";

		try {
			if (osName.contains("win")) {
				Process process = Runtime.getRuntime().exec(new String[] { "wmic", "cpu", "get", "processorId" });
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8));

				String line;
				StringBuilder output = new StringBuilder();
				while ((line = reader.readLine()) != null) {
					output.append(line.trim());
				}

				identificadorPC = output.toString().replaceAll("ProcessorId", "").replaceAll(" ", "");
			} else {
				throw new UnsupportedOperationException("El sistema operativo no es compatible.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return identificadorPC;
	}
}
