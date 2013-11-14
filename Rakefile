require File.expand_path('../config/application', __FILE__)

DinnerDash::Application.load_tasks

MiniTest::Rails::Testing.default_tasks << "features" if Rails.env == "test"
