require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @conversation = conversations(:one) # Assuming you have a fixture for conversations
  end

  test 'should get index' do
    get conversation_messages_url(@conversation)
    assert_response :success
  end

  test 'should create message' do
    assert_difference('Message.count', 1) do
      post conversation_messages_url(@conversation), params: { message: { body: 'Test message', user_id: 1 } }
    end
    assert_redirected_to conversation_messages_url(@conversation)
  end

  test 'should get new' do
    get new_conversation_message_url(@conversation)
    assert_response :success
  end

  test 'should destroy message' do
    message = messages(:one) # Assuming you have a fixture for messages
    assert_difference('Message.count', -1) do
      delete conversation_message_url(@conversation, message)
    end
    assert_redirected_to conversation_messages_url(@conversation)
  end
end
