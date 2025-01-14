package com.univ.ser;

public class TestProgress {
	private String testName;
    private int score;

    public TestProgress(String testName, int score) {
        this.testName = testName;
        this.score = score;
    }

    public String getTestName() {
        return testName;
    }

    public int getScore() {
        return score;
    }

}
