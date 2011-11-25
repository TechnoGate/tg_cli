require 'spec_helper'

module TgCli
  describe Main do
    subject { Main }

    let(:base) do
      Class.new(Base) do
        def execute
          true
        end
      end
    end

    let(:group_base) { Class.new(GroupBase) }

    context "#registering" do
      before(:each) do
        # Make the default task (help) return false
        class Main
          no_tasks do
            alias :orig_help :help
            def help
              false
            end
          end
        end
      end

      after(:each) do
        class Main
          no_tasks do
            alias :help :orig_help
            undef :orig_help
          end
        end
      end

      it {should respond_to :register }

      it "should register a base command as a single invokable" do
        name = "__test_registering_single_subcommand"
        subject.register(base, name, name, "A description")
        expect { subject.tasks[name] }.should_not raise_error
      end

      it "should register a group base as a subcommand" do
        name = "_test_registering_single_group"
        subject.register(group_base, name, name, "A description")
        subject.subcommands.should include(name)
      end

      it "should alias methods if the alias option is given" do
        name = "__test_registering_with_alias"
        subject.register(base, name, name, "A description", :alias => "--ALIAS")
        subject.start(["--ALIAS"]).should be_true
      end

      it "should make the method as the default command if the default option is given" do
        name = "__test_registering_as_default"
        subject.register(base, name, name, "A description", :default => true)
        subject.start([]).should be_true
      end
    end
  end
end
