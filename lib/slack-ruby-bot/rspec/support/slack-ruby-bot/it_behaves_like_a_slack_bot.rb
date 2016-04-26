shared_examples 'a slack ruby bot' do
  context 'not configured' do
    before do
      SlackRubyBot.configure do |c|
        c.token = nil
      end
      @slack_api_token = ENV.delete('SLACK_API_TOKEN')
    end
    after do
      ENV['SLACK_API_TOKEN'] = @slack_api_token
      SlackRubyBot.configure do |c|
        c.token = 'testtoken'
      end
    end
    it 'requires SLACK_API_TOKEN' do
      expect { subject }.to raise_error RuntimeError, "Missing ENV['SLACK_API_TOKEN']."
    end
  end

  context 'token configured' do
    it 'does not require SLACK_API_TOKEN' do
      expect { subject }.not_to raise_error
    end
  end
end
