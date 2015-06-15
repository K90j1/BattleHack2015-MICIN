require 'view_helper_config'

describe SocialButtons::ViewHelper do
  include ControllerTestHelpers,
          SocialButtons::ViewHelper

  describe '#google_plus_button' do
    context 'no arguments' do
      it "should not any args" do
        expect { google_plus_button }.to_not raise_error
      end
    end

    context 'with script and options' do
      it "should set annotation using option" do
        output = google_plus_button(:annotation => 'bubble', script: true)
        output.should match(/bubble/)
        output.should match(/<script/)

        output = google_plus_button(:annotation => 'none', script: true)
        output.should match(/none/)
        output.should_not match(/<script/)
      end
    end

    context 'with script - on next request' do
      it "should render script again on next request!" do
        output = google_plus_button(:annotation => 'bubble', script: true)
        output.should match(/bubble/)
        output.should match(/<script/)
      end
    end
  end
end