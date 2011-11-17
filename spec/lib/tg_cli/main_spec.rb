require 'spec_helper'

module TgCli
  describe Main do
    subject { Main }

    context "#registering" do
      it {should respond_to :register }

      it "should register a base command as a single invokable" do
        base = Class.new(Base)
        name = "__test_registering_single_subcommand"
        subject.register(base, name, name, "A description")
        expect { subject.tasks[name] }.should_not raise_error
      end

      it "should register a group base as a subcommand" do
        base = Class.new(GroupBase)
        name = "_test_registering_single_group"
        subject.register(base, name, name, "A description")
        subject.subcommands.should include(name)
      end

      it "should alias methods if the alias option is given" do
        base = Class.new(Base) do
          def execute
            true
          end
        end

        name = "__test_registering_with_alias"
        subject.register(base, name, name, "A description", :alias => "--ALIAS")
        subject.start(["--ALIAS"]).should be_true
      end
    end
  end
end
