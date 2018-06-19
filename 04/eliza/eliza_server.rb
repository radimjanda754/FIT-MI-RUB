require 'gserver'

class ElizaServer < GServer
  def initialize(port)
    super(port)
    @request_cnt = 0
  end

  def serve(io)
    @request_cnt += 1
    log "request \##{@request_cnt}"
    loop do
      line = io.readline.strip
      log "recv: '#{line.strip}'"
      reply = eliza_logic(line)
      log "repl: '#{reply}'"
      io.puts reply
    end
  end

  protected

  def eliza_logic(input)
    inputdown = input.downcase
    response = 'Wassup bruh?'
    response = 'Hello. My name is Eliza. How may I help you?' if inputdown.include? 'hello'
    response = 'Maybe you should consult a doctor of medicine.' if inputdown.include? 'ache'
    response = 'Say, do you have any psychological problems?' if inputdown.include? 'problem'
    response = 'You mentioned your mother, how\'s your relationship?' if inputdown.include? 'mother'
    response = 'We were discussing you, not me.' if inputdown.include? 'do you'
    response = 'Are you sure?' if inputdown.include? 'really'
    response = 'Do you really think so?' if inputdown.include? 'i think'
    response
  end
end
