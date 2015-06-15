require 'view_helper_config'

describe SocialButtons::ViewHelper do
  include ControllerTestHelpers,
          SocialButtons::ViewHelper

  describe '#pinit_button' do
    context 'no arguments' do
      it "should not any args" do
        expect { pinit_button }.to_not raise_error
      end
    end

    context 'with options' do
      it "should set description using option" do
        output = pinit_button(:colorscheme => 'dark')
        output.should match(/dark/)
        output.should match(/<script/)

        output = pinit_button(:colorscheme => 'dark')
        output.should_not match(/<script/)
      end
    end

    context 'with script - on next request' do
      it "should render script again on next request!" do
        output = pinit_button(:colorscheme => 'dark')
        output.should match(/dark/)
        output.should match(/<script/)
      end
    end
  end
end