require 'spec_helper'

describe FactoryGirl::DefinitionProxy do
  let(:factory) { FactoryGirl::Factory.new(:object) }
  subject { FactoryGirl::DefinitionProxy.new(factory) }

  it "should add a static attribute for type" do
    subject.type
    factory.attributes.last.should be_kind_of(FactoryGirl::Attribute::Static)
  end

  it "should add a static attribute for id" do
    subject.id
    factory.attributes.last.should be_kind_of(FactoryGirl::Attribute::Static)
  end

  it "should add a static attribute when an attribute is defined with a value" do
    attribute = 'attribute'
    stub(attribute).name { :name }
    mock(FactoryGirl::Attribute::Static).new(:name, 'value') { attribute }
    mock(factory).define_attribute(attribute)
    subject.add_attribute(:name, 'value')
  end

  it "should add a dynamic attribute when an attribute is defined with a block" do
    attribute = 'attribute'
    stub(attribute).name { :name }
    block     = lambda {}
    mock(FactoryGirl::Attribute::Dynamic).new(:name, block) { attribute }
    mock(factory).define_attribute(attribute)
    subject.add_attribute(:name, &block)
  end

  it "should raise for an attribute with a value and a block" do
    lambda {
      subject.add_attribute(:name, 'value') {}
    }.should raise_error(FactoryGirl::AttributeDefinitionError)
  end

  describe "adding an attribute using a in-line sequence" do
    it "should create the sequence" do
      mock(FactoryGirl::Sequence).new(1)
      subject.sequence(:name) {}
    end

    it "should create the sequence with a custom default value" do
      mock(FactoryGirl::Sequence).new("A")
      subject.sequence(:name, "A") {}
    end
    
    it "should add a dynamic attribute" do
      attribute = 'attribute'
      stub(attribute).name { :name }
      mock(FactoryGirl::Attribute::Dynamic).new(:name, is_a(Proc)) { attribute }
      subject.sequence(:name) {}
      factory.attributes.should include(attribute)
    end
  end

  it "should add a callback attribute when the after_build attribute is defined" do
    mock(FactoryGirl::Attribute::Callback).new(:after_build, is_a(Proc)) { 'after_build callback' }
    subject.after_build {}
    factory.attributes.should include('after_build callback')
  end

  it "should add a callback attribute when the after_create attribute is defined" do
    mock(FactoryGirl::Attribute::Callback).new(:after_create, is_a(Proc)) { 'after_create callback' }
    subject.after_create {}
    factory.attributes.should include('after_create callback')
  end

  it "should add a callback attribute when the after_stub attribute is defined" do
    mock(FactoryGirl::Attribute::Callback).new(:after_stub, is_a(Proc)) { 'after_stub callback' }
    subject.after_stub {}
    factory.attributes.should include('after_stub callback')
  end

  it "should add an association without a factory name or overrides" do
    name = :user
    attr = 'attribute'
    stub(attr).name { name }
    mock(FactoryGirl::Attribute::Association).new(name, name, {}) { attr }
    subject.association(name)
    factory.attributes.should include(attr)
  end

  it "should add an association with overrides" do
    name      = :user
    attr      = 'attribute'
    overrides = { :first_name => 'Ben' }
    stub(attr).name { name }
    mock(FactoryGirl::Attribute::Association).new(name, name, overrides) { attr }
    subject.association(name, overrides)
    factory.attributes.should include(attr)
  end

  it "should add an attribute using the method name when passed an undefined method" do
    attribute = 'attribute'
    stub(attribute).name { :name }
    block = lambda {}
    mock(FactoryGirl::Attribute::Static).new(:name, 'value') { attribute }
    subject.send(:name, 'value')
    factory.attributes.should include(attribute)
  end
end
