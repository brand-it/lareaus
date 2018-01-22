# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ImageHelper. For example:
#
# describe ImageHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ImageHelper, type: :helper do
  describe '#lazy_image_tag' do
    context 'does not exploid when the tag options is a bit weird' do
      subject { lazy_image_tag('happy.jpg', 'blank.jpg', tag_options: nil) }
      it { expect { subject }.to_not raise_exception }
    end
    context 'placeholder should not be required' do
      subject { lazy_image_tag('happy.jpg', nil) }
      it { expect { subject }.to_not raise_exception }
    end
    context 'src is a required argument' do
      subject { lazy_image_tag(nil, 'blank.jpg') }
      it { expect{ subject }.to raise_exception 'nil is not a valid asset source' }
    end
    context 'should return a nice html tag' do
      subject { lazy_image_tag('good.jpg', 'blank.jpg',) }
      it 'returns a full image tag' do
        is_expected.to eq(
          '<img data-src="/images/good.jpg" class="lazy" src="/images/blank.jpg" alt="Blank" />'
        )
      end
    end
    context 'lets me add custom class names to it' do
      subject { lazy_image_tag('good.jpg', 'blank.jpg', tag_options: { class: 'test' }) }
      it 'returns a full image tag' do
        is_expected.to eq(
          '<img class="lazy test" data-src="/images/good.jpg" src="/images/blank.jpg" alt="Blank" />'
        )
      end
    end

    context 'lets me change the alt text' do
      subject { lazy_image_tag('good.jpg','blank.jpg', tag_options: { alt: 'Custom Alt' }) }
      it 'returns a full image tag' do
        is_expected.to eq(
          '<img alt="Custom Alt" data-src="/images/good.jpg" class="lazy" src="/images/blank.jpg" />'
        )
      end
    end
    context 'lets me add some host image data if needed' do
      subject { lazy_image_tag('good.jpg','blank.jpg', img_options: { host: 'http://test.com' }) }
      it 'returns a full image tag' do
        is_expected.to eq(
          '<img data-src="http://test.com/images/good.jpg" class="lazy" src="http://test.com/images/blank.jpg"'\
          ' alt="Blank" />'
        )
      end
    end
  end
end
