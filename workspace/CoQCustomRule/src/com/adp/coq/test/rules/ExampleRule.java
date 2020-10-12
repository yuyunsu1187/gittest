package com.adp.coq.test.rules;

import java.util.ArrayList;
import java.util.List;

import com.adp.coq.custom.issue.Issue;
import com.adp.coq.custom.rule.CustomRule;
import com.adp.coq.custom.rule.Priority;



public class ExampleRule implements CustomRule {

	private static final String RULE_ID                      = "ExampleRuleID";
	private static final String RULE_MESSAGE                 = "Example Rule Message";
	private static final String RULE_ORIGIN_DESCRIPTION_HTML = "ExampleRule<br>OriginalDescriptionHTML";
	
	
	
	@Override
	public String getRuleID() { return RULE_ID; }
	
	@Override
	public Priority getDefaultPriority() { return Priority.MAJOR; }
	
	@Override
	public String getMessage() { return RULE_MESSAGE; }
	
	@Override
	public String getOriginalDescriptionHTML() { return RULE_ORIGIN_DESCRIPTION_HTML; }
	
	
	
	@Override
	public List<Issue> executeRule(String absoluteFilePath) {
		
		System.out.println("[ExampleRuleLog] " + absoluteFilePath);														// NOSONAR
		
		List<Issue> issues = new ArrayList<>();
		issues.add(new Issue(absoluteFilePath, RULE_ID, RULE_MESSAGE));
		
		return issues;
	}
}
