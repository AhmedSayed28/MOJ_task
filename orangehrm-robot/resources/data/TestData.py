import json
import os

from robot.libraries.BuiltIn import BuiltIn


class TestData:
    def __init__(self):
        self.data = None

    def load_test_data_file(self, path):
        absolute_path = os.path.abspath(path)
        with open(absolute_path, "r", encoding="utf-8") as handle:
            self.data = json.load(handle)
        BuiltIn().set_suite_variable("${TEST_DATA}", self.data)
        return self.data

    def get_test_data(self):
        if self.data is None:
            self.data = BuiltIn().get_variable_value("${TEST_DATA}")
        return self.data
