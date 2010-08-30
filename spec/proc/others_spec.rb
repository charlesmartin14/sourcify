require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "Misc" do

  should 'handle accessing #to_sexp after #to_source' do
    (s_proc = lambda { :test }).to_source
    s_proc.should.be having_sexp(s(:iter, s(:call, nil, :proc, s(:arglist)), nil, s(:lit, :test)))
  end

  should 'handle accessing #to_source after #to_sexp' do
    (s_proc = lambda { :test }).to_sexp
    s_proc.should.be having_source('proc { :test }')
  end

  should "handle lexer bug in missing trailing chars after '=>' operator" do
    # This example addresses bug @ http://redmine.ruby-lang.org/issues/show/3765
    {
      __LINE__ => lambda { :test }
    }.values.last.should.be having_source('proc { :test }')
  end

  should "handle lexer bug in missing trailing chars after '=>' operator" do
    # This example addresses bug @ http://redmine.ruby-lang.org/issues/show/3765
    {
      __LINE__ => lambda do :test end
    }.values.last.should.be having_source('proc { :test }')
  end

end
