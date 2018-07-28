require_relative '../spec_helper'

describe PromiseOpenObject do
  it "should act as an openstruct" do
    object = described_class.new(name: 'David', surname: 'Santoro')

    expect(object.name).to eq 'David'
    expect(object.surname).to eq 'Santoro'
  end

  it "should raise an error when accessing a field that doesn't exist" do
    object = described_class.new({name: 'David', surname: 'Santoro'})

    expect { object.age }.to raise_error(NoMethodError)
  end

  it 'implements the array accessor' do
    a = described_class.new({ name: 'Joe', age: 13 })

    expect(a[:name]).to eq('Joe')
    expect(a[:age]).to eq(13)
  end

  it 'implements the array assignment' do
    a = described_class.new({ name: 'Joe', age: 13 })
    a[:something] = 'b'

    expect(a[:something]).to eq('b')
    expect(a.something).to eq('b')
  end

  it "should implement equality operators correctly" do
    a = described_class.new({name: 'Joe', age: 13})
    b = described_class.new({name: 'Joe', age: 13})
    c = described_class.new({name: 'Mike', age: 13})

    list = [a, b, c]

    expect(a == b).to eq true
    expect(a.eql?(b)).to eq true
    expect(a.equal?(b)).to eq false

    expect(a == c).to eq false
    expect(a.eql?(c)).to eq false
    expect(a.equal?(c)).to eq false
    expect(list.uniq.length).to eq 2
  end

  context 'when a block is passed' do
    it 'executes the blocks in parallel' do
      start_time = Time.now
      a = described_class.new { sleep 1; {value: :a} }
      b = described_class.new { sleep 1; {value: :b} }

      expect(a.value).to eq(:a)
      expect(b.value).to eq(:b)

      expect((Time.now - start_time) < 2).to be_truthy
    end

    it 'implements equality correctly' do
      a = described_class.new { { name: 'Joe', age: 13 } }
      b = described_class.new { { name: 'Joe', age: 13 } }
      c = described_class.new { { name: 'Mike', age: 13 } }

      expect(a == b).to eq true
      expect(a.eql?(b)).to eq true
      expect(a.equal?(b)).to eq false

      expect(a == c).to eq false
      expect(a.eql?(c)).to eq false
      expect(a.equal?(c)).to eq false

      list = [a, b, c]
      expect(list.uniq.length).to eq 2
    end

    it 'implements the array accessor' do
      a = described_class.new { { name: 'Joe', age: 13 } }

      expect(a[:name]).to eq('Joe')
      expect(a[:age]).to eq(13)
    end

    it 'implements the array assignment' do
      a = described_class.new { { name: 'Joe', age: 13 } }
      a[:something] = 'b'

      expect(a[:something]).to eq('b')
      expect(a.something).to eq('b')
    end

    context 'when the block raises an exception' do
      it 'raises the exception if a value is accessed' do
        object = described_class.new { raise 'oops' }

        expect { object.value }.to raise_error 'oops'
      end
    end
  end
end
