require 'spec_helper'

module TgCli
  describe Base do

    subject { Base }

    context "extracting a name from a usage string" do
      it "should extract properly" do
        subject.send(:extract_name_from_usage, "init").should == "init"
        subject.send(:extract_name_from_usage, "init [foo] [bar]").should == "init"
        subject.send(:extract_name_from_usage, "init <foo> [bar]").should == "init"
        subject.send(:extract_name_from_usage, "ssh-config").should == "ssh-config"
      end
    end

    context "Printing the help" do
      base = Base.new

      Main.expects(:help).with(base).once

      base.send :help
    end
  end
end
