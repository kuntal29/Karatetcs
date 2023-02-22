package features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

//@KarateOptions(features = { "classpath:features" }, tags = { "@smoke" })

public class TestRunner1 {

	@Test
	public void testParallel() {
		// System.setProperty("karate.env", "qa"); // ensure reset if other tests (e.g.
		// mock) had set env in CI
		// Results results = Runner.parallel(getClass(),2);-working
		// generateReport(results.getReportDir()); - working
		// assertTrue(results.getErrorMessages(), results.getFailCount() == 0); -working
		// Junit5************************
		// Results results =
		// Runner.path("classpath:features").tags("@smoke").parallel(3);
		// assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
		// junit4*************************
		Results results = Runner.path("classpath:features").tags("@regression").parallel(2);
		assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
	}

	public static void generateReport(String karateOutputPath) {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		final List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File("target"), "karatetest");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}
}



